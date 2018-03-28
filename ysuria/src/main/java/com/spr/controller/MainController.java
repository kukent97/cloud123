package com.spr.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spr.exception.ObjectNotFound;
import com.spr.model.Category;
import com.spr.model.News;
import com.spr.model.User;
import com.spr.service.CategoryService;
import com.spr.service.NewsService;
import com.spr.service.UserService;

/*
 * Author: YZENNY
 * Email address: nhuytnt1608@gmail.com
 * DateCreated: 2:00PM 16/03/2018
 */
@Controller
public class MainController {
	/*
	 * 
	 */
	@Autowired
	CategoryService categoryService;
	@Autowired
	NewsService newsService;
	@Autowired
	UserService userService;

	/*
	 * Mapping
	 */
	@GetMapping("/welcome")
	public String home1(ModelMap mm) {
		getDefaultValue(mm);

		return "home1";
	}
	@GetMapping("/home")
	public String home(ModelMap mm) {
		getDefaultValue(mm);

		return "home";
	}

	@GetMapping("/category/{id}")
	public String ViewCategory(@PathVariable int id, ModelMap mm) {
		getDefaultValue(mm);
		try {
			Category category = categoryService.FindOne(id);
			mm.put("title", category.getTitle());
			mm.put("titleCategory", category.getTitle());
			mm.put("content", category.getContent());
			DateFormat df = new SimpleDateFormat("EEEEE dd-MM-yyyy hh:mm a");
			String formattedDate = df.format(category.getDatecreated());
			mm.put("datecreated", formattedDate);
			User us = category.getCreator();
			mm.put("us", us);
			mm.put("newsInCategory", category.getNewslist());
			mm.put("id", id);
			String attachmentStr = category.getAttachment();

			if (attachmentStr != null && !attachmentStr.isEmpty()) {
				String[] attachmentSplit = attachmentStr.split("TITLEID");
				if (attachmentSplit.length > 0) {
					Map<String, String> rsAttachments = new HashMap<String, String>();
					for (String link : attachmentSplit) {
						if (link.isEmpty() || link.equals(""))
							continue;
						else {
							String[] splitLink = link.split("ID");
							if (splitLink.length < 2)
								continue;
							else
								rsAttachments.put(splitLink[1], splitLink[0]);
						}
					}
					if (!rsAttachments.isEmpty())
						mm.put("attachments", rsAttachments);
				}
			}
		} catch (ObjectNotFound e) {
			mm.put("error", "Category Not Found!");
		} catch (NoSuchElementException ex) {
			if (categoryService.FindAll().hasNext()) {
				Category categoryTemp = categoryService.FindAll().next();
				return "redirect:/category/" + categoryTemp.getId();
			} else
				return "redirect:/home";
		}
		return "news";
	}

	@GetMapping("/category/{category_id}/news/{news_id}")
	public String ViewNews(@PathVariable(name = "news_id") int news_id, ModelMap mm) {
		getDefaultValue(mm);
		try {
			News news = newsService.FindOne(news_id);
			mm.put("title", news.getTitle());
			mm.put("content", news.getContent());
			DateFormat df = new SimpleDateFormat("EEEEE dd-MM-yyyy hh:mm a");
			String formattedDate = df.format(news.getDatecreated());
			mm.put("datecreated", formattedDate);
			User us = news.getCreator();
			mm.put("us", us);
			mm.put("newsInCategory", news.getCategory().getNewslist());
			mm.put("titleCategory", news.getCategory().getTitle());
			mm.put("id", news_id);
			String attachmentStr = news.getLink();
			String[] attachmentSplit;
			if (attachmentStr != null && (attachmentSplit = attachmentStr.split("TITLEID")).length > 0) {
				Map<String, String> rsAttachments = new HashMap<String, String>();
				for (String link : attachmentSplit) {
					if (link.isEmpty() || link.equals(""))
						continue;
					else {
						String[] splitLink = link.split("ID");
						if (splitLink.length < 2)
							continue;
						rsAttachments.put(splitLink[1], splitLink[0]);
					}
				}
				if (!rsAttachments.isEmpty())
					mm.put("attachments", rsAttachments);
			}
		} catch (ObjectNotFound e) {
			mm.put("error", "News Not Found!");
		} catch (NoSuchElementException ex) {
			if (newsService.FindAll().hasNext()) {
				News newsTemp = newsService.FindAll().next();
				return "redirect:/category/" + newsTemp.getCategory().getId() + "/news/" + newsTemp.getId();
			} else
				return "redirect:/home";
		}
		return "news";
	}

