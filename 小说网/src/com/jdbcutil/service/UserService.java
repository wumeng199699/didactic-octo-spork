package com.jdbcutil.service;

import com.jdbcutil.bean.User;
import com.jdbcutil.dao.UserDao;

import java.util.List;


public class UserService {
    //1查询一个
    public User getUser(String uname) {
        UserDao userDao = new UserDao();
        return userDao.getUser(uname);
    }

    //2查询所有
    public List<User> getUsers() {
        UserDao userDao = new UserDao();

        return userDao.getUsers();
    }

   /* //3修改
    public void updateUser(User user) throws UserException {
        UserDao userDao = new UserDao();

        userDao.updateUser(user);
    }*/

    //4增加
    public void insertUser(User user) {
        UserDao userDao = new UserDao();
        userDao.insertUser(user);
    }

    //5删除
    public void delUser(String uname)  {
        UserDao userDao = new UserDao();
        userDao.delUser(uname);
    }

    //6登录
    public User login(String uname, String upassword) {
        UserDao userDao = new UserDao();
        return userDao.login(uname, upassword);
    }
}
