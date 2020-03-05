package com.dgut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.Notice;
import com.dgut.bean.NoticeExample;
import com.dgut.bean.NoticeExample.Criteria;
import com.dgut.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;
	private NoticeExample example = new NoticeExample();

	@Override
	public int release(Notice notice) {
		// TODO Auto-generated method stub
		example.getOredCriteria().clear();
		return mapper.insertSelective(notice);
	}

	@Override
	public List<Notice> findNotices() {
		// TODO Auto-generated method stub
		/*
		 * for (Notice iterable_element : mapper.selectByExampleWithBLOBs(example)) {
		 * System.out.println(iterable_element); }
		 */
		example.getOredCriteria().clear();
		return mapper.selectByExampleWithBLOBs(example);
	}

	@Override
	public Notice findUser(int id) {
		// TODO Auto-generated method stub
		// example.createCriteria().andIdEqualTo(id);
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteNotice(int[] id) {
		// TODO Auto-generated method stub
		int z = 0;
		for (int i : id) {
			mapper.deleteByPrimaryKey(i);
			System.out.println(i);
			z++;
		}
		if (z == id.length)
			return 1;
		else {
			return 0;
		}
	}

	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub

		return mapper.updateByPrimaryKeySelective(notice);
	}

	@Override
	public List<Notice> findNoticeLike(Notice notice) {
		// TODO Auto-generated method stub
		example.getOredCriteria().clear();
		Criteria criteria = example.createCriteria();
		if (notice.getName() != null && notice.getName() != "")
			criteria.andNameLike("%" + notice.getName() + "%");
		if (notice.getUsername() != null && notice.getUsername() != "")
			criteria.andUsernameLike("%" + notice.getUsername() + "%");
		if (notice.getTitle() != null && notice.getTitle() != "")
			criteria.andTitleLike("%" + notice.getTitle() + "%");
		example.or();
		return mapper.selectByExampleWithBLOBs(example);
	}

}
