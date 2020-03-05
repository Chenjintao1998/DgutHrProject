package com.dgut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgut.bean.Notice;

@Service
public interface NoticeService {
	int release(Notice notice);

	List<Notice> findNotices();

	Notice findUser(int id);

	int deleteNotice(int[] id);

	int updateNotice(Notice notice);

	List<Notice> findNoticeLike(Notice notice);
}
