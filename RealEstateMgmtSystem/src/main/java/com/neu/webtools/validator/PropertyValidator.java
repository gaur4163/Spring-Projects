/*package com.neu.webtools.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.webtools.pojo.Property;
import com.neu.webtools.pojo.User;



public class PropertyValidator implements Validator {

	
	String NUMBER_PATTERN = "[0-9]{2}";
	
	private Pattern pattern;
	private Matcher matcher;

	@Override
	public boolean supports(Class<?> clazz) {

		return Property.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Property property = (Property) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "propertyType",
				"validate.propertyType", "Property Type required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "propertyCategory",
				"validate.propertyCategory", "Property Category required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "availability",
				"validate.availability","Availability Required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price",
				"validate.price", "Price required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "numOfRooms",
				"validate.numOfRooms","No of Rooms are required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description",
				"validate.description", "Description is required");
	
		
		

		
		
		

		
		
	}

}
*/