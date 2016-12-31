package com.neu.webtools.pojo;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


@Entity
@Table(name = "bookingtable")
@Cache(usage=CacheConcurrencyStrategy.TRANSACTIONAL)
public class Booking {

	@Id
	@GeneratedValue
	@Column(name="bookingId", unique=true, nullable=false)
	private int bookingId;
	
	@OneToOne
	@JoinColumn(name="propertyId")
   	private Property property;
	
	@Column(name="bookingDate")
	private Date bookingDate;
	
	@Column(name="totalAmount")
	private double totalAmount;

	@ManyToOne
    @JoinColumn(name="userId")
	private User buyer;

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	
	

	public User getBuyer() {
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public Booking() {
		super();
	}

	public Booking(int bookingId, Property property, Date bookingDate, double totalAmount, User buyer) {
		super();
		this.bookingId = bookingId;
		this.property = property;
		this.bookingDate = bookingDate;
		this.totalAmount = totalAmount;
		this.buyer = buyer;
	}
	
	
}
