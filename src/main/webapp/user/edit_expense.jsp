<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
<%@include file="../components/all_css.jsp" %>
</head>

<body class="bg-light">

<!-- handling unauthorized access -->
<c:if test="${ empty loginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
	Expense ex = dao.getExpenseByUser(id);
%>


<%@include file="../components/navbar.jsp" %>
<div class="container p-5">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="card shadow">
				<div class="card-header">
					<p class="text-center fs-3 my-auto">Edit Expense</p>
				</div>
				
				<div class="card-body">
					<form action="../update_expense" method="post">
						<input type="hidden" name="id" value="<%=ex.getId()%>" >
					
						<div class="mb-3">
							<label>Title:</label>
							<input type="text" name="title" class="form-control" value="<%=ex.getTitle() %>" required>
						</div>
						
						<div class="mb-3">
							<label>Description:</label>
							<textarea name="description" class="form-control" required><%=ex.getDescription()%></textarea>
						</div>
						
						<div class="mb-3">
							<label>Price:</label>
							<input type="text" name="price" class="form-control" value="<%=ex.getPrice() %>"required>
						</div>
						
						<div class="mb-3">
							<label>Date:</label>
							<input type="date" name="date" class="form-control" value="<%=ex.getDate() %>" required>
						</div>
						
						<div class="mb-3">
							<button class="btn btn-success col-md-12 ">Update</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<body>

</body>
</html>