<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="boot.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>quiz home</title>

</head>
		
<body id="page-top">			

  <!-- Navigation -->
  <a class="menu-toggle rounded" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a class="js-scroll-trigger" href="#page-top">Start Quiz Project</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#page-top">Home</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#portfolio">Main Menu</a>
      </li>     
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#services">Services</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#footer">footer</a>
      </li>
    </ul>
  </nav>

  <!-- Header -->
  <header class="masthead d-flex">
    <div class="container text-center my-auto">
      <h1 class="mb-1">QUIZ PROJECT</h1>
      <h3 class="mb-5">
        <em>welcome to quiz project!</em>
      </h3>
      
      
      <!-- 로그인 -->
		<c:if test="${sessionScope.user == null}">
			<div>
      <a class="btn btn-primary btn-xl js-scroll-trigger" href="login">login</a>
      <a class="btn btn-primary btn-xl js-scroll-trigger" href="user/add">sign up</a>
 
			</div>
		</c:if>
		<c:if test="${sessionScope.user != null}">
			<div>
			<a class="btn btn-primary btn-md js-scroll-trigger" href="logout">logout(${sessionScope.user.id}님)</a>
			</div>
		</c:if>
      
    </div>
    <div class="overlay"></div>
  </header>




  <!-- Portfolio -->
  <section class="content-section" id="portfolio">
    <div class="container">
      <div class="content-section-heading text-center">
        <h3 class="text-secondary mb-0">Main Menu</h3>
        <h2 class="mb-5">Quiz Projects Menu</h2>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6">
          <a class="portfolio-item" href="q/exam">
            <div class="caption">
              <div class="caption-content">
                <div class="h2">퀴즈 시작</div>
                <p class="mb-0">퀴즈 시작하기</p>
              </div>
            </div>
            <img class="img-fluid" src="/resources/img/portfolio-1.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="board/writeView">
            <div class="caption">
              <div class="caption-content">
                <div class="h2">게시판</div>
                <p class="mb-0">게시판 목록으로 이동하기</p>
              </div>
            </div>
            <img class="img-fluid" src="/resources/img/portfolio-2.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="user/list">
            <div class="caption">
              <div class="caption-content">
                <div class="h2">회원 관리</div>
                <p class="mb-0">회원 목록으로 이동</p>
              </div>
            </div>
            <img class="img-fluid" src="/resources/img/portfolio-3.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <a class="portfolio-item" href="q/list">
            <div class="caption">
              <div class="caption-content">
                <div class="h2">퀴즈 관리</div>
                <p class="mb-0">퀴즈 목록 페이지로 이동</p>
              </div>
            </div>
            <img class="img-fluid" src="/resources/img/portfolio-4.jpg" alt="">
          </a>
        </div>
      </div>
    </div>
  </section>
  
  
  <!-- Services -->
  <section class="content-section bg-primary text-white text-center" id="services">
    <div class="container">
      <div class="content-section-heading">
        <h3 class="text-secondary mb-0">Services</h3>
        <h2 class="mb-5">What We Offer</h2>
      </div>
      <div class="row">
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-screen-smartphone"></i>
          </span>
          <h4>
            <strong>Responsive</strong>
          </h4>
          <p class="text-faded mb-0">Looks great on any screen size!</p>
        </div>
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-pencil"></i>
          </span>
          <h4>
            <strong>Redesigned</strong>
          </h4>
          <p class="text-faded mb-0">Freshly redesigned for Quiz</p>
        </div>
        <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-like"></i>
          </span>
          <h4>
            <strong>Favorited</strong>
          </h4>
          <p class="text-faded mb-0">Millions of users
            <i class="fas fa-heart"></i>
            Start QuizProject!</p>
        </div>
        <div class="col-lg-3 col-md-6">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-mustache"></i>
          </span>
          <h4>
            <strong>Question</strong>
          </h4>
          <p class="text-faded mb-0">I mustache you a question...</p>
        </div>
      </div>
    </div>
  </section>
  


  <!-- Footer -->
  <footer class="footer text-center" id="footer">
    <div class="container">
      <ul class="list-inline mb-5">
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#!">
            <i class="icon-social-facebook"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#!">
            <i class="icon-social-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white" href="#!">
            <i class="icon-social-github"></i>
          </a>
        </li>
      </ul>
      <p class="text-muted small mb-0">Copyright &copy; Your Website 2020</p>
    </div>
  </footer>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/stylish-portfolio.min.js"></script>

</body>

</html>
