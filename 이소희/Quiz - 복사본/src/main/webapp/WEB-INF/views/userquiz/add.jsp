<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz add</title>
</head>
<body>
	<div>
		<form method="post">
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
				<label>퀴즈:</label>
				<input type="text" name="quiz">
			</div>
			
			<div>
			<label>정답:</label>
				<select name="rightAnswer">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				</select>
			</div>
			<div>
				<label>보기1:</label>
				<input type="text" name="answer1">
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
			
			
				<input type="submit" value="등록">
			</div>			
		</form>
	</div>
</body>
</html>