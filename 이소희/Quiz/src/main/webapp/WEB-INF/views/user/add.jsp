<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../boot.jsp"%>
<%@include file="../submitboot.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user add</title>
<style>
div {
	position: relative;
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>

		<h1>Signup</h1>
		<article>

	<table class="chart">
		<form method="post">			
			<div>	
				<input type="text" name="id" placeholder="아이디를 입력하세요">
				<br>
			<button type="submit" class="btn btn-md btn-light mr-4">중복확인</button>
			</div>
			<br>
			<div>

				<input type="text" name="pw" placeholder="비밀번호를 입력하세요">
			</div>
			<br>
			<div>
				<input type="text" name="pw" placeholder="이름을 입력하세요">
			</div>
			<br>
			<div>
				<input type="text" name="pw" placeholder="전화번호를 입력하세요">
			</div>
			</table>

		<br>
		<div>

			<button type="submit" class="btn btn-l mr-4">가입</button>
			<button type="button" class="return btn btn-l btn-dark"
				onclick="location.href='..'">취소</button>
		</div>
	</form>
	</section>
	</article>
</body>
</html>