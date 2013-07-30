package controllers;

import play.*;
import play.data.validation.Valid;
import play.db.jpa.JPABase;
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

public class Application extends Controller {

	@Before(unless = { "loginpage", "login", "index", "pagetest","outhtml" })
	static void checkLogin() {
		if (session.get("username") == null) {
			flash.error("您没有登录！请登录后再操作！");
			loginpage();
		}
	}

	public static void index() {
		List<Poster> posters = Poster.find("issubmit=1 order by dealtime desc")
				.fetch(20);
		render(posters);
	}
	
	public static void outhtml(int page) {
		List<Poster> posters = Poster.find("issubmit=1 order by dealtime desc")
				.fetch(page,10);
		String outString = "<div id=\"container\"> ";
		for (int i = 0; i < posters.size(); i++) {
			Poster poster = posters.get(i);
			outString += "<div class=\'grid\'><div class=\'imgholder\'><img src=\'"
					+ poster.getPhoto() + "\' /></div><strong>" + poster.getTitle()
					+ "</strong><p>"+poster.getDetail()+"</p><div class=\'meta\'>by "
					+ poster.getSubmitter() + "</div></div>";
		}
		if (posters.size()<10) {
		}else {
			page++;
			outString += "</div><a id=\"next\" href=\"/outhtml.action?page="+page+"\">next page?</a>";
		}
		renderHtml(outString);
	}
	
	public static void loginpage() {
		render("/Application/login.html");
	}

	public static void login(String username, String password) {
		models.User user = models.User.find("username=? and password=?",
				username, password).first();
		if (user != null) {
			session.put("username", user.getUsername());
			session.put("type", user.getType());
			flash.success(username+"，您好！登陆成功！");
			dashboard();
		} else {
			flash("username", username);
			flash.error("用户名或密码错误");
			render("/Application/login.html");
		}
	}

	public static void addPosterPage() {
		render("/Application/admin/right/addPoster.html");
	}

	public static void addPoster(String title, String detail, File photo)
			throws IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String photoNewName = photo.getName().substring(0,
				photo.getName().lastIndexOf("."))
				+ formatter.format(new Date())
				+ photo.getName().substring(photo.getName().lastIndexOf("."),
						photo.getName().length());
		String path = "/public/poster/" + photoNewName;
		Files.copy(photo, Play.getFile(path));
		Poster poster = new Poster(title, detail, path, session.get("username"));
		if (session.get("type").equals("2") || session.get("type").equals("3")) {
			poster.setIssubmit(true);
			flash.success("保存成功！");
		}else {
			flash.success("保存成功！请等待管理员审核！");
		}
		poster.save();
		addPosterPage();
		
	}

	public static void listOwnPoster(int page) {// 准备改成只有筛选自己的未发布海报
		String username = session.get("username").toString();
		if (page == 0)
			page = 1;
		long Pagenumber;
		List<Poster> posters = Poster.find(
				"issubmit=0 and submitter=? order by dealtime desc", username)
				.fetch(page, 5);
		long posternumber = Poster.count("issubmit=0 and submitter=?",username);
		Pagenumber = posternumber / 5 + 1;
		if (posternumber==0) {
			flash.error("没有相应记录！");
		}
		render("/Application/admin/right/listPoster.html", posters, Pagenumber,
				page);
	}

	public static void deleteOwnPoster(long id, int page) {// 只能删除自己发布的海报
		models.Poster.delete("id=?", id);
		listOwnPoster(page);
	}

	private static void superManage() {
		render("/Application/admin/superManage.html");
	}

	private static void manage() {
		render("/Application/admin/manage.html");
	}

	private static void submit() {
		render("/Application/admin/submit.html");
	}

	public static void dashboard() {
		if (session.get("type").equals("3")) {
			superManage();
		} else if (session.get("type").equals("2")) {
			manage();
		} else if (session.get("type").equals("1")) {
			submit();
		} else {
			loginpage();
		}
	}

}