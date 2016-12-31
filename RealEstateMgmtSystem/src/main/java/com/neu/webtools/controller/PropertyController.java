package com.neu.webtools.controller;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.DocumentException;
import com.neu.webtools.dao.PropertyDAO;
import com.neu.webtools.pojo.Booking;
import com.neu.webtools.pojo.Property;
import com.neu.webtools.pojo.User;

import antlr.PrintWriterWithSMAP;



@Controller
public class PropertyController {
    
	/*@Autowired
	@Qualifier("propertyValidator")
	private Validator validator;*/

	@Autowired
	private PropertyDAO propertyDAO;

	/*@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}*/
	
	
	
	
	
	@RequestMapping(value = "/addPropertyDetails", method = RequestMethod.POST)
	public String addPropertyDetails( Model model, //@ModelAttribute("property") @Validated
			Property property, BindingResult result, HttpServletRequest request){
	   try{
		System.out.println("Inside Controller");
		String page = "";
        HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		property.setUser(u);
		System.out.println("Inside seller");
		if (u != null && u.getRole().equals("ROLE_USER")) {
			if (result.hasErrors()) {
				System.out.println("Inside If");
				page = "sell";
			} else {

				try {
					System.out.println("IN ADD");
					boolean flag = propertyDAO.addProperty(property);
					
		
					if (flag) {
						model.addAttribute("message",
								"Property has been added successfully");
						model.addAttribute("task", "success");
						System.out.println("IN CREATE Apartment");
						model.addAttribute("prop", property.getPropertyId());
						page = "registerProperty";
						
					} else {
						model.addAttribute("message",
								"Error! Property cannot be added");
						model.addAttribute("task", "failure");
						model.addAttribute("property", new Property());
						page = "sell";

					}
				} catch (Exception e) {
					
					// TODO Auto-generated catch block
					e.printStackTrace();
				return page;
				}

			}

			return page;
		} else {

			Property prop = new Property();
			model.addAttribute("property", prop);
			return "home";

		}
	   } catch (Exception e) {
           // TODO Auto-generated catch block
           return "error";
       }

	}
	
