package com.dgut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgut.bean.Uploadfile;
import com.dgut.bean.UploadfileExample;
import com.dgut.mapper.UploadfileMapper;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private UploadfileMapper mapper;
	// private UploadfileExample example=new UploadfileExample();

	@Override
	public int uploadfile(Uploadfile file) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(file);
	}

	@Override
	public List<Uploadfile> findUploadfile() {
		// TODO Auto-generated method stub
		List<Uploadfile> list1 = mapper.selectByExample(new UploadfileExample());
		return list1;
	}

	@Override
	public Uploadfile findfile(int id) {
		// TODO Auto-generated method stub

		return mapper.selectByPrimaryKey(id);
	}

}
