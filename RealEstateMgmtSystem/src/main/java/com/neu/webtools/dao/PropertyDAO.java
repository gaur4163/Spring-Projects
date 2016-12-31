package com.neu.webtools.dao;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;

import org.codemonkey.simplejavamail.Email;
import org.codemonkey.simplejavamail.Mailer;
import org.codemonkey.simplejavamail.TransportStrategy;
import org.hibernate.Filter;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.neu.webtools.pojo.Booking;
import com.neu.webtools.pojo.ImgUpload;
import com.neu.webtools.pojo.Notification;
import com.neu.webtools.pojo.Property;
import com.neu.webtools.pojo.Schedule;
import com.neu.webtools.pojo.User;

public class PropertyDAO extends DAO {

	public boolean addProperty(Property property) throws Exception {
		boolean flag = false;
		try {

			Transaction transaction = getSession().beginTransaction();
			getSession().save(property.getAddress());
			getSession().save(property);
			transaction.commit();
			flag = true;
			close();
		} catch (HibernateException e) {
			flag = false;
			System.err.println(e.getMessage());
			throw new Exception("Could not add Property");
		}
		return flag;

	}
	
	public ArrayList<Property> searchPropertyByCriteria(String city,String type,long pricefrom,
            long priceto){
    

    Session s = getSession();
    Transaction transaction = getSession().beginTransaction();
    Query q;
    
    if(city.equalsIgnoreCase("any")){
    	 q = s.createQuery("from Property where price > :pricefrom and price < :priceto and propertyCategory= :type");
    	q.setLong("pricefrom", pricefrom);
        q.setLong("priceto", priceto);
        q.setString("type",type);
    }else{
     q = s.createQuery("from Property where price > :pricefrom and price < :priceto and propertyCategory= :type and addressId in (select addressId from Address where city= :city)");
    q.setLong("pricefrom", pricefrom);
    q.setLong("priceto", priceto);
    q.setString("city",city);
    q.setString("type",type);
    }
    ArrayList<Property> propList = (ArrayList<Property>)q.list();
    for(Property p:propList ){
    Hibernate.initialize(p.getFileattached());
    	p.setImage(p.getFileattached().get(0).getFileName());
    System.out.println("file name is "+p.getImage());
    }
    transaction.commit();
    return propList;
    }

