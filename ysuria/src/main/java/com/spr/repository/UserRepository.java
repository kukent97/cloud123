package com.spr.repository;

import org.springframework.data.repository.CrudRepository;

import com.spr.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {

}
