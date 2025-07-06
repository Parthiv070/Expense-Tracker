<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="components/all_css.jsp" %>
</head>
<body class="bg-light">
<%@include file="components/navbar.jsp" %>
<div class="container p-5">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="card shadow">
				<div class="card-header">
					<p class="text-center fs-3 my-auto">Register</p>
					<!-- for conformation msg from session -->
					<c:if test="${not empty msg}">
						<p class="text-center text-success fs">${msg}</p>
						<c:remove var="msg"/>
					</c:if>
				</div>
				
				<div class="card-body">
					<form action="register" method="post">
						<div class="mb-3">
							<label>Enter Name:</label>
							<input type="text" name="name" class="form-control" required>
						</div>
						<div class="mb-3">
							<label>Enter Email:</label>
							<input type="email" name="email" class="form-control" required>
						</div>
						<div class="mb-3">
							<label>Enter Password:</label>
							<input type="password" name="password" class="form-control" required>
						</div>
						<div class="mb-3">
							<label>About:</label>
							<input type="text" name="about" class="form-control" required>
						</div>
						<div class="mb-3">
							<button class="btn btn-success col-md-12 ">Register</button>
						</div>
						<div>
						Already have an account ? <a href="login.jsp" class="text-decoration-none">login.</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>