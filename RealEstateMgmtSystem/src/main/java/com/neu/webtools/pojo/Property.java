package com.neu.webtools.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;
import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name="propertytable")
@Cache(usage=CacheConcurrencyStrategy.TRANSACTIONAL)
@FilterDef(name = "feedFilter", parameters =
@ParamDef(name = "feedFilterID", type = "string"))
@Filter(name = "feedFilter", condition = "propertyType = :feedFilterID")
public class Property {
	
@Id 
@GeneratedValue
@Column (nullable=false)
private int propertyId;

@Column(name="availability")
private String availability;

@Column(name="areaOfProperty")
private long areaOfProperty;

@Column(name="price")
private long price;

@Column(name="numOfRooms")
private int numOfRooms;

@Column(name="propertyType")
private String propertyType;

@Column(name="propertyCategory")
private String propertyCategory;

@Column(name="description")
private String description;

@Column(name="image")
private String image;

@ManyToOne
@JoinColumn(name="userId")
private User user;

@OneToMany(mappedBy="property")
@OrderBy("fileId")
private List<ImgUpload> fileattached;

@OneToOne
@JoinColumn(name= "booking")
private Booking booking;

@OneToOne
@JoinColumn(name= "addressId")
private Address address;



public String getPropertyCategory() {
	return propertyCategory;
}

public void setPropertyCategory(String propertyCategory) {
	this.propertyCategory = propertyCategory;
}

public Property(){
	fileattached = new ArrayList<ImgUpload>();
}

public int getPropertyId() {
	return propertyId;
}

public void setPropertyId(int propertyId) {
	this.propertyId = propertyId;
}



public long getAreaOfProperty() {
	return areaOfProperty;
}

public void setAreaOfProperty(long areaOfProperty) {
	this.areaOfProperty = areaOfProperty;
}

public long getPrice() {
	return price;
}

public void setPrice(long price) {
	this.price = price;
}

public int getNumOfRooms() {
	return numOfRooms;
}

public void setNumOfRooms(int numOfRooms) {
	this.numOfRooms = numOfRooms;
}

public String getPropertyType() {
	return propertyType;
}

public void setPropertyType(String propertyType) {
	this.propertyType = propertyType;
}

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}

public String getImage() {
	return image;
}

public void setImage(String image) {
	this.image = image;
}




public List<ImgUpload> getFileattached() {
	return fileattached;
}

public void setFileattached(List<ImgUpload> fileattached) {
	this.fileattached = fileattached;
}

public Booking getBooking() {
	return booking;
}

public void setBooking(Booking booking) {
	this.booking = booking;
}

public Address getAddress() {
	return address;
}

public void setAddress(Address address) {
	this.address = address;
}

public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}


public String getAvailability() {
	return availability;
}

public void setAvailability(String availability) {
	this.availability = availability;
}

public Property(int propertyId, String availability, long areaOfProperty, long price, int numOfRooms, String propertyType,
		String propertyCategory, String description, String image, User user, Set<ImgUpload> file, Booking booking,
		Address address) {
	super();
	this.propertyId = propertyId;
	this.availability = availability;
	this.areaOfProperty = areaOfProperty;
	this.price = price;
	this.numOfRooms = numOfRooms;
	this.propertyType = propertyType;
	this.propertyCategory = propertyCategory;
	this.description = description;
	this.image = image;
	this.user = user;
	
	this.booking = booking;
	this.address = address;
}






}


