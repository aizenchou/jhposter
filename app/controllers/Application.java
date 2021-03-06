package controllers;

import play.*;
import play.data.validation.Valid;
import play.db.jpa.JPABase;
import play.libs.Files;
import play.mvc.*;
import play.mvc.Http.Cookie;
import play.cache.*;
import sun.security.provider.MD5;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.persistence.Cache;

import org.apache.commons.io.FileUtils;
import org.joda.time.DateTime;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.sun.org.apache.bcel.internal.generic.NEW;

import models.*;

public class Application extends Controller {

	@Before(unless = { "loginpage", "login", "index", "pagetest", "outhtml",
			"register", "showDetail", "forgetPsw", "logout" })
	static void checkLogin() {
		if (session.get("username") == null) {
			flash.error("您没有登录！请登录后再操作！");
			loginpage();
		}
	}

	public static void forgetPsw(String email) {
		User user = models.User.find("email=?", email).first();
		if (user != null) {
			user.setPassword(Util.MD5(user.getUsername()));
			user.save();
			flash.success("密码已重置为与用户名相同！请重新登录并修改密码！");
			loginpage();
		} else {
			flash.error("不存在的邮箱！");
			loginpage();
		}
	}

	public static void index() {
		List<Poster> posters = Poster.find("issubmit=1 order by dealtime desc")
				.fetch(20);
		render("./Application/index.html",posters);
	}

	public static void showDetail(long id) {
		Poster poster = models.Poster.findById(id);
		render("./Application/showDetail.html", poster);
	}

	public static void register(String username, String password, String email) {
		User user = new User(username, Util.MD5(password), email);
		user.setType(1);
		user.save();
		flash.success("注册成功！请使用用户名和密码登录！");
		loginpage();
	}

	public static boolean checkUsername(String username) {
		if (models.User.find("username=?", username).first() != null) {
			return false;
		} else {
			return true;
		}
	}

	public static boolean checkEmail(String email) {
		if (email == null) {
			return false;
		} else if (models.User.find("email=?", email).first() != null) {
			return false;
		} else {
			return true;
		}
	}

	public static void outhtml(int page) {
		List<Poster> posters = Poster.find("issubmit=1 order by dealtime desc")
				.fetch(page, 10);
		String outString = "<div id=\"container\"> ";
		for (int i = 0; i < posters.size(); i++) {
			Poster poster = posters.get(i);
			outString += "<div class=\"grid\"><div class=\"imgholder\"><a href=\"."
					+ poster.getPhoto()
					+ "\" data-lightbox=\"image-poster\" title=\""
					+ poster.getTitle()
					+ "\"><img src=\"."
					+ poster.getPhoto()
					+ "\" /></a></div><a target=\"_blank\" href=\"./showDetail.action?id="
					+ poster.getId()
					+ "\"><strong>"
					+ poster.getTitle()
					+ "</strong></a><p>"
					+ (poster.getDetail().length() > 30 ? poster.getDetail()
							.substring(0, 30) + "..." : poster.getDetail())
					+ "</p><div class=\"meta\">by "
					+ poster.getSubmitter()
					+ "</div></div>";
		}
		if (posters.size() < 10) {
		} else {
			page++;
			outString += "</div><a id=\"next\" href=\"./outhtml.action?page="
					+ page + "\">next page?</a>";
		}
		renderHtml(outString);
	}

	public static void loginpage() {
		if (session.get("type") != null) {
			dashboard();
		} else {
			render("./Application/login.html");
		}
	}

	public static void login(String username, String password, String remember) {

		models.User user = models.User.find("username=? and password=?",
				username, Util.MD5(password)).first();
		if (user != null) {
			session.put("username", user.getUsername());
			session.put("type", user.getType());
			flash.success(username + "，您好！登陆成功！");
			flash("username", username);
			if (remember != null && remember.equals("1")) {
				play.cache.Cache cache = new play.cache.Cache() {
				};
				cache.set("username", user.getUsername(), "240h");//// 设置登录保存密码
				cache.set("password", Util.MD5(user.getPassword()), "240h");
			}
			dashboard();
		} else {
			flash("username", username);
			flash.error("用户名或密码错误");
			render("./Application/login.html");
		}
	}

	public static void addPosterPage() {
		render("./Application/admin/right/addPoster.html");
	}

	public static void addPoster(String title, String detail, File photo)
			throws IOException {
		if (title == null || photo == null) {
			flash.error("标题或图片不能为空！");
			addPosterPage();
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String photoNewName = photo.getName().substring(0,
				photo.getName().lastIndexOf("."))
				+ formatter.format(new Date())
				+ photo.getName().substring(photo.getName().lastIndexOf("."),
						photo.getName().length());
		String path = "/public/poster/" + photoNewName;
		Files.copy(photo, Play.getFile(path));
		Poster poster = new Poster(title, detail, new Date(), path,
				session.get("username"));
		if (session.get("type").equals("2") || session.get("type").equals("3")) {
			poster.setIssubmit(true);
			flash.success("保存成功！");
		} else {
			flash.success("保存成功！请等待管理员审核！");
		}
		poster.save();
		addPosterPage();

	}

	public static void listOwnPoster(int page) {// 准备改成只有筛选自己的海报
		String username = session.get("username").toString();
		if (page == 0)
			page = 1;
		long Pagenumber;
		List<Poster> posters = Poster.find(
				"submitter=? order by dealtime desc", username).fetch(page, 10);
		long posternumber = Poster.count("submitter=?", username);
		Pagenumber = posternumber / 10 + 1;
		if (posternumber == 0) {
			flash.error("没有相应记录！");
		}
		render("./Application/admin/right/listOwnPoster.html", posters,
				Pagenumber, page);
	}

	public static void deleteOwnPoster(long id, int page) {// 只能删除自己发布的海报
		Poster poster = models.Poster.findById(id);
		if (poster.getSubmitter().equals(session.get("username"))) {
			Files.delete(Play.getFile(poster.getPhoto()));
			poster.delete();
		} else {
			flash.error("权限不足！那不是你发布的海报！");
		}
		listOwnPoster(page);

	}

	public static void dashboard() {
		if (session.get("type") != null) {
			long count = models.Poster.count("issubmit=0");
			session.put("count", count);
			render("./Application/admin/dashboard.html");
		} else {
			loginpage();
		}
	}

	public static void editUserPage() {
		render("./Application/admin/right/editUser.html");
	}

	public static void editUser(String username, String oldpassword,
			String password, String email) {
		User user = models.User.find("username=?", username).first();
		if (user.getPassword().equals(Util.MD5(oldpassword))) {
			user.setPassword(Util.MD5(password));
		//	System.out.println(checkEmail(email));
			if (user.getEmail().equals(email)) {
				user.save();
				flash.success("修改成功！");
			} else if (checkEmail(email)) {
				user.setEmail(email);
				user.save();
				flash.success("修改成功！");
			} else {
				flash.error("邮箱不可用！");
			}
		} else {
			flash.error("原始密码错误！");
			flash("email", email);
		}
		flash("email", email);
		editUserPage();
	}

	public static void logout() {
		session.clear();
		flash.success("退出成功！");
		loginpage();
	}
}