	public boolean uploadImage(User user, ImgUpload fileObj, String name) {

		MultipartFile file = fileObj.getFile();
		String fpath = "";
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// System.out.println("file org name is
				// "+file.getOriginalFilename()+" file ext is
				// "+FilenameUtils.getExtension(file.getOriginalFilename()));
				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				System.out.println("root path is : " + rootPath);
				File dir = new File(rootPath + File.separator + "images");

				// File dir = new File(path + File.separator + "images");
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
				fpath = dir.getAbsolutePath() + File.separator + name;
				System.out.println("full path of file is " + dir.getAbsolutePath() + File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println("file saved");
				try {
					Transaction transaction = getSession().beginTransaction();

					fileObj.setFileName(name);
					fileObj.setFilePath(fpath);
					getSession().saveOrUpdate(fileObj);

					getSession().merge(user);
					transaction.commit();
					close();
				} catch (HibernateException e) {
					close();
					e.printStackTrace();
					return false;
				}

				return true;

			} catch (Exception e) {
				System.out.println("file cant be saved ");
				e.printStackTrace();
				return false;
			}
		} else {
			System.out.println("file cant be saved ");
			return false;
		}

	}

	public Property searchbyId(String propId) {

		try {
			// begin();
			Session s = getSession();

			Query q = s.createQuery("from Property where propertyId = :id");
			q.setString("id", propId);

			Property p = (Property) q.uniqueResult();
			
			
			close();

			return p;
		} catch (HibernateException e) {

			System.out.println("Could not get Property " + propId);
			return null;
		}

	}
	
	public Property propsearchbyId(String propId) {

		try {
			// begin();
			Session s = getSession();

			Query q = s.createQuery("from Property where propertyId = :id");
			q.setString("id", propId);

			Property p = (Property) q.uniqueResult();
			Hibernate.initialize(p.getFileattached());
	    	p.setImage(p.getFileattached().get(0).getFileName());
	    	System.out.println("file name is "+p.getImage());
	    
			
			close();

			return p;
		} catch (HibernateException e) {

			System.out.println("Could not get Property " + propId);
			return null;
		}

	}

	public boolean uploadImage(Property p, ImgUpload fileObj, String name) {

		MultipartFile file = fileObj.getFile();
		String fpath = "";
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// System.out.println("file org name is
				// "+file.getOriginalFilename()+" file ext is
				// "+FilenameUtils.getExtension(file.getOriginalFilename()));
				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				System.out.println("root path is : " + rootPath);
				File dir = new File(rootPath + File.separator + "images");

				// File dir = new File(path + File.separator + "images");
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
				fpath = dir.getAbsolutePath() + File.separator + name;
				System.out.println("full path of file is " + dir.getAbsolutePath() + File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println("file saved");
				try {
					Transaction transaction = getSession().beginTransaction();
					p.setImage(name);
					fileObj.setFileName(name);
					fileObj.setFilePath(fpath);
					fileObj.setProperty(p);
					
					getSession().save(fileObj);
					ArrayList<ImgUpload> newlist = new ArrayList<ImgUpload>();
					newlist.add(fileObj);
					p.setFileattached(newlist);

					getSession().merge(p);
					transaction.commit();
					close();
				} catch (HibernateException e) {
					close();
					e.printStackTrace();
					return false;
				}

				return true;

			} catch (Exception e) {
				System.out.println("file cant be saved ");
				e.printStackTrace();
				return false;
			}
		} else {
			System.out.println("file cant be saved ");
			return false;
		}

	}

	public ArrayList<Property> getPropertyList() {

		ArrayList<Property> listOfProperty = new ArrayList<Property>();
		Query query = getSession().createQuery("from Property");
		query.setCacheable(true);
		listOfProperty = (ArrayList<Property>) query.list();
		close();
		return listOfProperty;

	}
	public ArrayList<Property> getBuyPropertyList() {

		ArrayList<Property> listOfProperty = new ArrayList<Property>();
		Query query = getSession().createQuery("from Property p where p.propertyId not in (select property from Booking) ");
		query.setCacheable(true);
		listOfProperty = (ArrayList<Property>) query.list();
		close();
		return listOfProperty;

	}
	public ArrayList<Property> getPropertyListRecent() {

		ArrayList<Property> listOfProperty = new ArrayList<Property>();
		Query query = getSession().createQuery("from Property p where p.propertyId not in (select property from Booking)");
		query.setCacheable(true);
		query.setFirstResult(1);
		query.setMaxResults(6);
		
		listOfProperty = (ArrayList<Property>) query.list();
		close();
		return listOfProperty;

	}
	
	public ArrayList<Property> getOfficeListRecent() {
//implemented filter

		
		ArrayList<Property> listOfOffice = new ArrayList<Property>();
		Query query = getSession().createQuery("from Property p where p.propertyId not in (select property from Booking)");
		query.setCacheable(true);
		
		
		Filter filter = getSession().enableFilter("feedFilter");
	       filter.setParameter("feedFilterID", "Office");
	       
		query.setFirstResult(1);
		query.setMaxResults(3);
		
		listOfOffice = (ArrayList<Property>) query.list();
		close();
		return listOfOffice;

	}

	// Extra Part

	public Property searchPropertyByID(int roomId) throws Exception {
		try {

			Query q = getSession().createQuery("from Property where propertyId = :propertyId");

			q.setInteger("roomId", roomId);
			Property property = (Property) q.uniqueResult();

			close();
			return property;

		} catch (HibernateException e) {
			throw new Exception("Property Cannot be found");
		}
	}

	public Notification searchNotificationByID(int notificationId) throws Exception {
		try {

			Session session = getSession();

			Query q = session.createQuery("from Notification where notificationId = :notificationId");

			q.setInteger("notificationId", notificationId);
			Notification notification = (Notification) q.uniqueResult();

			close();
			return notification;

		} catch (HibernateException e) {
			throw new Exception("Notification Cannot be found");
		}
	}

	public void saveDate(Date date) {

		Schedule schedule = new Schedule();

		Transaction transaction = getSession().beginTransaction();
		schedule.setDateBooked(date);
		// schedule.setScheduleId("sch1");
		schedule.setApartmentID(14);
		getSession().save(schedule);
		transaction.commit();
		close();

	}

	public void deleteSelectedProperty(int propertyId) {

		Transaction tx = getSession().beginTransaction();

		String hql = "delete from Property where propertyId = :propertyId";
		Query query = getSession().createQuery(hql);
		query.setInteger("propertyId", propertyId);
		int rowCount = query.executeUpdate();
		tx.commit();

	}

	public void bookProperty(int apartmentID, Booking booking) {

		Transaction transaction = getSession().beginTransaction();

		Notification notification = new Notification();
		notification.setBooking(booking);
		getSession().save(notification);
		getSession().save(booking);
	    System.out.println("Property Booked");
		transaction.commit();
		close();

	}

	public ArrayList<Notification> getNotifications() {

		ArrayList<Notification> listOfNotifications = new ArrayList<Notification>();
		Query query = getSession().createQuery("from Notification");
		listOfNotifications = (ArrayList<Notification>) query.list();
		close();
		return listOfNotifications;

	}
	
	public boolean updateProperty(Property property, int id) throws Exception {
		boolean flag = false;
		try {
			System.err.println("IN UPDATE Property");

			Session session = getSession();
			Transaction transaction = session.beginTransaction();
			Query query = session
					.createQuery("update Property set description = :description,  numOfRooms=:numOfRooms, price=:price "
							+ " where propertyId = :propertyId");

			System.err.println("Property id" + id);
			query.setInteger("propertyId", id);
			query.setString("description", property.getDescription());
			query.setInteger("numOfRooms", property.getNumOfRooms());
			query.setFloat("price", property.getPrice());
			int count = query.executeUpdate();
			transaction.commit();

			flag = true;
			close();
		} catch (HibernateException e) {
			flag = false;
			throw new Exception("Could not update Property");
		}

		return flag;
	}
	
