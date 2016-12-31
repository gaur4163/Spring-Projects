package com.neu.webtools.pojo;

import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SCHEDULE")
public class Schedule{
	
	@Id @GeneratedValue
	private int scheduleId;
	
	@Column(name = "ApartmentID")
	private int apartmentID;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/YYYY") 
	@Column(name = "date")
	private Date dateBooked;

	@Transient
	private ArrayList<Date> daysBooked;

	
	
	public int getApartmentID() {
		return apartmentID;
	}

	public void setApartmentID(int apartmentID) {
		this.apartmentID = apartmentID;
	}

	public int getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	
	public Date getDateBooked() {
		return dateBooked;
	}

	public void setDateBooked(Date dateBooked) {
		this.dateBooked = dateBooked;
	}

	public ArrayList<Date> getDaysBooked() {
		return daysBooked;
	}

	public void setDaysBooked(ArrayList<Date> daysBooked) {
		this.daysBooked = daysBooked;
	}
	
}

