package com.neu.webtools.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtility {
	 private static final SessionFactory sessionFactory;
	 
	    static {
	        try {
	            // Create the SessionFactory from hibernate.cfg.xml
	            sessionFactory = new Configuration().configure().buildSessionFactory();
	            System.out.print("here");
	        } catch (Throwable ex) {
	            // Make sure you log the exception, as it might be swallowed
	            System.err.println("Initial SessionFactory creation failed." + ex);
	            throw new ExceptionInInitializerError(ex);
	        }
	    }
	 
	    public static SessionFactory getSessionFactory() {
	        return sessionFactory;
	    }
}
