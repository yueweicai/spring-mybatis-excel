package com.orilore.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.orilore.model.Info;
@Mapper
public interface InfoMapper {
	public void insert(Info bean);
}
