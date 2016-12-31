package com.neu.webtools.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.webtools.dao.DAO;
import com.neu.webtools.dao.PropertyDAO;
import com.neu.webtools.dao.UserDAO;
import com.neu.webtools.exception.AdException;
import com.neu.webtools.pojo.Address;
import com.neu.webtools.pojo.Property;
import com.neu.webtools.pojo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private PropertyDAO propertyDAO;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws AdException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws AdException {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		ArrayList<Property> listOfProperty = propertyDAO.getPropertyListRecent();
		ArrayList<Property> listOfOffice = propertyDAO.getOfficeListRecent();
		
		model.addAttribute("listOfProperty", listOfProperty);
		model.addAttribute("listOfOffice", listOfOffice);
		
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	@RequestMapping(value = "/twesdqadmin", method = RequestMethod.GET)
	  public String adminPage(Model model) {
	      model.addAttribute("title", "Admin");
	      model.addAttribute("message", "Admin Page - This is protected page!");
	      return "adminPage";
	  }
	
	@RequestMapping(value = {"/home","/addPropertyDetails","/searchbycriteria",
			"/confirmBooking","/bookProperty","/paymentConfirmation","/usermsgScreen","/userSendMessage","/addMoreImages","/login","/signUpAUser"}, method = RequestMethod.GET)
	public String homePage(Locale locale, Model model) {
		try{
		ArrayList<Property> listOfProperty = propertyDAO.getPropertyListRecent();
		ArrayList<Property> listOfOffice = propertyDAO.getOfficeListRecent();
		
		model.addAttribute("listOfProperty", listOfProperty);
		model.addAttribute("listOfOffice", listOfOffice);
		
		
		return "home";} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
	}
	 
	
	  
	  @RequestMapping(value = "/signIn", method = RequestMethod.GET)
		public String signIn(Locale locale, Model model) {
			model.addAttribute("user", new User());
			return "signIn";
		}
	  
	  @RequestMapping(value = "/sell", method = RequestMethod.GET)
		public String sell(Locale locale, Model model) {
			model.addAttribute("property", new Property());
			model.addAttribute("address", new Address());
			return "sell";
		}
	  
	  @RequestMapping(value = "/Agents", method = RequestMethod.GET)
		public String agents(Locale locale, Model model) {
		
			return "Agents";
		}
	  
	  
	  @RequestMapping(value = "/signup", method = RequestMethod.GET)
		public String signUp(Locale locale, Model model) {
			model.addAttribute("user", new User());
			return "signup";
		}
	  
	  @RequestMapping(value="/logoutAdmin", method = RequestMethod.GET)
	  public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	     Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	     if (auth != null){    
	         new SecurityContextLogoutHandler().logout(request, response, auth);
	     }
	     return "redirect:/home";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	  }
	  
	  
	  @RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	  public String logoutSuccessfulPage(Model model) {
	      model.addAttribute("title", "Logout");
	      return "logoutSuccessfulPage";
	  }
	 
	  @RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	  public String loginPage(Model model, Principal principal) {
	      model.addAttribute("title", "User Info");
	      String userName = principal.getName();
	 
	      model.addAttribute("message",
	              "User Info - This is protected page!. Hello " + userName);
	 
	      return "userInfoPage";
	  }
	 
	  @RequestMapping(value = "/403", method = RequestMethod.GET)
	  public String accessDenied(Model model, Principal principal) {
	      model.addAttribute("title", "Access Denied!");
	 
	      if (principal != null) {
	          model.addAttribute("message", "Hi " + principal.getName()
	                  + "<br> You do not have permission to access this page!");
	      } else {
	          model.addAttribute("msg",
	                  "You do not have permission to access this page!");
	      }
	      return "403";
	  }
	
	  @RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	  public String accessSuccess(Model model, Principal principal) {
	      model.addAttribute("title", "Login Success!");
	 
	      if (principal != null) {
	          model.addAttribute("message", "Hi " + principal.getName()
	                  + "<br> Welcome to the Application");
	      } else {
	          model.addAttribute("msg",
	                  "You do not have permission to access this page!");
	      }
	      return "adminPage";
	  }
	
	
	  @RequestMapping(value = "/error", method = RequestMethod.GET)
		public String error(Locale locale, Model model) {
			return "errorPage";
		}
	
	
	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public String aboutUs(Locale locale, Model model) {
		return "AboutUs";
	}
	
	
	
}
