package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User u = new User(name, email, password);
		
		//System.out.println(u);
		
		//to register new user in db
		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f = dao.saveuser(u);
		
		//create session
		HttpSession session = req.getSession();
		
		if(f){
			session.setAttribute("msg", "Registered Sucessfully!");
			//System.out.println("Registered Sucessfully!");
			resp.sendRedirect("register.jsp");
		}
		else{
			session.setAttribute("msg", "Something wrong on server");
			//System.out.println("Something wrong on server");
			resp.sendRedirect("register.jsp");
			
		}
	}

}