public void sendMail(User user, String message,Booking booking,Property property) throws DocumentException, MalformedURLException, IOException {
		
	   String fname = user.getFirstName();
	   String lname = user.getLastName();
	   String name = fname.concat(lname);
		Email email = new Email();

		email.setFromAddress("Real Estate Management", "gauravsweet123@gmail.com");
		email.setSubject("Booking Confirmation!");
		System.out.println("Sending Attachment");
		String filename = "hello.pdf";
		String rootPath = System.getProperty("catalina.home");
        File dir = new File(rootPath + File.separator + "files");
        if (!dir.exists()) {
            dir.mkdirs();
        }            // Create the file on server
        File serverFile = new File(dir.getAbsolutePath()
                + File.separator + filename);
        String pathfile = dir.getAbsolutePath()+ File.separator + filename;
		
		getPDFBody(property,booking,user,pathfile);
		
       
        
        DataSource source = new FileDataSource(pathfile);
        System.out.println("Success");
        email.addAttachment("bookingConfirmation.pdf",source);
		email.addRecipient(name,user.getEmail(), Message.RecipientType.TO);
		StringBuffer sb=new StringBuffer();
		sb.append("Greeting!!");
		sb.append("\n");
		sb.append("Your booking details are as follows.");
		sb.append("\n");
		sb.append("Booking Date:\t"+booking.getBookingDate());
		sb.append("\n");
		sb.append("Total Amount:\t"+booking.getTotalAmount());
		sb.append("\n");
		sb.append("Enjoy your booked property");
		sb.append("\n");
		sb.append("-Team Real Estate Management");
		System.out.println("user id"+user.getEmail());
		email.setText(sb.toString());
		new Mailer("smtp.gmail.com", 465, "gauravsweet123@gmail.com", "41634163g",
				TransportStrategy.SMTP_SSL).sendMail(email);
		System.out.println("Sent message successfully....");
	}

