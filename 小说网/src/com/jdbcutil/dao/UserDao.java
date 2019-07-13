package com.jdbcutil.dao;

import com.jdbcutil.bean.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private static final String LOGIN = "select * from user where uname = ? and upassword = ?";
    private static final String FINDALL = "select * from user";
    private static final String FIND = "select * from user where uname = ?";
   /* private static final String UPDATE = "update user set UserID=?,UserNickname=?";*/
    private static final String INSERT = "insert into user(uphone, upassword,uname) values(?,?,?)";
    private static final String DELETE = "delete from user where uname = ?";

    public UserDao() {

    }

    //1.查询一个
    public User getUser(String uname){
        PreparedStatement pstat = null;
        ResultSet rs = null;
        User user = null;
        Jdbc jdbc = new Jdbc();
        try {
            pstat = jdbc.getConnection().prepareStatement(FIND);
            pstat.setString(1, uname);

            rs = pstat.executeQuery();
            if (rs.next()) {
                user = new User(rs.getString("uphone"),rs.getString("upassword"), rs.getString("uname"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //2.查询所有
    public List<User> getUsers() {
        PreparedStatement pstat = null;
        ResultSet rs = null;
        Jdbc jdbc = new Jdbc();
        List<User> userList = null;
        try {
            pstat =jdbc.getConnection().prepareStatement(FINDALL);
            rs = pstat.executeQuery();
            User user = null;
            userList = new ArrayList<User>();
            while (rs.next()) {
                user = new User(rs.getString("uphone"),rs.getString("upassword"), rs.getString("uname"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
/*

    //3.修改
    public void updateUser(User user) throws UserException {
        Connection conn = null;
        PreparedStatement pstat = null;

        try {
            pstat = DBUtil.getConnection().prepareStatement(UPDATE);

            pstat.setString(1, user.getUserID());
            pstat.setString(2, user.getUserNickname());


            pstat.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new UserException("修改用户失败！");
        }
    }
*/

    //4.增加
    public void insertUser(User user) {
        PreparedStatement pstat = null;
        try {
            Jdbc jdbc = new Jdbc();
            pstat = jdbc.getConnection().prepareStatement(INSERT);
            pstat.setString(1, user.getUphone());
            pstat.setString(2, user.getUpassword());
            pstat.setString(3, user.getUname());
            pstat.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //5.删除
    public void delUser(String uname)  {
        PreparedStatement pstat = null;
        try {
            Jdbc jdbc = new Jdbc();
            pstat =  jdbc.getConnection().prepareStatement(DELETE);
            pstat.setString(1, uname);
            pstat.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //6。登录
    public User login(String uname, String upassword)  {
        PreparedStatement pstat = null;
        ResultSet rs = null;
        User user = null;
        try {
            Jdbc jdbc = new Jdbc();
            pstat = jdbc.getConnection().prepareStatement(LOGIN);

            pstat.setString(1, uname);
            pstat.setString(2, upassword);

            rs = pstat.executeQuery();
            if (rs.next()) {
                user = new User(rs.getString("uphone"),rs.getString("upassword"), rs.getString("uname"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
