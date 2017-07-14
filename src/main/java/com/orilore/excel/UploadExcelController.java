package com.orilore.excel;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.orilore.model.Info;
import com.orilore.service.InfoService;
import com.orilore.util.Excel;

@Controller
public class UploadExcelController {
	@Resource
	private InfoService service;
	@RequestMapping("/upload.do")
	public String execute(HttpServletRequest request){
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
	        InputStream in =null;  
	        List<List<Object>> listob = null;  
	        MultipartFile file = multipartRequest.getFile("upfile");  
	        if(file.isEmpty()){  
	            throw new Exception("文件不存在！"); 
	        } 
	        in = file.getInputStream();
	        listob = new Excel().getBankListByExcel(in,file.getOriginalFilename());  
	        in.close();  
	        List<Info> infos = new ArrayList<Info>();
	        //调用service方法进行数据保存到数据库中
	        for (int i = 0; i < listob.size(); i++) {  
	            List<Object> lo = listob.get(i);  
	            Info vo = new Info();  
	            vo.setCode(String.valueOf(lo.get(0)));  
	            vo.setName(String.valueOf(lo.get(1)));  
	            vo.setDate(String.valueOf(lo.get(2)));  
	            vo.setMoney(String.valueOf(lo.get(3)));  
	            infos.add(vo);
	        }
	        this.service.addInfos(infos);
	        return "success";
		}catch(Exception ex){
			ex.printStackTrace();
			return "error";
		}
	}
}
