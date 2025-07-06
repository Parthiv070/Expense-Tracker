 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<div class="container-fluid bg-dark">
<div class="container">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
  
  
    <c:if test="${empty loginUser}">
	    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-wallet pe-1"></i>ExpenseTracker.</a>
      </c:if>
      
      
    <c:if test="${ not empty loginUser}">
	    <a class="navbar-brand" href="home.jsp"><i class="fa-solid fa-wallet pe-1"></i>ExpenseTracker.</a>
      </c:if>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      
      <c:if test="${not empty loginUser}">
       <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
      <!-- dynamic displaying navbar based on loginUser session -->
      	 <li class="nav-item">
          <a class="nav-link" href="add_expense.jsp"><i class="fa-solid fa-plus pe-2"></i>Add Expense</a>
        </li>
         <li class="nav-item">
          <a class="nav-link " href="view_expense.jsp"><i class="fa-solid  fa-list pe-2"></i>View Expense</a>
        </li>
      
      </ul>
      </c:if>
      
      
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 gap-md-3">
      
      <!-- dynamic displaying navbar based on loginUser session -->
      <c:if test="${not empty loginUser}">
         <!--  
         <li class="nav-item">
          <a class="nav-link" href="../logout"><i class="fa-solid  fa-right-to-bracket pe-2"></i>logout</a>
        </li>
      	 <li class="nav-item">
          <a class="nav-link active" href="#"><i class="fa-solid fa-circle-user pe-2"></i>${loginUser.name}</a>
        </li>
        -->
        
         <li class="nav-item dropdown ">
          <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-solid fa-circle-user pe-2"></i>${loginUser.name}
          </a>
          <ul class="dropdown-menu ">
        
            <li><a class="dropdown-item" href="../logout"><i class="fa-solid  fa-right-to-bracket pe-2"></i>logout</a></li>
          </ul>
        </li>
      
      </c:if>
      
       <!-- if session is not set, display login and register menu -->
       
      <c:if test="${empty loginUser}">
        <li class="nav-item">
          <a class="nav-link active" href="login.jsp"><i class="fa-solid fa-arrow-right-to-bracket pe-2"></i>Login</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" href="register.jsp"><i class="fa-solid fa-user-plus pe-2"></i>Register</a>
        </li>      
      </c:if>
      
      
      </ul>
    </div>
  </div>
</nav>
</div>
</div>