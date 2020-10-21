<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../boot.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Start Quiz</title>
	<style>
		article {
			width:90%;
			height:0 auto;
			margin:0 auto;
			padding:3em;
			background:#fff; 
		
			border:1px solid black;
			border-radius:10px;			
		}
		
		h1{text-align:center;
		color:#fff;
		}
	

	</style>
</head>
<body>
  <section class="content-section bg-primary text-black">
  	<h1>Start Quiz</h1><br>
  	<form method="post">
		<article> 		
		<c:forEach var="item" items="${list}" begin="0" end="5" varStatus="status"> 
		    <div>
		    <label><b>문 제 : ${item.quiz}</b></label><br>
		    
		    <ol>
			<li><label> <input type="radio" name="userquiz${item.quizId}" value="1">
					${item.answer1}
			</label></li>
			<li><label> <input type="radio" name="userquiz${item.quizId}" value="2">
					${item.answer2}
			</label></li>
			<li><label> <input type="radio" name="userquiz${item.quizId}" value="3">
					${item.answer3}
			</label></li>
			<li><label> <input type="radio" name="userquiz${item.quizId}" value="4">
					${item.answer4}
			</label></li>
			</ol>
		</div>
		</c:forEach>

 </article>
		
      <div class="container text-center">
      <h2 class="mb-4"></h2>
      <button type="submit" class="btn btn- btn-light mr-4">제출하기</button>
      <button type="button" class="return btn btn-l btn-dark" onclick="location.href='..'">그만두기</button>
     </div>
     
 	</form>
 	</section>
</body>
</html>