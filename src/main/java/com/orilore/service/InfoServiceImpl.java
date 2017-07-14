package com.orilore.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.orilore.mapper.InfoMapper;
import com.orilore.model.Info;

@Service
public class InfoServiceImpl implements InfoService{
	@Resource
	private InfoMapper mapper;
	@Override
	public void addInfos(List<Info> beans) {
		for (Info bean : beans) {
			mapper.insert(bean);
		}
	}
}
