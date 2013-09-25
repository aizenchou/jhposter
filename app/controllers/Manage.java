package controllers;

import play.*;
import play.db.jpa.JPABase;
import play.db.jpa.Model;
import play.libs.Files;
import play.mvc.*;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.commons.io.FileUtils;
import org.joda.time.DateTime;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.sun.org.apache.bcel.internal.generic.NEW;

import models.*;

public class Manage extends Application {

	@Before(unless = { "loginpage", "login", "index" })
	static void checkLogin() {
		if (session.get("username") == null) {
			flash.error("您没有登录！请登录后再操作！");
			loginpage();
		} else {
			if (session.get("type").equals("2")
					|| session.get("type").equals("3")) {
			} else {
				flash.error("权限不足！请联系管理员操作！");
				loginpage();
			}
		}
	}

	public static void listAllPoster(int page) {
		if (page == 0)
			page = 1;
		long Pagenumber;
		List<Poster> posters = Poster.find(" order by dealtime desc").fetch(
				page, 10);
		boolean isAll = true;
		long posternumber = Poster.count();
		Pagenumber = posternumber / 10 + 1;
		if (posternumber == 0) {
			flash.error("没有相应记录！");
		}
		render("./Application/admin/right/listPoster.html", posters, Pagenumber,
				page, isAll);
	}

	public static void listUnPoster(int page, boolean message) {
		if (page == 0)
			page = 1;
		long Pagenumber;
		List<Poster> posters = Poster.find("issubmit=0 order by dealtime desc")
				.fetch(page, 10);
		long posternumber = Poster.count("issubmit=0");
		Pagenumber = posternumber / 10 + 1;
		if (posternumber == 0) {
			flash.error("没有相应记录！");
		}
		if (message) {
			session.put("count", 0);
		}
		render("./Application/admin/right/listPoster.html", posters, Pagenumber,
				page);
	}

	public static void deletePoster(long id, int page, boolean isAll) {
		Poster poster = models.Poster.findById(id);
		Files.delete(Play.getFile(poster.getPhoto()));
		poster.delete();
		flash.success("删除成功！");
		if (isAll) {
			listAllPoster(page);
		} else {
			listUnPoster(page,false);
		}

	}

	private static void deletePosterById(long id) {
		models.Poster.delete("id=?", id);
		flash.success("删除成功！");
	}

	public static void addUserPage() {
		render("./Application/admin/right/addUser.html");
	}

	public static void addUser(String username, String password, int type,
			String email) {
	//	System.out.println(type);
		if (session.get("type").equals("2")) {
			type = 1;
		}
		if (checkEmail(email) && checkUsername(username)) {
	//		System.out.println(type);
			User user = new User(username, Util.MD5(password), type, email);
			user.save();
			flash.success("添加成功");
		} else {
			flash("username", username);
			flash("email", email);
			flash.error("用户名和邮箱已被人使用！");
		}
		addUserPage();
	}

	public static void deleteUser(long id) {
		models.User.delete("id=?", id);
		listUser();
	}

	public static void listUser() {
		if (session.get("type").equals("3")) {
			List<User> users = models.User.find("type between 1 and 2").fetch();
			if (users.size() == 0 || users == null) {
				flash.error("没有相应用户！");
			}
			render("/Application/admin/right/listUser.html", users);
		} else if (session.get("type").equals("2")) {
			List<User> users = models.User.find("type=1").fetch();
			if (users.size() == 0 || users == null) {
				flash.error("没有相应用户！");
			}
			render("./Application/admin/right/listUser.html", users);
		} else {
			loginpage();
		}

	}

	public static void submitPoster(long id, int page, boolean isAll) {
		models.Poster post = models.Poster.find("id=?", id).first();
		post.setIssubmit(true);
		post.save();
		if (isAll) {
			listAllPoster(page);
		} else {
			listUnPoster(page,false);
		}
	}

	private static void submitPosterById(long id) {
		models.Poster post = models.Poster.find("id=?", id).first();
		post.setIssubmit(true);
		post.save();
	}

	public static void selectAll(int page, long[] items, int dowhat) {
		if (dowhat == 1) {
			for (int i = 0; i < items.length; i++) {
				long l = items[i];
				deletePosterById(l);
			}
		} else if (dowhat == 2) {
			for (int i = 0; i < items.length; i++) {
				long l = items[i];
				submitPosterById(l);
			}
		}
		listAllPoster(page);
	}
}