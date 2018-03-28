package com.spr.service;

import java.util.Iterator;

import com.spr.exception.ObjectNotFound;
import com.spr.model.User;

public interface UserService {
	public void InsertUser(User us);
	public Iterator<User> FindAll();
	public User FindOne(int id) throws ObjectNotFound;
	public User CheckLogin(String username,String pwd);
}
