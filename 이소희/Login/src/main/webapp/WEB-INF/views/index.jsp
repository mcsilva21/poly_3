<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<h1>로그인 프로젝트</h1>
		<c:if test="${sessionScope.id != null}">
			<div>${sessionScope.id}님환영합니다!</div>
			<a href="logout">로그아웃</a>
		</c:if>
		<c:if test="${sessionScope.id == null}">
			<div><a href="login">로그인</a>
			</div>
		</c:if>
		<div>
			<ul>
				<li><a href="book/list">도서 관리</a></li>
				<li><a href="customer/list">고객 관리</a></li>
				<li><a href="order/list">주문 관리</a></li>

			</ul>
		</div>
	</div>

</body>
</html>