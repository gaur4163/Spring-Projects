package com.neu.webtools.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.neu.webtools.pojo.ImgUpload;




public class UploadValidator implements Validator {

	private static final String IMAGE_PATTERN = "([^\\s]+(\\.(?i)(jpg|png|gif|bmp))$)";
	
	
	
	private Matcher matcher;

	@Override
	public boolean supports(Class<?> clazz) {

		return ImgUpload.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ImgUpload fileUpd = (ImgUpload) target;
		ValidationUtils.rejectIfEmpty(errors,"file", "validate.profilepic", "Field cannot be empty");
		
		Pattern pattern2 = Pattern.compile(IMAGE_PATTERN);
		MultipartFile photo = fileUpd.getFile();
		matcher = pattern2.matcher(photo.getOriginalFilename());
				if(!fileUpd.getFile().isEmpty())
				{System.out.println("profile path is "+fileUpd.getFile().isEmpty());}
				
				if (!photo.isEmpty()){
					
		        
				}
		        
		        if(0 == photo.getSize()) {
		           errors.rejectValue("file","file","File is empty");
		        }
		        if(!matcher.matches()) {
		           errors.rejectValue("file","file","Invalid Image Format");
		       }
		       
		       if(5000000 < photo.getSize()) {
		            errors.rejectValue("file","file","File size is over 5mb !");
		       
		       }

	}

}
