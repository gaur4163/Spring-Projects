package com.neu.webtools.controller;



import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.neu.webtools.dao.PropertyDAO;
import com.neu.webtools.dao.UserDAO;
import com.neu.webtools.pojo.Booking;
import com.neu.webtools.pojo.User;


@Controller
public class AdminController {

	

	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public String aboutHome(Locale locale, Model model,HttpServletRequest request) {
		/*HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u != null && u.getRole().equals("ROLE_ADMIN")){
			
			return "adminPage";
			
		}else{
			User user = new User();
			model.addAttribute("user", user);*/
			return "adminPage";
			
		
		
	}

	@RequestMapping(value="/returnbooking", method=RequestMethod.GET)
    public void getBookingList(HttpServletResponse response) throws IOException, JSONException{
        System.out.println("Call returncollege");
        PropertyDAO propertyDAO = new PropertyDAO();
        ArrayList<Booking> bookingList = propertyDAO.getBookingList();
        JSONArray jsArray = new JSONArray();
        for(Booking booking: bookingList){
            JSONObject jObjd=new JSONObject();
            jObjd.put("BookingId", booking.getBookingId());
            jObjd.put("BookingDate", booking.getBookingDate());
            jObjd.put("PropertyDescription",booking.getProperty().getDescription());
            jObjd.put("BookingAmount",booking.getTotalAmount());
            jObjd.put("PropertyPrice",booking.getProperty().getPrice() );
            jObjd.put("PropertyAddress", booking.getProperty().getAddress());
            jObjd.put("PropertyType", booking.getProperty().getPropertyType());
            jObjd.put("PropertyCategory", booking.getProperty().getPropertyCategory());
            jObjd.put("UserFirstName", booking.getBuyer().getFirstName());
            jObjd.put("UserLastName", booking.getBuyer().getLastName());
            jObjd.put("UserEmail", booking.getBuyer().getEmail());
            jObjd.put("PropertyImage", booking.getProperty().getImage());
            jsArray.put(jObjd);
        }
        System.out.println("this "+jsArray);
        PrintWriter out = response.getWriter();
        out.println(jsArray);
        /*Gson gson = new GsonBuilder().create();
        JsonArray a = gson.toJsonTree(bookingList).getAsJsonArray();
        PrintWriter out = response.getWriter();
        out.println(a);*/
    }
	
	
	
	
	
	

	@RequestMapping(value = "/viewBookings", method = RequestMethod.GET)
	public String viewRoomBookings(Locale locale, Model model,HttpServletRequest request) {
	try{	HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u != null && u.getRole().equals("ROLE_ADMIN")){
			
			return "viewBookings";
			
		}else{
			User user = new User();
			model.addAttribute("user", user);
			return "home";
			
		}} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
	}

}

