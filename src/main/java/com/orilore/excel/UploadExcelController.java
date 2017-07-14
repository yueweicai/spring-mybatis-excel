package com.orilore.excel;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/save.do")
	public String save(HttpServletRequest request){
		HttpSession session = request.getSession();
		try{
			List<Info> infos = (List<Info>) session.getAttribute("infos");
			session.removeAttribute("infos");
			if(infos!=null && infos.size()>0){
				service.addInfos(infos);
			}
			return "success";
		}catch(Exception ex){
			return "error";
		}
	}
	
	@RequestMapping("/upload.do")
	public String execute(HttpServletRequest request){
		HttpSession session = request.getSession();
		try{
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;    
	        InputStream in =null;  
	        List<List<Object>> listob = null;  
	        MultipartFile file = multipartRequest.getFile("upfile");  
	        in = file.getInputStream();
	        listob = new Excel().getBankListByExcel(in,file.getOriginalFilename());  
	        in.close();  
	        List<Info> infos = new ArrayList<Info>();
	        for (int i = 0; i < listob.size(); i++) {  
	            List<Object> lo = listob.get(i);  
	            Info vo = new Info();  
	            vo.setCode(String.valueOf(lo.get(0)));  
	            vo.setName(String.valueOf(lo.get(1)));  
	            vo.setDate(String.valueOf(lo.get(2)));  
	            vo.setMoney(String.valueOf(lo.get(3)));  
	            infos.add(vo);
	        }
	        session.setAttribute("infos", infos);
	        return "redirect:index.do";
		}catch(Exception ex){
			ex.printStackTrace();
			session.setAttribute("msg",ex.getMessage());
			return "redirect:index.do";
		}
	}
}
