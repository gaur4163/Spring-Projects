package com.neu.webtools.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.neu.webtools.dao.PropertyDAO;
import com.neu.webtools.dao.UserDAO;
import com.neu.webtools.pojo.Notification;
import com.neu.webtools.pojo.Property;
import com.neu.webtools.pojo.User;
import com.neu.webtools.validator.PasswordSecurity;

/**
 * Servlet implementation class LoginController
 */
@Controller
public class LoginController {

	@Autowired
	@Qualifier("userValidator")
	private Validator validator;

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private PropertyDAO propertyDAO;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submitForm(Model model, User user, BindingResult result, HttpServletRequest request,
			HttpServletResponse response) {
		String returnPage = "";
		try{
		User u = null;
		String passwordEncripted;
		try {
			
			u = userDao.queryUserByNameAndPassword(user.getUsername(), user.getPassword());
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			if (u.getRole() == null) {
				ArrayList<Notification> listOfNotifications = userDao.getNotifications();
				System.out.println("listOfNotifications" + listOfNotifications.size());
				session.setAttribute("notifications", listOfNotifications);
				session.setMaxInactiveInterval(60);
				session.setAttribute("checkLogIn", "login");
				returnPage = "adminPage";

			} else {

				returnPage = "CustomerHome";
			}
		} else {
			model.addAttribute("loginFailed", "Username and password do not match");
			returnPage = "signIn";
		}
		} catch (Exception e) {
            // TODO Auto-generated catch block
            returnPage = "error";
        }
		return returnPage;

	}

	@RequestMapping(value = "/logout")
	public String logoutUser(Model model, HttpServletRequest request) {
		try{
		HttpSession session = request.getSession();
		ArrayList<Property> listOfProperty = propertyDAO.getPropertyListRecent();
		ArrayList<Property> listOfOffice = propertyDAO.getOfficeListRecent();
		
		model.addAttribute("listOfProperty", listOfProperty);
		model.addAttribute("listOfOffice", listOfOffice);
		session.invalidate();
		return "home";} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }

	}

	@RequestMapping(value = "/viewNotifications")
	public String viewNotifications(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u != null && u.getRole().equals("ROLE_ADMIN")) {
			return "NotificationsPage";
		} else {

			User user = new User();
			model.addAttribute("user", user);
			return "home";
		}
	}
	
	
	@RequestMapping(value = "/signUpAUser", method = RequestMethod.POST)
	public String signUpANewUser(Model model, @ModelAttribute("user") @Validated User user, BindingResult result,HttpServletRequest request) {
		System.out.println("Here in request map");
		String page = "";
		String passwordEncripted;
		try {
			
			user.setPassword(user.getPassword());
			
			user.setConfirmPassword(user.getConfirmPassword());
		} catch (Exception e1) {
			e1.printStackTrace();
			page = "error";
		}

		

		if (result.hasErrors()) {
			page = "signup";
		}

		else {
			try {
				user.setEnabled(true);
				boolean flag = userDao.addNewUSer(user);
				if (flag) {
					model.addAttribute("message", "User has been added successfully");
					model.addAttribute("task", "success");
					model.addAttribute("user", new User());
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					page = "CustomerHome";

				} else {
					model.addAttribute("message",
							"This E-mail is registered to another user or this username already exists. Please try again");
					model.addAttribute("task", "failure");
					model.addAttribute("user", new User());
					page = "signup";

				}
			} catch (Exception e) {
				e.printStackTrace();
				
				page = "error";
			}
		}
		return page;
	}
	
	@RequestMapping(value="/chkusername", method=RequestMethod.GET)
    public void chkusername(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException{
        String username = request.getParameter("username");
        if(username.equalsIgnoreCase("") || username==null){            
        }else{            UserDAO userDAO = new UserDAO();
            Boolean usernamefound = userDAO.chkusername(username);
            PrintWriter out = response.getWriter();
            if(usernamefound){
                JSONObject jObjd=new JSONObject();
                jObjd.put("avail", false);
                out.println(jObjd);
            }else{
                JSONObject jObjd=new JSONObject();
                jObjd.put("avail", true);
                out.println(jObjd);
            }        }    }
	
	
	 @RequestMapping(value="/chkemail", method=RequestMethod.GET)
	    public void chkemail(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException{
	        String email = request.getParameter("email");
	        if(email.equalsIgnoreCase("") || email==null){        }else{
	            UserDAO userDAO = new UserDAO();
	            Boolean useremailfound = userDAO.chkemail(email);
	            PrintWriter out = response.getWriter();
	            if(useremailfound){
	                JSONObject jObjd=new JSONObject();
	                jObjd.put("avail", false);
	                out.println(jObjd);
	            }else{
	                JSONObject jObjd=new JSONObject();
	                jObjd.put("avail", true);
	                out.println(jObjd);
	            }
	        }
	    }
	
	@RequestMapping(value = "/ForgotPassword", method = RequestMethod.GET)
	public String ForgotPassword(Locale locale, Model model) {
		System.out.println("Forgot Password Page");
		return "ForgotPassword";
	}
	
	
	@RequestMapping(value = "/forgotPasswordAnswer")
	public String forgotPasswordUsernameAnswer(Locale locale, Model model, @RequestParam("answer") String answer,
			HttpServletRequest request) {
	try{	System.out.println("Before Send Password");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user.getCustomerAnswer().equals(answer.trim())) {
			model.addAttribute("from", "answerCorrect");
			model.addAttribute("message", "Your password has been emailed to you");
			System.out.println("Before Send Password");
			userDao.sendPasswordMail(user);
		} else {

			model.addAttribute("from", "error");
			model.addAttribute("message", "You have entered wrong answer");
			System.out.println("Wrong Password");
		}

	 } catch (Exception e) {
		            // TODO Auto-generated catch block
		            return "error";
		        }
		return "ForgotPassword";
	}

	@RequestMapping(value = "/forgotPasswordUsername", method = RequestMethod.GET)
	public String forgotPasswordUsername(Locale locale, Model model, @RequestParam("username") String username,
			HttpServletRequest request) {
		

		try {HttpSession session = request.getSession();
			User user = userDao.queryUserByName(username);
			if (user != null) {
				model.addAttribute("from", "userRetrieved");
				model.addAttribute("securityQuestion", user.getCustomerSequrityquestion());
				session.setAttribute("user", user);
				model.addAttribute("message", "Please answer your security question");
				System.out.println("Enter Security Question");
			} else {
				model.addAttribute("from", "error");
				model.addAttribute("message", "This username does not exist");
			}
			return "ForgotPassword";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return  "error";
		}
		
	}

	

}
