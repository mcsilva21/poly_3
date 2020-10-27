<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="boot.jsp"%>
<%@include file="submitboot.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>quiz login</title>
<style>
div {
	position: relative;
	text-align: center;
	margin: 0 auto;
}
</style>
</head>
<body>
	<section class="content-section bg-primary text-black">
		<h1>login</h1>
		<article>

			<form method="post">
				<div>
					<input name="id" type="text"
						placeholder="아이디를 입력하세요">
				</div>
				<br>
				<div>
					 <input name="pw" type="password"
						placeholder="비밀번호를 입력하세요">
				</div>

		<br>
		<div>

			<button type="submit" class="btn btn-xl btn-light mr-4">로그인</button>
			<button type="button" class="return btn btn-xl btn-dark"
				onclick="location.href='..'">취소</button>
		</div>
	</form>
	</section>
		</article>
</body>
</html>