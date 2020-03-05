package com.dgut.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.dgut.bean.Uploadfile;
import com.dgut.service.FileService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class FileController {

	@Autowired
	private FileService service;
	

	private String dir = "D:\\upload";
	@RequestMapping("file_down")
	public String file_down() {
		
		return "file_down";
	}
	@RequestMapping("file_upload")
	public String file_upload() {
		
		return "file_upload";
	}
	

	@RequestMapping(value="/upload", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String upload(@RequestParam("username") String username, @RequestParam("filename") String filename,
			@RequestParam("file") List<MultipartFile> upload) {
		String filenameString = null;
		int i=0;
		// System.out.println(username+" "+filename);
		File dirPath = new File(dir);

		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}

		if (username.equals("") || username == null)
			return "0";

		if (!upload.isEmpty() && upload.size() > 0) {
			for (MultipartFile file : upload) {
				
				
				// System.out.println("asdasda" + " 2");
				String origin = file.getOriginalFilename();

				String prefix = origin.substring(origin.lastIndexOf(".") + 1);
				// System.out.println(prefix);
				Date uploadtime = new Date();
				// String sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(uploadtime);

				long sdf = Long.parseLong(("" + new Date().getTime()).substring(0, 10));
				System.out.println(prefix);
				String newname;
				Uploadfile uploadfile = new Uploadfile();

				if (filename.equals("") || filename == null) {
					newname = username + "_" + sdf + "_" + origin;
					uploadfile.setFilename(origin);
					uploadfile.setUploadname(username);
					uploadfile.setUploaddate(uploadtime);
					service.uploadfile(uploadfile);
				} else {
					if(upload.size()>1)
					{
						i++;
						filenameString=filename+"("+i+")";
						
					}
					newname = username + "_" + sdf + "_" + filenameString + "." + prefix;
					uploadfile.setFilename(filenameString+ "." + prefix);
					uploadfile.setUploadname(username);
					uploadfile.setUploaddate(uploadtime);
					service.uploadfile(uploadfile);
				}
				try {
					file.transferTo(new File(dir + "\\" + newname));

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return "0";
				}

			}
			return "1";
		}
		return "0";

	}

	@RequestMapping(value = "/findFiles", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findFiles(int page, int rows) {

		PageHelper.startPage(page, rows);

		List<Uploadfile> filelist = service.findUploadfile();

		for (Uploadfile upload1file : filelist) {
			System.out.println(upload1file);
		}

		String listjson = JSON.toJSONString(filelist);

		PageInfo info = new PageInfo<>(filelist);
		long total = info.getTotal();
		String json = "{\"total\":" + total + ",\"rows\":" + listjson + "}";
		return json;

	}

	@RequestMapping(value = "/findFile", produces = ("application/text;charset=utf-8"))
	@ResponseBody
	public String findFile(int id) {

		Uploadfile uploadfile = service.findfile(id);
		long sdf = Long.parseLong(("" + uploadfile.getUploaddate().getTime()).substring(0, 10));

		String filename = uploadfile.getUploadname() + "_" + sdf + "_" + uploadfile.getFilename();

		return filename;

	}

	@RequestMapping(value = "/download", produces = ("application/text;charset=utf-8"))
	@ResponseBody
	public ResponseEntity<byte[]> download(HttpServletRequest request, int id) throws IOException {

		// String sdf = new
		// SimpleDateFormat("yyyyMMddHHmmssSSS").format(uploadfile.getUploaddate());
		// long sdf = uploadfile.getUploaddate().getTime();

		String filename = findFile(id);

		// 澶勭悊涓枃缂栫爜
		String myFileName = new String(filename.getBytes("utf-8"), "iso-8859-1");

		// 鑾峰緱鏈嶅姟鍣ㄨ矾寰�
		// String path = request.getSession().getServletContext().getRealPath("");

		// 鑾峰緱瀹屾暣鐨勮矾寰�
		String string = dir + File.separator + filename;

		// 杈撳嚭璺緞
		System.out.println(string);

		// 璁剧疆澶翠俊鎭�
		HttpHeaders headers = new HttpHeaders();

		// 璁剧疆涓嬭浇鐨勯檮浠� (myFileName蹇呴』澶勭悊涓枃鍚嶇О鍝�!)
		headers.setContentDispositionFormData("attachment", myFileName);

		// 璁剧疆MIME绫诲瀷
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		// 鐢‵ileUpload缁勪欢鐨凢ileUtils璇诲彇鏂囦欢锛屽苟鏋勫缓鎴怰esponseEntity<byte[]>杩斿洖缁欐祻瑙堝櫒
		// HttpStatus.CREATED鏄疕TTP鐨勭姸鎬佺爜201
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(new File(string)), headers, HttpStatus.CREATED);

	}
}
