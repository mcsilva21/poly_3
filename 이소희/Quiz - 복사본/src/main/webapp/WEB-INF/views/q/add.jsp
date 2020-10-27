<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../boot.jsp"%>
<%@include file="../submitboot.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz add</title>

</head>
<body>
<section class="content-section bg-primary text-black">
<h1>Quiz Submit</h1>
<article>
	<div>
		<form method="post">
			
				<label>난이도:</label>
				<select name="step">
				<option value="1">easy</option>
				<option value="2">normal</option>
				<option value="3">hard</option>
				</select>
			
			
			<div>
				<label>퀴즈:</label>
				<input name="quiz" type="text">
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
				<input type="text" name="answer1" >
			</div>
	
			<div>
				<label>보기2:</label>
				<input type="text" name="answer2">
			</div>
			
			<div>
				<label>보기3:</label>
				<input type="text" name="answer3">
			</div>
			
			<div>
				<label>보기4:</label>
				<input type="text" name="answer4">
			</div>
			
			
			<button type="submit" class="btn btn-l btn-light mr-4">등록</button>
			<button type="button" class="return btn btn-l btn-dark" onclick="location.href='..'">취소</button>
		</form>
	</div>
	</article>
</body>
</html>