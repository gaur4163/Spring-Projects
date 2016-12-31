package com.neu.webtools.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
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
import org.springframework.web.multipart.MultipartFile;

import com.neu.webtools.dao.PropertyDAO;
import com.neu.webtools.dao.UserDAO;

import com.neu.webtools.pojo.ImgUpload;
import com.neu.webtools.pojo.Property;
import com.neu.webtools.pojo.User;


@Controller
public class ImagesController {

	@Autowired
	@Qualifier("fileValidator")
	private Validator validator;

	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private PropertyDAO propDao;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(value = "/addImages", method = RequestMethod.GET)
	public String updPropertyDetails( Model model, HttpServletRequest request){
	    System.out.println("Inside Controller");
	    
	    try{model.addAttribute("fileObj", new ImgUpload());
	    model.addAttribute("prop", request.getParameter("propId"));
		return "AddImage";
	    } catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }
	}
	
	
	@RequestMapping(value = "/addMoreImages", method = RequestMethod.POST)
	public String uploadPic(Model model, @ModelAttribute("fileObj") @Validated  ImgUpload fileObj, BindingResult result,HttpServletRequest request, HttpServletResponse response) 
	{
		try{Random rand = new Random();
		int r = rand.nextInt(10);
		String returnPage = "ImgDone";
		 model.addAttribute("prop", request.getParameter("propId"));
		String propId = request.getParameter("propId");
		Property p = propDao.searchbyId(propId);
		System.out.println("in file upload and pid is "+p.getPropertyId());
		
		//MultipartFile photo = user.getProfilepic();
		if (result.hasErrors())
		{
			System.out.println("errors in file");
			model.addAttribute(
					"message",
					"Please try again, your property image could not be saved");
			model.addAttribute("task", "failure");
			returnPage = "AddImage";
			}
		else {
			try { boolean flag=false;
				 
				String ext = FilenameUtils.getExtension((fileObj.getFile()).getOriginalFilename());
				String name = p.getAddress().getLocality()+"_"+System.currentTimeMillis()*r+"_pic."+ext;
				//old.setProfilepicName(name);
				 flag = propDao.uploadImage(p,fileObj,name);		
				System.out.println("the img store flag is "+flag);
				if (flag) {
					model.addAttribute("message",
							"Your property has been updated successfully");
					model.addAttribute("task", "success");
					

				} 
				else {
					model.addAttribute(
							"message",
							"Please try again, your property image could not be saved");
					model.addAttribute("task", "failure");
					}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return "error";
			}

		}
		return returnPage;
		} catch (Exception e) {
            // TODO Auto-generated catch block
            return "error";
        }

	}

	


}
