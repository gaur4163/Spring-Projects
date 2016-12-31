package com.neu.webtools.dao;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.neu.webtools.pojo.Message;
import com.neu.webtools.pojo.User;

public class MessageDAO extends DAO {    
	
	
	public ArrayList<Message> getAllMsg(User user, User msgToUser) throws Exception {
        
        ArrayList<Message> list = new ArrayList<Message>();
        
        
        try {
            
            Session s = getSession();
            long uid = user.getUserId();
            long cid = msgToUser.getUserId();
            
            Query q1 = s.createQuery( "from Message as p"
                    + " where (p.toUser =:userId and p.fromUser=:msgToUser) or"
                    + "(p.toUser =:msgToUser and p.fromUser=:userId)  ");
            q1.setLong("userId", uid);
            q1.setLong("msgToUser", cid);
            list=(ArrayList<Message>)q1.list();
            
            close();
            
            
        } catch (HibernateException e) {
            
            throw new Exception("Messages list couldn't be found", e);
        }
        
        return list;
    }    public void sendMessage(User user, User msgToUser, String msg) {
        Message m = new Message(user,msgToUser, msg);
        try{
            Transaction transaction = getSession().beginTransaction();
        
            
        getSession().persist(m);
        
        transaction.commit();
        close();
        
        }
        catch(HibernateException e){
            close();
            e.printStackTrace();
            
        }
    }}