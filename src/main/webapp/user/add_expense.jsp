<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>
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
    <li class="breadcrumb-item active" aria-current="page">Add Expense</li>
  </ol>
</nav>
</div>



<div class="container mt-3">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="card shadow">
				<div class="card-header">
					<p class="text-center fs-3 my-auto">Add Expense</p>
					<!-- for conformation msg from session -->
					<c:if test="${not empty msg}">
						<p class="text-center text-warning fs">${msg}</p>
						<c:remove var="msg"/>
					</c:if>
				</div>
				
				<div class="card-body">
					<form action="../save_expense" method="post">
						<div class="mb-3">
							<label>Title:</label>
							<input type="text" name="title" class="form-control" required>
						</div>
						
						<div class="mb-3">
							<label>Description:</label>
							<textarea name="description" class="form-control" required> </textarea>
						</div>
						
						<div class="mb-3">
							<label>Price:</label>
							<input type="text" name="price" class="form-control" required>
						</div>
						
						<div class="mb-3">
							<label>Date:</label>
							<input type="date" name="date" class="form-control" required>
						</div>
						
						<div class="mb-3">
							<button class="btn btn-success col-md-12 ">Add<i class="fa-solid fa-plus ms-2"></i></button>
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