package com.neu.webtools.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;



@Entity
@Table(name="Addresstable")
@Cache(usage=CacheConcurrencyStrategy.TRANSACTIONAL)
public class Address {

 public Address(){
	
}

	
@Override
public String toString() {
	return aptNum+ " "+streetName+" "+city + " "+country+" "+zip;
}


public Address(int addressId, Property property, String locality, int floorNum, int aptNum, String streetName,
		String city, String zip, String country) {
	super();
	this.addressId = addressId;
	this.property = property;
	this.locality = locality;
	this.floorNum = floorNum;
	this.aptNum = aptNum;
	this.streetName = streetName;
	this.city = city;
	this.zip = zip;
	this.country = country;
}


@Id 
@GeneratedValue
@OneToOne(mappedBy="addressId")
private int addressId;	
	
@OneToOne
@JoinColumn(name="property")
private Property property;

@Column(name="locality")
private String locality;

@Column(name="floorNum")
private int floorNum;

@Column(name="aptNum")
private int aptNum;

@Column(name="streetName")
private String streetName;

@Column(name="city")
private String city;

@Column(name="zip")
private String zip;

@Column(name="country")
private String country;

public int getAddressId() {
	return addressId;
}
public void setAddressId(int addressId) {
	this.addressId = addressId;
}
public String getLocality() {
	return locality;
}
public void setLocality(String locality) {
	this.locality = locality;
}
public int getFloorNum() {
	return floorNum;
}
public void setFloorNum(int floorNum) {
	this.floorNum = floorNum;
}
public int getAptNum() {
	return aptNum;
}
public void setAptNum(int aptNum) {
	this.aptNum = aptNum;
}
public String getStreetName() {
	return streetName;
}
public void setStreetName(String streetName) {
	this.streetName = streetName;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}

public String getZip() {
	return zip;
}
public void setZip(String zip) {
	this.zip = zip;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}


}
