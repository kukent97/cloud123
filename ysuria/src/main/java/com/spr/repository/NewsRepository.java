package com.spr.repository;

import org.springframework.data.repository.CrudRepository;

import com.spr.model.News;

public interface NewsRepository extends CrudRepository<News,Integer>{

}
