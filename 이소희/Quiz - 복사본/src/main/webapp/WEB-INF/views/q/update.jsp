<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../boot.jsp"%>
<%@include file="../submitboot.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz update</title>

</head>
<body>
<section class="content-section bg-primary text-black">
		<h1>Quiz Update</h1>
		<article>
	<div>
		<form method="post">
			<div>
				<label>퀴즈번호:</label>
				<input type="number" name="quizId" value="${item.quizId}" readonly>
			</div>
			<div>
<%-- 			<input type="number" name="step" value="${item.step}"> --%>
				<label>난이도:</label>
				<select name="step">
				<option value="1">easy</option>
				<option value="2">normal</option>
				<option value="3">hard</option>
				</select>
			</div>
			<div>
				<label>퀴즈 : </label>
				<input type="text" name="quiz" value="${item.quiz}">
			</div>
			<label>정답:</label>
				<select name="rightAnswer">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				</select>
			<div>
				<label>보기1:</label>
				<input type="text" name="answer1" value="${item.answer1}">
			</div>

			<div>
				<label>보기2:</label>
				<input type="text" name="answer2" value="${item.answer2}">
			</div>
	
			<div>
				<label>보기3:</label>
				<input type="text" name="answer3" value="${item.answer3}">
			</div>

			<div>
				<label>보기4:</label>
				<input type="text" name="answer4" value="${item.answer4}">
			</div>
			
			<div>
				<button type="submit" class="btn btn- btn-light mr-4">변경</button>
			<button type="button" class="return btn btn-l btn-dark"
				onclick="location.href='..'">취소</button>
		</div>
			</div>			
		</form>
	</div>
	</article>
	</section>
	
</body>
</html>