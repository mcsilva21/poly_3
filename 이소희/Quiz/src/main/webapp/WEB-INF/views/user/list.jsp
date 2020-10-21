<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../boot.jsp"%>
<%@include file="../listboot.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user list</title>
<style type="text/css">
 li{list-style:none;}
 </style>
</head>
<body>
<br>
	<div>
			<h1>User List</h1>
	</div>
	<article>
		
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">고객번호</th>
						<th scope="col">아이디</th>
						<th scope="col">비밀번호</th>
						<th scope="col">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.userId}</td>
							<td>${item.id}</td>
							<td>${item.pw}</td>
							<td><a href="${item.userId}/delete">삭제</a> <a href="${item.userId}/update">변경</a></td>
						</tr>
					</c:forEach>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록 된 고객이 없습니다</td>
						</tr>
					</c:if>					
				</tbody>
			</table>
		</div>
		<nav aria-label="Page navigation example">
  <ul class="pagination">
<div>
    <li class="page-item"><a class="page-link" href="?page=${pager.next}&${pager.query}">Previous</a></li>
    <li class="page-item"><a class="page-link" href="http://localhost:8011/user/list?page=1&">1</a></li>

    <li class="page-item"><a class="page-link" href="?page=${pager.last}&${pager.query}">Last</a></li>
  </div>
  </ul>
</nav>
<br>
	<div>
		<button class="btn btn- btn-light mr-4"><a href="add">등록</a></button>
		<button class="return btn btn-l btn-dark"><a href="..">처음으로</a></button>
	</div>


	</article>
</body>
</html>