private void getPDFBody(Property property,Booking booking,User user, String filepath) {
	 
     Document document=new Document();
     PdfWriter writer =null;
	try {
		writer = PdfWriter.getInstance(document, new FileOutputStream(filepath));
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (DocumentException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
     
     document.open();

     
     String RESOURCE = System.getProperty("catalina.home")+"/images/"+property.getImage();
     Font f1 = new Font(FontFamily.HELVETICA, 26, Font.BOLD, BaseColor.BLUE);
     
     Chunk c1 = new Chunk("Booking Confirmation",f1);
     Paragraph p = new Paragraph();
     p.add(c1);
     p.setAlignment(Element.ALIGN_CENTER);
     
    
     try {
		document.add(p);
	
     Image img = Image.getInstance(RESOURCE);
     img.scaleAbsolute(180f, 180f);
     img.setAlignment(Element.ALIGN_CENTER);
     document.add(img);
     //body of resume/profile
     Paragraph p2 = new Paragraph();
     Font head = new Font(FontFamily.HELVETICA, 20, Font.BOLD, BaseColor.BLUE);
     Font data = new Font(FontFamily.HELVETICA, 14, Font.NORMAL, BaseColor.BLACK);
     String propertyName = property.getDescription();
     propertyName = propertyName.toUpperCase();
     Chunk c2 = new Chunk(propertyName,head);
     p2.add(c2);
     Paragraph p3 = new Paragraph();
     Chunk c3 = new Chunk("Thanks for booking property with Real Estate Management. The Booking Details are as follows:",data);
     p3.add(c3);
     document.add(p2);
     document.add(p3);
     String bookingId =String.valueOf(booking.getBookingId());
     Paragraph p5 = new Paragraph();
     Chunk c5 = new Chunk("Booking ID: "+bookingId,data);
     p5.add(c5);
     document.add(p5);
     String dateString=null;
     SimpleDateFormat sdfr = new SimpleDateFormat("dd/MMM/yyyy");
     try{
    		dateString = sdfr.format( booking.getBookingDate() );
    	   }catch (Exception ex ){
    		System.out.println(ex);
    	   }
     
     Paragraph p6 = new Paragraph();
     Chunk c6 = new Chunk("Booking Date: "+dateString,data);
     p6.add(c6);
     document.add(p6);
     
     String propertyCategory = property.getPropertyCategory();
     Paragraph p4 = new Paragraph();
     Chunk c4 = new Chunk("Property Type: "+propertyCategory,data);
     p4.add(c4);
     document.add(p4);
     
     String propertyAddress1 = property.getAddress().toString();
     Paragraph p7 = new Paragraph();
     Chunk c7 = new Chunk("Property Address: "+propertyAddress1,data);
     p7.add(c7);
     document.add(p7);
     
     String bookingAmount =String.valueOf(booking.getTotalAmount());
     Paragraph p8 = new Paragraph();
     Chunk c8 = new Chunk("Booking Amount: "+bookingAmount,data);
     p8.add(c8);
     document.add(p8);
     
     String propertyPrice =String.valueOf(property.getPrice());
     Paragraph p9 = new Paragraph();
     Chunk c9 = new Chunk("Property Price: "+propertyPrice,data);
     p9.add(c9);
     document.add(p9);
     
     String propertySeller =String.valueOf(property.getUser());
     Paragraph p10 = new Paragraph();
     Chunk c10 = new Chunk("Seller Details: "+propertySeller,data);
     p10.add(c10);
     document.add(p10);
     
     Font footer = new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
     Paragraph p11 = new Paragraph();
     Chunk c11 = new Chunk("Thanks Again for the bookings. In case of any concerns you can contact to the helpline number: 1800-125-8888",footer);
     p11.add(c11);
     document.add(p11);
     
     
     document.close();
     writer.close();
	
     } catch (DocumentException e) {
 	
 		e.printStackTrace();
 	} catch (MalformedURLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
     
}

public ArrayList<Booking> getBookingList() {
	ArrayList<Booking> listOfBooking = new ArrayList<Booking>();
	Query query = getSession().createQuery("from Booking");
	query.setCacheable(true);
	listOfBooking = (ArrayList<Booking>) query.list();
	
	return listOfBooking;
	
}

}
