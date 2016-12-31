package com.neu.webtools.pojo;


import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;



@Entity
@Table(name="usertable")
@Cache(usage=CacheConcurrencyStrategy.TRANSACTIONAL)
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="userId", unique=true, nullable=false)
	private long userId;
	
	
	@Column(name="enabled",nullable=false)
	   public Boolean enabled;
	
	


	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Booking> getBooking() {
		return booking;
	}

	public void setBooking(Set<Booking> booking) {
		this.booking = booking;
	}

	@Override
	public String toString() {
		return firstName + " " + lastName;
	}


	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="age")
	private int age;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
	private Set<Property> property;
	
	
	@OneToMany(mappedBy="buyer")
	private Set<Booking> booking;
	

	public Set<Property> getProperty() {
		return property;
	}

	public void setProperty(Set<Property> property) {
		this.property = property;
	}


	@Column(name="username", nullable=false)
    private String username;
	
	@Column(name="password", nullable=false)
    private String password;
	@Transient
	private String confirmPassword;
	
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword= confirmPassword;
	}


	@Column(name="email")
    private String email;
	
	@Column(name="contact")
    private String contact;
	
	@Column(name="role")
    private String role;
	
	@Column (name="question")
	private String customerSequrityquestion;
	
	@Column (name="answer")
	private String customerAnswer;
	
	@Column (name="city")
	private String city;
	
	

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public User() {
    }   
	
    
	
	public User(long userId, String firstName, String lastName, int age, Set<Property> property, String username,
			String password, String confirmPassword, String email, String contact, String role,
			String customerSequrityquestion, String customerAnswer, String city) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.age = age;
		this.property = property;
		this.username = username;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.email = email;
		this.contact = contact;
		this.role = role;
		this.customerSequrityquestion = customerSequrityquestion;
		this.customerAnswer = customerAnswer;
		this.city = city;
	}

	public String getCustomerSequrityquestion() {
		return customerSequrityquestion;
	}

	public void setCustomerSequrityquestion(String customerSequrityquestion) {
		this.customerSequrityquestion = customerSequrityquestion;
	}

	public String getCustomerAnswer() {
		return customerAnswer;
	}

	public void setCustomerAnswer(String customerAnswer) {
		this.customerAnswer = customerAnswer;
	}

	public long getUserId() {
		return userId;
	}


	public void setUserId(long userId) {
		this.userId = userId;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}

	

    
	

}