	@GetMapping("/create/{type}")
	public String createnews(@PathVariable String type, ModelMap mm) {
		if (type.equals("news"))
			mm.put("isCategory", false);
		else if (type.equals("category"))
			mm.put("isCategory", true);
		else
			return "redirect:/home";
		getDefaultValue(mm);
		return "createnews";
	}

	@GetMapping("/login")
	public String login(HttpSession session) {
		if (session.getAttribute("user") == null)
			return "login";
		else
			return "redirect:/home";
	}

	@PostMapping("/checklogin")
	public String checklogin(@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "pass", required = true) String pass, HttpSession session, RedirectAttributes ra) {
		User us = userService.CheckLogin(email, pass);
		if (us != null) {
			session.setAttribute("user", us);
			return "redirect:/home";
		} else
			ra.addFlashAttribute("loginMessage", "Invalid email or password, Please try again! ");
		ra.addFlashAttribute("email", email);
		return "redirect:/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/create/{isCategory}", method = RequestMethod.POST)
	public String created(@PathVariable(name = "isCategory") String isCategory,
			@RequestParam(name = "categoryid", required = false) String categoryid,
			@RequestParam(name = "title") String title, @RequestParam(name = "content") String content,
			HttpSession session) {
		User us = (User) session.getAttribute("user");
		if (us == null)
			return "redirect:/login";
		String str_redirect = "error";
		int id;
		try {
			if (isCategory.equals("true")) {
				Category category = new Category();
				category.setTitle(title);
				category.setContent(content);
				category.setCreator(us);
				category.setDatecreated(new Date());
				categoryService.InsertCategory(category);
				id = category.getId();
			} else if (isCategory.equals("false")) {
				Category category = categoryService.FindOne(Integer.valueOf(categoryid));
				News news = new News();
				news.setTitle(title);
				news.setCategory(category);
				news.setContent(content);
				news.setCreator(us);
				news.setDatecreated(new Date());
				newsService.InsertNews(news);
				id = news.getId();
			} else
				return str_redirect;
		} catch (ObjectNotFound e) {
			return str_redirect;
		}
		session.setAttribute("id", id);
		session.setAttribute("isCategory", isCategory);
		return str_redirect = "redirect:/attachment";
	}

	@GetMapping("delete/{type}/{id}")
	public String deletePost(@PathVariable(name = "type") String type, @PathVariable(name = "id") int id, ModelMap mm,
			HttpSession session, RedirectAttributes ra) {
		User us = (User) session.getAttribute("user");
		if (us == null)
			return "/login";
		String message = "Đã xảy ra lỗi khi xóa!";
		String redirect = "redirect:/home";
		try {
			if (type.equals("category")) {
				categoryService.DeleteCategory(id);
				message = "Xóa thành công!";
			} else if (type.equals("news")) {
				News news = newsService.FindOne(id);
				if (news == null || news.getCategory() == null)
					return "redirect:/";
				int categoryid = news.getCategory().getId();
				newsService.DeleteNews(id);
				message = "Xóa thành công!";
				redirect = "redirect:/category/" + categoryid;
			}
		} catch (ObjectNotFound e) {
			e.printStackTrace();
		} catch (NoSuchElementException ex) {
			ex.printStackTrace();
		}
		ra.addFlashAttribute("deleteMessage", message);
		return redirect;
	}

	@GetMapping("/edit/{type}/{id}")
	public String editPost(@PathVariable(name = "type") String type, @PathVariable(name = "id") int id, ModelMap mm,
			HttpSession session) {
		User us = (User) session.getAttribute("user");
		if (us == null)
			return "/login";
		getDefaultValue(mm);
		try {
			if (type.equals("category")) {
				Category category = categoryService.FindOne(id);
				mm.put("title", category.getTitle());
				mm.put("content", category.getContent());
			} else if (type.equals("news")) {
				News news = newsService.FindOne(id);
				mm.put("title", news.getTitle());
				mm.put("content", news.getContent());
				mm.put("idOfCategory", news.getCategory().getId());
			}
			mm.put("editting", type);
			mm.put("id", id);

		} catch (ObjectNotFound e) {
			return "redirect:/home";
		} catch (NoSuchElementException ex) {
			return "redirect:/home";
		}
		return "createnews";
	}

	@PostMapping("/update/{type}/{id}")
	public String savePost(@PathVariable(name = "type") String type, @PathVariable(name = "id") int id, ModelMap mm,
			HttpSession session, @RequestParam(name = "title") String title,
			@RequestParam(name = "content") String content,
			@RequestParam(name = "categoryid", required = false) String categoryid) {
		User us = (User) session.getAttribute("user");
		if (us == null)
			return "/login";
		String redirect = "redirect:/welcome";
		try {

			if (type.equals("category")) {
				Category category = categoryService.FindOne(id);
				category.setTitle(title);
				category.setContent(content);
				categoryService.UpdateCategory(category);
				session.setAttribute("id", category.getId());
				session.setAttribute("isCategory", true);
			} else if (type.equals("news")) {
				News news = newsService.FindOne(id);
				news.setTitle(title);
				news.setContent(content);
				Category category = categoryService.FindOne(Integer.valueOf(categoryid));
				news.setCategory(category);
				newsService.UpdateNews(news);
				session.setAttribute("id", news.getId());
				session.setAttribute("isCategory", false);
			}
		} catch (ObjectNotFound e) {
			return redirect;
		} catch (NoSuchElementException ex) {
			return redirect;
		}
		redirect = "redirect:/attachment";
		return redirect;
	}

	@RequestMapping(value = "/attachment", method = RequestMethod.GET)
	public String attachment(HttpSession session, ModelMap mm) {
		getDefaultValue(mm);
		String isCategory = session.getAttribute("isCategory").toString();
		int id = (Integer) session.getAttribute("id");

		mm.put("is", mm.get("isCategory"));
		String attachments;
		try {
			if (isCategory.equals("false")) {
				News news = newsService.FindOne(id);
				mm.put("title", news.getTitle());
				mm.put("id", news.getId());
				attachments = news.getLink();
			} else {
				Category category = categoryService.FindOne(id);
				mm.put("title", category.getTitle());
				mm.put("id", category.getId());
				attachments = category.getAttachment();
			}
		} catch (ObjectNotFound e) {
			return "redirect:/home";
		} catch (NoSuchElementException ex) {
			return "redirect:/home";
		}
		if (attachments == null || attachments.isEmpty())
			return "attachment";
		String[] listAttachments = attachments.split("TITLEID");
		Map<String, String> rsAttachments = new HashMap<String, String>();
		if (listAttachments.length > 0) {
			for (String link : listAttachments) {
				if (link.isEmpty() || link.equals(""))
					continue;
				else {
					String[] splitLink = link.split("ID");
					if (splitLink.length < 2)
						continue;
					else
						rsAttachments.put(splitLink[1], splitLink[0]);
				}
			}
		}
		if (!rsAttachments.isEmpty())
			mm.put("attachments", rsAttachments);

		mm.put("isCategory", isCategory);
		return "attachment";
	}

	//
	private void getDefaultValue(ModelMap mm) {
		// to show in bar category (display 3 categories and hide other in More drop
		// down)
		List<Category> categories = new ArrayList<Category>();
		categoryService.FindAll().forEachRemaining(categories::add);
		Collections.sort(categories, new Comparator<Category>() {
			@Override
			public int compare(final Category o1, final Category o2) {
				return o1.getDatecreated().compareTo(o2.getDatecreated());
			}
		});
		List<Category> three_categories = new ArrayList<Category>();
		List<Category> more_categories = new ArrayList<Category>();
		for (int i = 0; i < categories.size(); i++)
			if (i < 3)
				three_categories.add(categories.get(i));
			else
				more_categories.add(categories.get(i));

		mm.put("threecategories", three_categories);
		if (more_categories.size() > 0)
			mm.put("morecategories", more_categories);
		mm.put("categories", categories);
		//
		mm.put("news", newsService.FindAll());

		// Lastest News

		List<News> lastnews = new ArrayList<News>();
		newsService.LastNews().forEachRemaining(lastnews::add);
		Collections.sort(lastnews, new Comparator<News>() {
			@Override
			public int compare(final News o2, final News o1) {
				return o1.getDatecreated().compareTo(o2.getDatecreated());
			}
		});
		mm.put("fmt", new SimpleDateFormat("EEEEE dd/MM/yy"));
		mm.put("lastnews", lastnews);

	}

}
