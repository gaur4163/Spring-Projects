package com.neu.webtools.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Files")
@Cache(usage=CacheConcurrencyStrategy.TRANSACTIONAL)
public class ImgUpload implements Serializable{
	
	@Id 
	@GeneratedValue
	private int fileId;
	
	@ManyToOne
	@JoinColumn(name="propertyId")
	private Property property;
	
	@Column(name="filepath", nullable=false,unique=true)
	private String filePath;
	
	@Column(name="fileName", nullable=false,unique=true)
	private String fileName;
	
	@Transient
	private MultipartFile file;
	
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public Property getProperty() {
		return property;
	}
	public void setProperty(Property property) {
		this.property = property;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
}

