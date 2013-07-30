package models;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.persistence.*;


import play.db.jpa.*;
import play.data.validation.*;

@Entity
@Table(name = "poster")
public class Poster extends Model {

	public Poster(String title, String detail, String photo, String submitter) {
		super();
		this.title = title;
		this.detail = detail;
		this.photo = photo;
		this.submitter = submitter;
	}

	public Poster(String title, String detail, Date dealtime, String photo,
			String submitter) {
		super();
		this.title = title;
		this.detail = detail;
		this.dealtime = dealtime;
		this.photo = photo;
		this.submitter = submitter;
	}

	public Poster(String title, String detail, Date dealtime, String photo) {
		this.title = title;
		this.detail = detail;
		this.dealtime = dealtime;
		this.photo = photo;
	}

	public Poster(String title) {
		this.title = title;
	}

	@Required
	@Column(name = "title")
	private String title;

	@Column(name = "detail")
	private String detail;

	@Column(name = "dealtime")
	private Date dealtime;

	@Column(name = "photo")
	private String photo;

	@Column(name = "submitter")
	private String submitter;

	@Column(name = "issubmit")
	private boolean issubmit;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Date getDealtime() {
		return dealtime;
	}

	public void setDealtime(Date dealtime) {
		this.dealtime = dealtime;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSubmitter() {
		return submitter;
	}

	public void setSubmitter(String submitter) {
		this.submitter = submitter;
	}

	public boolean isIssubmit() {
		return issubmit;
	}

	public void setIssubmit(boolean issubmit) {
		this.issubmit = issubmit;
	}
	
	public String getTime() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return formatter.format(dealtime);
	}

}