	@RequestMapping(value = "/viewAllBuyProperty", method = RequestMethod.GET)
	public String viewAllProperties(Locale locale, Model model,
			HttpServletRequest request,HttpServletResponse hsr1) throws JSONException  {

		try{
		ArrayList<Property> listOfProperty = propertyDAO.getBuyPropertyList();
			
			model.addAttribute("listOfProperty", listOfProperty);
			JSONArray array = new JSONArray();
			
			for(Property prop : listOfProperty){
				JSONObject obj = new JSONObject();
				obj.put("id", prop.getPropertyId());
				array.put(obj);
			}
			
			PrintWriter out=null;
			try {
				out = hsr1.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//obj.put("fs", "this");
			request.setAttribute("test",array);
			System.out.println("JSOn Object Length "+array.length());

			return "buy";
		} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
	}

	
	@RequestMapping(value = "/propertyDetailsPage")
	public String propertyDetails(Model model, HttpServletRequest request) {

		try{
			HttpSession session = request.getSession();
		
		//User u = (User) session.getAttribute("user");
		//if (u != null && u.getRole().equals("ROLE_USER")) {
			String id = request.getParameter("propertySearchId");
			Property p = propertyDAO.propsearchbyId(id);
			model.addAttribute("property",p);
			
			return "propertyDetails";
//		} else {
//
//			User user = new User();
//			model.addAttribute("user", user);
//			return "signIn";
//		}
			} catch (Exception e) {
            // TODO Auto-generated catch block
            return  "error";
        }
	}

	
	@RequestMapping(value = "/viewPropertyDetails", method = RequestMethod.GET)
	public String viewPropertysDetails(Locale locale, Model model,
			@RequestParam("id") int id, HttpServletRequest request) {

		try{
			HttpSession session = request.getSession();
		
		User u = (User) session.getAttribute("user");
		if (u != null && u.getRole().equals("ROLE_USER")) {

			Property property = null;
			ArrayList<Property> listOfProperty = null;
			try {
				listOfProperty = propertyDAO.getPropertyList();
				property = propertyDAO.searchPropertyByID(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("property" + property.getPropertyType());
			model.addAttribute("listOfProperty", listOfProperty);
			model.addAttribute("property", property);
			model.addAttribute("from", "viewDetails");
			return "viewProperty";
		} else {

			User user = new User();
			model.addAttribute("user", user);
			return "home";

		}} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }

	}
	

	
	@RequestMapping(value = "/searchbycriteria", method = RequestMethod.POST)
    public String searchPropertyByCriteria( Locale locale,
			HttpServletRequest request, Model model,
			@RequestParam("type") String type,
			@RequestParam("location") String city,
			@RequestParam("pricefrom") long pricefrom,
			@RequestParam("priceto") long priceto) throws IOException{
        try{
		ArrayList<Property> propertyList = propertyDAO.searchPropertyByCriteria(city, type, pricefrom, priceto);
        model.addAttribute("propertyList",propertyList);
        return "searchOutput";
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
    }
	
	@RequestMapping(value = "/updatePropertyDetails", method = RequestMethod.GET)
	public String updatePropertyDetails(Locale locale, Model model,
			@RequestParam("id") int id, HttpServletRequest request) {
		try{
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u != null && u.getRole().equals("ROLE_USER") && u.getRole().equals("ROLE_ADMIN")) {
			Property Property = null;
			try {
				Property = propertyDAO.searchPropertyByID(id);
				System.err.println("property" + Property.getPropertyId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("propertyId", id);
			model.addAttribute("property", Property);
			return "UpdateProperty";
		} else {

			User user = new User();
			model.addAttribute("user", user);
			return "home";

		}} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }

	}

	@RequestMapping(value = "/deleteProperty", method = RequestMethod.GET)
	public String deleteProperty(Locale locale, Model model,
			@RequestParam("id") int id, HttpServletRequest request) {
		try{
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u != null && u.getRole().equals("ROLE_USER") && u.getRole().equals("ROLE_ADMIN")) {
			propertyDAO.deleteSelectedProperty(id);
			ArrayList<Property> listOfProperty = propertyDAO.getPropertyList();
			model.addAttribute("from", "viewProperty");
			model.addAttribute("listOfProperty", listOfProperty);
			return "viewProperty";
		} else {

			User user = new User();
			model.addAttribute("user", user);
			return "home";

		}} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }

	}


	@RequestMapping(value = "/confirmBooking", method = RequestMethod.POST)
	public String confirmBookingProceedToPay(Locale locale, Model model,
			HttpServletRequest request) {
		System.out.println("reached in confirm booking");
		
		try{
		HttpSession session = request.getSession();
		
		String val = request.getParameter("bookingAmount");
		User u = (User) session.getAttribute("user");
		if (u != null && u.getRole().equals("ROLE_USER")) {
			String id = request.getParameter("propertySearchId");
			System.out.println("reached in confirm booking "+id);
			Property p = propertyDAO.propsearchbyId(id);
			model.addAttribute("property",p);
			model.addAttribute("bookingAmount", val);
			System.out.println("bookingAmount"+val);
			return "Payment";
		} else {

			User user = new User();
			model.addAttribute("user", user);
			return "signIn";

		}
		} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
	}
	
	

	@RequestMapping(value = "/bookProperty", method = RequestMethod.POST)
	public String bookProperty(Locale locale, Model model,HttpServletRequest request) {
		
		try{
			HttpSession session = request.getSession();
		
		User u = (User) session.getAttribute("user");
		if (u != null ) {
		String id = request.getParameter("propertySearchId");
		System.out.println("id");
		Property p = propertyDAO.propsearchbyId(id);
		model.addAttribute("property",p);
		model.addAttribute("bookingAmount", request.getParameter("bookingAmount"));
		
		return "bookingConfirmation";
		
	} else {

		User user = new User();
		model.addAttribute("user", user);
		return "signIn";

	}
		} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
	}
	
	@RequestMapping(value = "/paymentConfirmation", method = RequestMethod.POST)
	public String paymentConfirmationMethod(Locale locale, Model model,
			HttpServletRequest request) throws DocumentException, MalformedURLException, IOException {
		
		try{
		
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u != null ) {
			System.out.println("Inside Role");
			
			User user = (User) session.getAttribute("user");
			String id = request.getParameter("propertySearchId");
			System.out.println(id);
			Property property = propertyDAO.propsearchbyId(id);
			System.out.println(property);
			model.addAttribute("property",property);
			Booking booking = new Booking();
			int totalAmount =  Integer.parseInt(request.getParameter("bookingAmount"));
			System.out.println("amount is "+totalAmount);
			booking.setTotalAmount(totalAmount);
			booking.setProperty(property);
			booking.setBuyer(user);
			Date transactionDate = new Date();
		
			booking.setBookingDate(transactionDate);
			
			
			propertyDAO.sendMail(user, "Your Property has been booked successfully",
					booking,property);
			model.addAttribute("message", "Your Property has been booked successfully");
			
			
			
			
			propertyDAO.bookProperty(property.getPropertyId(), booking);
			System.out.println(user.getFirstName());
			model.addAttribute("email",user.getEmail());
			return "messageSuccess";

		} else {

			User user = new User();
			model.addAttribute("user", user);
			return "home";

		}} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
		
		
	}
		
	
	
}
