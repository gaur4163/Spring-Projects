package com.neu.webtools.pojo;

import java.io.Serializable;
import java.util.Date;import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;import org.springframework.format.annotation.DateTimeFormat;@Entity
@Table(name = "message")
public class Message implements Serializable{
    
    public Message(){
        
    }
    
    public Message(User fromUser,User toUser,String message ){
        this.fromUser=fromUser;
        this.toUser =toUser;
        this.message = message;
        this.messageDate =new Date();
    }
    
    @Id
    @GeneratedValue
    @Column(name="msgId")
    private long messageId;
    
    @OneToOne
    @JoinColumn(name="toUser")
    //@Column(name="toUser")
   private User toUser;//Userid
    
    @OneToOne
    @JoinColumn(name="fromUser")
    //@Column(name="fromUser")
   private User fromUser;//userId
   
   @Column(name="msg")
   private String message;
   
   @Temporal(TemporalType.DATE)
   @Column(name="date")
   @DateTimeFormat(pattern = "MM/dd/YYYY")
   private Date messageDate;// handle the date thing here
    
   
   public long getMessageId() {
        return messageId;
    }
   
    public void setMessageId(long messageId) {
        this.messageId = messageId;
    }
    
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public Date getMessageDate() {
        return messageDate;
    }
    public void setMessageDate(Date messageDate) {
        this.messageDate = messageDate;
    }    public User getToUser() {
        return toUser;
    }    public void setToUser(User toUser) {
        this.toUser = toUser;
    }    public User getFromUser() {
        return fromUser;
    }    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
    }
   
}
