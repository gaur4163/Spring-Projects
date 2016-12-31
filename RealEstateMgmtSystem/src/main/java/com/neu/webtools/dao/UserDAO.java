package com.neu.webtools.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.Message;

import org.codemonkey.simplejavamail.Email;
import org.codemonkey.simplejavamail.Mailer;
import org.codemonkey.simplejavamail.TransportStrategy;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.neu.webtools.exception.AdException;
import com.neu.webtools.pojo.Booking;
import com.neu.webtools.pojo.Notification;
import com.neu.webtools.pojo.User;
import com.neu.webtools.validator.PasswordSecurity;

public class UserDAO extends DAO {

	public UserDAO() {
	}

	public User queryUserByNameAndPassword(String userName, String userPassword) throws Exception {
		try {
			// begin();
			Session s = getSession();

			Query q = s.createQuery("from User where username = :username and password = :password");
			q.setCacheable(true);
			q.setString("username", userName);
			q.setString("password", userPassword);
			// System.out.println(q);
			User user = (User) q.uniqueResult();
			close();
			// commit();
			return user;
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("User Not found with User Name: " + userName, e);
		}
	}

	public User get(String username) throws AdException {
		try {
			begin();
			Query q = getSession().createQuery("from User where username = :username");
			q.setCacheable(true);
			q.setString("username", username);
			User user = (User) q.uniqueResult();
			commit();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw new AdException("Could not get user " + username, e);
		}
	}

	public User queryUserByName(String userName) throws Exception {
		try {
			// begin();
			Session s = getSession();

			Query q = s.createQuery("from User where username = :username");
			q.setString("username", userName);

			User user = (User) q.uniqueResult();
			close();

			return user;
		} catch (HibernateException e) {

			throw new Exception("Could not get user " + userName, e);
		}
	}

	public boolean addNewUSer(User user) throws Exception {
		boolean flag = false;
		try {
			Transaction transaction = getSession().beginTransaction();

			System.out.println("inside DAO");

			ArrayList<User> userListEmail = new ArrayList<User>();
			Query query = getSession().createQuery("from User where email = :emailId or username=:username");
			query.setCacheable(true);
			query.setString("emailId", user.getEmail());
			query.setString("username", user.getUsername());
			userListEmail = (ArrayList<User>) query.list();

			if (userListEmail.size() == 0) {

				user.setRole("ROLE_USER");
				getSession().save(user);
				flag = true;
				transaction.commit();
			} else {

				flag = false;
			}

			close();
		} catch (HibernateException e) {
			flag = false;
			System.err.println(e.getMessage());
			throw new Exception("Could not add user");
		}
		return flag;
	}

	public void delete(User user) throws AdException {
		try {
			begin();
			getSession().delete(user);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new AdException("Could not delete user " + user.getFirstName(), e);
		}
	}
	
	public User queryUserObj(String profileId) throws Exception {
        try {
            // begin();
            Session s = getSession();            
            Query q = s.createQuery("from User where userId = :userId");
            Long id = Long.parseLong(profileId);
            q.setLong("userId", id);
            
            User user = (User) q.uniqueResult();
            close();
            
            return user;
        } catch (HibernateException e) {
            
            throw new Exception("User couldn't be found" + profileId, e);
        }
    }

	public ArrayList<Notification> getNotifications() {

		ArrayList<Notification> notificationList = new ArrayList<Notification>();
		Query query = getSession().createQuery("from Notification");
		notificationList = (ArrayList<Notification>) query.list();
		close();
		return notificationList;

	}
	
	public Boolean chkusername(String username){
        try{Session s = getSession();
        System.out.println(username);
        Query query= s.createQuery("from User where userName= :username");
        query.setString("username", username);
        List result = query.list();
        System.out.println("Size"+result.size());
    
        if(result.size()>0){
            return true;    
        }else{
            return false;
        }}catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
	
	public Boolean chkemail(String email){
        Session s = getSession();
        System.out.println(email);
        Query query= s.createQuery("from User where email= :email");
        query.setString("email", email);
        List result = query.list();
    
        if(result.size()>0){
            return true;    
        }else{
            return false;
        }
            }

	public ArrayList<Booking> getBookingHistory(int userId) {

		ArrayList<Booking> bookingList = new ArrayList<Booking>();
		Query query = getSession().createQuery("from Booking where userId=:userId");
		query.setParameter("userId", userId);
		bookingList = (ArrayList<Booking>) query.list();
		close();
		return bookingList;

	}

	public ArrayList<Booking> searchListByType(String type, Date date) {
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		System.out.println("Date" + date);

		ArrayList<Booking> listOfBooking = null;
		Query query = null;

		query = getSession().createQuery("from Booking where bookingDate=:date");

		query.setParameter("date", date);

		listOfBooking = (ArrayList<Booking>) query.list();
		transaction.commit();
		session.close();
		return listOfBooking;

	}
	
	
	public void sendInquiryMail(User toUser, User fromUser,String msg,String date) {

		String fname = toUser.getFirstName();
		String lname = toUser.getLastName();
		String name = fname.concat(lname);
		Email email = new Email();
		
		
		email.setFromAddress("Real Estate Management", "gauravsweet123@gmail.com");
		email.setSubject("Inquiry Mail From "+fromUser);

		email.addRecipient(name, toUser.getEmail(), Message.RecipientType.TO);
		StringBuffer sb = new StringBuffer();
		sb.append("Greeting!!");
		sb.append("\n");
		sb.append("Dear "+name);
		sb.append("\n");
	    sb.append(msg);
	    sb.append("\n");
		sb.append("-Regards");
		sb.append("\n");
	    sb.append(fromUser);
	    sb.append("Sent on:");
	    sb.append(date);
	    
		
		
		sb.append("via-CRM Property Management");
		email.setText(sb.toString());
		new Mailer("smtp.gmail.com", 465, "gauravsweet123@gmail.com", "41634163g", TransportStrategy.SMTP_SSL)
				.sendMail(email);
		System.out.println("Sent message successfully....");
	}
	

	public void sendPasswordMail(User user) {

		String fname = user.getFirstName();
		String lname = user.getLastName();
		String name = fname.concat(lname);
		Email email = new Email();
		
		
		email.setFromAddress("Real Estate Management", "gauravsweet123@gmail.com");
		email.setSubject("Password Recovery Mail");

		email.addRecipient(name, user.getEmail(), Message.RecipientType.TO);
		StringBuffer sb = new StringBuffer();
		sb.append("Greeting!!");
		sb.append("\n");
		sb.append("Your Password is");
	    sb.append(user.getPassword());
		
		sb.append("\n");
		sb.append("-Regards");
		sb.append("\n");
		sb.append("-CRM Property Management");
		email.setText(sb.toString());
		new Mailer("smtp.gmail.com", 465, "gauravsweet123@gmail.com", "41634163g", TransportStrategy.SMTP_SSL)
				.sendMail(email);
		System.out.println("Sent message successfully....");
	}

}
