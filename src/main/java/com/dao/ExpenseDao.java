package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entity.Expense;
import com.entity.User;

public class ExpenseDao {
	private SessionFactory factory = null;
	private Session session = null;
	private Transaction tx = null;

	public ExpenseDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveuser(Expense expense) {
		boolean f =false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			session.save(expense);
			
			tx.commit();
			
			f = true;//if true then data stored on database othervise not

		} catch (Exception e) {
			if(tx != null) {
				f = false;
				e.printStackTrace();
			}
		}
		return f;
	}
	
	public List<Expense> getAllExpenseByUser(User user){
		List<Expense> list = new ArrayList<Expense>();
		
		try {
			session = factory.openSession();
			Query q = session.createQuery("from Expense where user=:us");
			q.setParameter("us",user);
			list = q.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public Expense getExpenseByUser(int id){
		Expense ex = null;
		try {
			session = factory.openSession();
			Query q = session.createQuery("from Expense where id=:id");
			q.setParameter("id",id);
			ex = (Expense) q.uniqueResult();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ex;
		
	}
	
	public boolean updateExpense(Expense expense) {
		boolean f =false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			session.saveOrUpdate(expense);
			
			tx.commit();
			
			f = true;//if true then data stored on database othervise not

		} catch (Exception e) {
			if(tx != null) {
				f = false;
				e.printStackTrace();
			}
		}
		return f;
	}
	
	public boolean deleteExpense(int id) {
		boolean f =false;
		try {
			session = factory.openSession();
			tx = session.beginTransaction();
			
			Expense ex = session.get(Expense.class, id);
			
			session.delete(ex);
			
			tx.commit();
			f = true;//if true then data stored on database othervise not

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}
	
	
}
