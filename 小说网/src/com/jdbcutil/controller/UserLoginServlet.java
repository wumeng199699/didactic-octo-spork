package com.jdbcutil.controller;

import com.jdbcutil.bean.User;
import com.jdbcutil.service.UserService;
import org.omg.CORBA.UserException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserLoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type", "application/json;charset=utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String uname = request.getParameter("uname");
        String upassword = request.getParameter("upassword");
        System.out.println("uname :  " + uname);
        System.out.println("upassword :  " + upassword);
        UserService userService = new UserService();
        User user =  userService.login(uname, upassword);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            request.setAttribute("message", "登陆成功！");
            request.getRequestDispatcher("shouye.jsp").forward(request, response);
            request.getSession().setAttribute("uname", request.getRemoteAddr()+uname);
            Cookie c=new Cookie("JSESSIONID",request.getSession().getId());
            c.setMaxAge(60*100);
            c.setPath("/");
            response.addCookie(c);
        } else {
            request.setAttribute("message","用户名或者密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }


}
