package com.jdbcutil.controller;

import com.jdbcutil.bean.User;
import com.jdbcutil.service.UserService;
import org.omg.CORBA.UserException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userRegister")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserRegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type", "application/json;charset=utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String uphone = request.getParameter("uphone");
        if (uphone == "" || uphone == null) {
            request.setAttribute("message", "手机号不能为空!");
            request.getRequestDispatcher("zhuce.jsp").forward(request, response);
        }
        String uname = request.getParameter("uname");
        if (uname == "" || uname == null) {
            request.setAttribute("message", "用户名不能为空!");
            request.getRequestDispatcher("zhuce.jsp").forward(request, response);
        }
        String upassword = request.getParameter("upassword");
        String upassword2= request.getParameter("upassword2");
        System.out.println("uphone :  " + uphone);
        System.out.println("uname :  " + uname);
        System.out.println("upassword :  " + upassword);
        System.out.println("upassword2 :  " + upassword2);
        if (!upassword.equals(upassword2)) {
            request.setAttribute("message", "两次密码不一致!");
            request.getRequestDispatcher("zhuce.jsp").forward(request, response);
        }
        UserService userService = new UserService();
        User user  = userService.getUser(uname);
        if (user == null) {
            user = new User(uphone, upassword,uname);
            userService.insertUser(user);
            request.getSession().setAttribute("user", user);
            request.setAttribute("message", "注册成功!");
            request.getRequestDispatcher("shouye.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "已经存在相同账号了!");
            request.getRequestDispatcher("zhuce.jsp").forward(request, response);
        }
    }

}