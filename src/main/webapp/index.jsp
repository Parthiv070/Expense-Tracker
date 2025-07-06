<%@page import="com.db.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker</title>
<%@include file="components/all_css.jsp"%>
<style type="text/css">
		
		.bannerContent h3 span {
		font-size:45px;
		font-weight:bold;
		  background: #0acefe;
		  background: linear-gradient(to right, #0000cc 0%, #000000 100%);
		  -webkit-background-clip: text;
		  -webkit-text-fill-color: transparent;
		}
	
		.highlightSection {
		  background-color: #f5f9ff;
		}
		.highlightSection h2,.bold{
		  font-weight: bold;
		}
		.highlightItems {
		  border-radius: 15px;
		}
		.highlightItems:hover {
		  box-shadow: 1px 1px 10px rgb(214, 214, 214);
		}
		.highlightItems img {
		border-radius:15px;
		  width: 70px;
		  height: 70px;
		}
		.highlightItems h4 {
		  font-size: 18px;
		}
		.highlightItems p {
		  font-size: small;
		}
		
		.bookClass {
		  background: linear-gradient(45deg, #0acefe, #2699fb);
		  border-radius: 20px;
		  color: white;
		  padding: 80px 20px;
		}
		.bookClass a {
		  font-weight: bold;
		}
		.bookClass h2 {
		  font-weight: bold;
		}
		.bookClass a:hover {
		  color: black;
		  box-shadow: 7px 7px 0px black;
		}
</style>
</head>
<body class="bg-light">
<%@include file="components/navbar.jsp" %>


  <!-- Hero  -->
  <section class="container-fluid py-4 py-md-5 my-md-5">
    <div class="container">
      <div class="row align-items-center justify-content-between gy-4">
        <div class="col-12 col-lg-6">
          <div class="bannerContent">
            <h3><span class="bold">Expense Tracker.</span><br/>Effortless Expense Tracking Made Simple.</h3>
            <p class="pt-2"> Whether you’re managing your daily spending or tracking specific budgets, Expense Tracker makes it easy and efficient — all in one place.</p>
            <div class="hero-btn mt-3">
              <a class="btn btn-primary" href="register.jsp">Get Started</a>
            </div>
          </div>
        </div>
        <div class="col-12 col-lg-5">
         			<div id="carouselExampleFade" class="carousel slide carousel-fade">
		  <div class="carousel-inner rounded-2">
		    <div class="carousel-item active">
		      <img src="img/ex0.jpg" class="d-block w-100" alt="Hero Img1" >
		    </div>
		
		    <div class="carousel-item">
		      <img src="img/ex2.jpg" class="d-block w-100" alt="Hero Img3">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
        </div>
      </div>
      </div>
      </section>
      
      
      
  <!-- highlights  -->
  <section class="container-fluid highlightSection py-5 mt-5">
    <div class="container">
      <div class="row mb-1">
        <div class="col-12 py-3 ">
          <h2>Features of Expense tracker</h2>
        </div>
      </div>
      <div class="row gy-4">
        <div class="col-md-6 col-12">
          <div class="bg-white p-3 d-flex gap-3 highlightItems">
            <img src="img/B1.png" alt="Highlights bg">
            <div>
              <h4 class="bold"> Secure User Authentication</h4>
              <p>Create an account or log in securely. We use session management to ensure your data is protected every step of the way.</p>
            </div>

          </div>
        </div>
        <div class="col-md-6 col-12">
          <div class="bg-white p-3 d-flex gap-3 highlightItems">
            <img src="img/B2.png" alt="Highlights bg">
            <div>
              <h4 class="bold"> Add Your Expenses</h4>
              <p>Easily log any type of expense with details like amount, date, and description.</p>
            </div>

          </div>
        </div>
        <div class="col-md-6 col-12">
          <div class="bg-white p-3 d-flex gap-3 highlightItems">
            <img src="img/B3.png" alt="Highlights bg">
            <div>
              <h4 class="bold">View & Manage</h4>
              <p>Get a clear overview of your expenses. See them all listed and manage them in one simple dashboard.</p>
            </div>

          </div>
        </div>
        <div class="col-md-6 col-12">
          <div class="bg-white p-3 d-flex gap-3 highlightItems">
            <img src="img/B4.png" alt="Highlights bg">
            <div>
              <h4 class="bold">Edit & Delete</h4>
              <p>Need to make a change or remove an entry? You’re always in control.</p>
            </div>
          </div>
        </div>
       
       
      </div>
    </div>
  </section>


  <section class="container-fluid my-5">
    <div class="container">
      <div class="row">
        <div class="col-12" id="bookClass">
          <div class="bookClass text-center">
            <h2 class="bold">Ready to Take Control of Your Expenses?</h2>
            <p>Sign up to start tracking | Already have an account? Log in and take charge</p>
            <a class="btn bg-white" href="register.jsp">Sign up</a>
             <a class="btn bg-white" href="login.jsp">Login</a>
          </div>
        </div>
      </div>
    </div>
	</section>

</body>
</html>