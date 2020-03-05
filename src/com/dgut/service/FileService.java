package com.dgut.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dgut.bean.Uploadfile;

@Service
public interface FileService {
	int uploadfile(Uploadfile file);

	List<Uploadfile> findUploadfile();

	Uploadfile findfile(int id);
}
