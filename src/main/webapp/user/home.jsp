<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome ${loginUser.name}</title>
<%@include file="../components/all_css.jsp" %>
   <style>
		   .dashboard a{
		   text-decoration: none !important;
			
		   }
        .dashboard-card, .dashboard a {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

<!-- Display navbar-->
<%@include file="../components/navbar.jsp" %>

<!-- handling unauthorized access -->
<c:if test="${ empty loginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>

<%
	User user = (User) session.getAttribute("loginUser");
	ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
	List<Expense> list = dao.getAllExpenseByUser(user);
	
	long total_expense = 0;
	int total_expense_list = 0;
	
	for(Expense ex : list){
		total_expense_list++;
		total_expense += Long.parseLong(ex.getPrice());
	}
%>

<div class="container dashboard my-4">

	<div class="row">
		<div class="col col-md-6">	
		<a href="view_expense.jsp">
	 	<div class="card text-bg-light box">
  			<div class="card-header"><h1><i class="fa fa-book"></i></h1></div>
  			<div class="card-body">
  			  <h5 class="card-title">Total Expense log</h5>
  			  <h1><%= total_expense_list %></h1>
    		</div>
		</div>
		</a></div>
		
		<div class="col col-md-6">
			<a href="view_expense.jsp" >
	 	<div class="card text-bg-light box"  >
  			<div class="card-header"><h1><i class="fa fa-money-bills"></i></h1></div>
  			<div class="card-body">
  			  <h5 class="card-title">Total Amount spent</h5>
  			  <h1><%= total_expense %></h1>
    		</div>
		</div>
		</a>
		</div>	 	
		 	
</div>
</div>

 <div class="container mb-5">
        <div class="row">
            <!-- Add Expense -->
            <div class="col-md-6 ">
                <div class="card dashboard-card text-center p-4 body-light">
                    <div class="card-body">
                        <h5 class="card-title font-weight-bold">Add New Expense</h5>
                        <p class="card-text">Record a new transaction to keep your spending in check.</p>
                        <a href="add_expense.jsp" class="btn btn-dark w-100">Add Expense</a>
                    </div>
                </div>
            </div>

            <!-- View Expenses -->
            <div class="col-md-6">
                <div class="card dashboard-card text-center p-4 body-light">
                    <div class="card-body">
                        <h5 class="card-title">View All Expenses</h5>
                        <p class="card-text">Check your past expenses and track your spending patterns.</p>
                        <a href="view_expense.jsp" class="btn btn-dark w-100">View Expenses</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>