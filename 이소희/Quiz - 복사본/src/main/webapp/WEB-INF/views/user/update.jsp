<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../boot.jsp"%>
<%@include file="../submitboot.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user update</title>
</head>
<body>
<section class="content-section bg-primary text-black">
		<h1>User Update</h1>
		<article>

	<table class="chart">
		<form method="post">
			<div>
				<label>고객번호:</label>
				<input type="number" name="userid" value="${item.userId}" readonly>
			</div>
			<div>
				<label>아 이 디 : </label>
				<input type="text" name="id" value="${item.id}">
			</div>
			<div>
				<label>비밀번호:</label>
				<input type="text" name="pw" value="${item.pw}">
			</div>
			
				
			</table>

		<br>
			<div>

			<button type="submit" class="btn btn- btn-l mr-4">변경</button>
			<button type="button" class="return btn btn-l btn-dark"
				onclick="location.href='..'">취소</button>
			</div>	
		</form>
		</section>
	</article>

</body>
</html>