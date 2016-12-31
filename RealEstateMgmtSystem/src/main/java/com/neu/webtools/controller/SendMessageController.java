package com.neu.webtools.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.webtools.dao.MessageDAO;
import com.neu.webtools.dao.UserDAO;
import com.neu.webtools.pojo.Message;
import com.neu.webtools.pojo.User;

@Controller
public class SendMessageController {

	    
	    @Autowired
	    private UserDAO userDao;
	        
	    @Autowired
	    private MessageDAO msgDao;
	        
	    @RequestMapping(value = "/usermsgScreen", method = RequestMethod.POST)
	    public String messageScreen(Model model, HttpServletRequest request, HttpServletResponse response)
	    {
	    	System.out.println("Inside controller UserViewMessage ");
	        String returnPage = "UserViewMessage";
	        try{
	        
	        HttpSession session = request.getSession();
	        User u = (User) session.getAttribute("user");
	        if(u!=null)
	        {
	            try{
	                String msgToId = request.getParameter("msgToObj");
	                System.out.println(msgToId);
	                User user = (User)session.getAttribute("user");
	                User msgToUser = userDao.queryUserObj(msgToId);
	            System.out.println("The to user is "+msgToUser.getFirstName());
	                ArrayList<Message> msglist = (ArrayList<Message>)msgDao.getAllMsg(user,msgToUser);
	                if(msglist.size()==0)
	                {
	                model.addAttribute("inlist","Empty");
	                }
	                System.out.println("Inside controller Tsk equals Success ");
	                model.addAttribute("task","success");
	                model.addAttribute("msglist",msglist);
	                model.addAttribute("msgToObj",msgToUser);
	            
	                }
	                catch(Exception e ){
	                	System.out.println("Exception");
	                    model.addAttribute("task","failed");
	                    returnPage = "error";
	                }        }
	        else
	        {
	            returnPage = "signIn";
	        }
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            returnPage = "error";
	        }
	        return returnPage;    }
	    
	    
	    @RequestMapping(value = "/userSendMessage", method = RequestMethod.POST)
	    public String messageSending(Model model, HttpServletRequest request, HttpServletResponse response)
	    {
	        
	        
	        System.out.println("In Send msg from Ajax");
	        HttpSession session = request.getSession(false);
	            try{
	                String msgToId = request.getParameter("toId");
	                String msg= request.getParameter("msg");
	                User user = (User)session.getAttribute("user");
	                User msgToUser = userDao.queryUserObj(msgToId);
	            System.out.println("The to user is "+msgToUser.getFirstName());
	            new UserDAO().sendInquiryMail(user,msgToUser,msg,new Date().toString());
	                }
	                catch(Exception e ){
	                    System.out.println("In Msg catch controller from Ajax");
	                    model.addAttribute("task","failed");
	                    e.printStackTrace();
	                }        
	        return null;    }
	    
	}