package com.dgut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.dgut.bean.Notice;
import com.dgut.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	

	@RequestMapping("notice_search")
	public String User_search() {
		
		return "notice_search";
	}
	@RequestMapping("notice_add")
	public String User_add() {
		
		return "notice_add";
	}


	@RequestMapping(value = "addnotice", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addnotice(Notice notice) {

		if (notice.getUsername().equals("") || notice.getUsername() == null)
			return "0";
		int i = service.release(notice);

		if (i == 1)
			return "1";
		else {
			return "0";
		}
	}

	@RequestMapping(value = "findNotices", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findNotices(int page, int rows) {
		PageHelper.startPage(page, rows);

		List<Notice> notices = service.findNotices();

		String noticejson = JSON.toJSONString(notices);
		PageInfo<Notice> info = new PageInfo<>(notices);
		long total = info.getTotal();

		/*
		 * for (Notice notice : notices) { System.out.println("==-===" + notice); }
		 */

		String json = "{\"total\":" + total + ",\"rows\":" + noticejson + "}";
		return json;

	}

	@RequestMapping(value = "findNotice", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findNotice(int id) {
		Notice notice = service.findUser(id);

		String noticejson = JSON.toJSONString(notice);

		// System.out.println("==-===" + notice);

		return noticejson;

	}

	@RequestMapping(value = "deleteNotice", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteNotice(int[] id) {

		int i = service.deleteNotice(id);

		if (i == 1)
			return "1";
		else {
			return "0";
		}

	}

	@RequestMapping(value = "updateNotice", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateNotice(Notice notice) {
		System.out.println("==-===" + notice);
		int i = service.updateNotice(notice);

		if (i == 1)
			return "1";
		else {
			return "0";
		}

	}

	@RequestMapping(value = "findNoticeLike", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findNoticeLike(Notice notice, int page, int rows) {
		PageHelper.startPage(page, rows);
		List<Notice> notices = service.findNoticeLike(notice);
		System.out.println(notice);
		String noticejson = JSON.toJSONString(notices);
		PageInfo<Notice> info = new PageInfo<>(notices);
		long total = info.getTotal();

		String json = "{\"total\":" + total + ",\"rows\":" + noticejson + "}";
		System.out.println(json);
		return json;

	}

}
