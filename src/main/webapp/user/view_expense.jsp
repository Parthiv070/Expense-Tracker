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
<title>View Expense</title>
<%@include file="../components/all_css.jsp" %>
</head>

<body class="bg-light">

<!-- handling unauthorized access -->
<c:if test="${ empty loginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>



<%@include file="../components/navbar.jsp" %>


<div class="container mt-3">
		
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="home.jsp">Dashboard</a></li>
    <li class="breadcrumb-item active" aria-current="page">View Expenses</li>
  </ol>
</nav>
</div>


<div class="container dashboard my-4">
<div class="container">
	<div class="row">
		<div class="col-md-12 offset-md-0">
			<div class="card shadow">
				<div class="card-header">
					<p class="text-center fs-3 my-auto">All Expenses</p>
					<!-- for conformation msg from session -->
					<c:if test="${not empty msg}">
						<p class="text-center text-warning fs">${msg}</p>
						<c:remove var="msg"/>
					</c:if>
				</div>
				
				<div class="card-body">
						<table class="table table-striped table-hover">
  							<thead>
							    <tr class="table-dark"> 
							      <th scope="col">Sr.</th>
							      <th scope="col">Title</th>
							      <th scope="col">Description</th>
							      <th scope="col">Date</th>
							      <th scope="col">Price</th>
							      <th scope="col">Action</th>
							    </tr>
							  </thead>
							  <tbody>
							  <%
							  
							  User user = (User) session.getAttribute("loginUser");
							  
							  ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
							  List<Expense> list = dao.getAllExpenseByUser(user);
							  long count = 0;
							  long totalSpending = 0;
							  
							  for(Expense ex : list){
								  count++;
								  totalSpending += Long.parseLong(ex.getPrice());
								  %>
								  
								<tr>
							      <td><%= count %></td>
							       <td><%= ex.getTitle() %></td>
							       <td><%= ex.getDescription() %></td>
							       <td><%= ex.getDate() %></td>
							       <td><%= ex.getPrice() %></td>
							       <td>
							       <a href="edit_expense.jsp?id=<%= ex.getId() %>" class="btn btn-sm btn-primary me-1">Edit</a>
							       <a href="../delete_expense?id=<%=ex.getId() %>" class="btn btn-sm btn-danger me-1">Delete</a>
							       </td>    
							    </tr>
							  
							  <%}
							  %>
							  <tr class="table-light">
							  <td colspan="5" class="text-end text-right"><h5>Total Spending :</h5></td>
							  <td><h5><%= totalSpending %></h5></td>
							  
							  
							  </tr>
							  
							   
							  </tbody>
							</table>
				</div>
			</div>
		</div>
	</div>
</div>



<body>

</body>
</html>