package com.neu.webtools.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;


@Entity
@Table(name="Notificationtable")
@Cache(usage=CacheConcurrencyStrategy.TRANSACTIONAL)
public class Notification implements Serializable {

	@Id 
	@GeneratedValue
	@Column(name="notificationId", unique=true, nullable=false)
 	private int notificationId;
	
	@OneToOne
	@JoinColumn(name="bookingId")
	private Booking booking;

	public int getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}

	
}
