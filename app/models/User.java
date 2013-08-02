package models;

import java.io.File;
import java.util.*;
import javax.persistence.*;

import play.db.jpa.*;
import play.data.validation.*;


@Entity
@Table(name="user")
public class User extends Model {


	@Required
	@Column(name="username")
	public String username;
	
	@Required
	@Column(name="password")
	public String password;
	
	@Column(name="type")
	private int type;
	
	@Column(name="email")
	private String email;
	
	public User(String username, String password, int type){
		
		this.username = username;
		this.password = password;
		this.type = type;
	}

	public User(String username, String password, int type, String email) {
		super();
		this.username = username;
		this.password = password;
		this.type = type;
		this.email = email;
	}
	

	public User(String username, String password, String email) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
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


	public int getType() {
		return type;
	}


	public void setType(int type) {
		this.type = type;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	
}