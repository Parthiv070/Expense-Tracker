package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.Expense;
import com.entity.User;

@WebServlet("/save_expense")
public class SaveExpenseServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		
		String description = req.getParameter("description");
		
		String price = req.getParameter("price");
		
		String date = req.getParameter("date");
		
		//get user id (for foriegnkey) from session
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("loginUser");
		
		Expense ex= new Expense(title, description, price, date, user);
		
		//to register new user in db
				ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
				boolean f = dao.saveuser(ex);
					
				if(f){
					session.setAttribute("msg", "Expense Added Sucessfully!");
					resp.sendRedirect("user/add_expense.jsp");
				}
				else{
					session.setAttribute("msg", "Something wrong on server");
					resp.sendRedirect("user/add_expense.jsp");
					
				}
	}

}
