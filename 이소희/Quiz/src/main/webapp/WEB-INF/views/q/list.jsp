<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../boot.jsp"%>
<%@include file="../listboot.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz list</title>
<style>
.table {
	table-layout: fixed;
}

.table th, .table td {
	padding: 10px 0;
}

.table thead th, .table tbody td {
	vertical-align: middle;
}

.table tbody td {
	color: #666
}
</style>
</head>
<body>
	<br>
	<div>
		<h1>Quiz List</h1>
		<article>
			<table class="table">
				<colgroup>
					<col>
					<col>
					<col style="width: 300px">
					<col>
					<col style="width: 200px">
					<col style="width: 200px">
					<col style="width: 200px">
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">난이도</th>
						<th scope="col">퀴즈번호</th>
						<th scope="col">퀴즈</th>
						<th scope="col">정답</th>
						<th scope="col">보기1</th>
						<th scope="col">보기2</th>
						<th scope="col">보기3</th>
						<th scope="col">보기4</th>
						<th scope="col">관리</th>
					</tr>
				</thead>


				<tbody>

					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.step}</td>
							<td>${item.quizId}</td>
							<td>${item.quiz}</td>
							<td>${item.rightAnswer}</td>
							<td>${item.answer1}</td>
							<td>${item.answer2}</td>
							<td>${item.answer3}</td>
							<td>${item.answer4}</td>
							<td><a href="${item.quizId}/delete">삭제</a><br> <a
								href="${item.quizId}/update">변경</a></td>
						</tr>
					</c:forEach>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록 된 퀴즈가 없습니다</td>
						</tr>
					</c:if>
				</tbody>

				</div>
			</table>

			<nav aria-label="Page navigation example" style="padding-left: 40%;">
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						href="?page=1&${pager.query}">처음으로</a></li>
					<li class="page-item"><a class="page-link"
						href="?page=${pager.prev}&${pager.query}">Previous</a></li>

					<c:forEach var="page" items="${pager.list}">
						<li class="${page == pager.page ? 'active' : ''}"><a
							class="page-link" href="?page=${page}&${pager.query}">${page}</a></li>
					</c:forEach>

					<li class="page-item"><a class="page-link"
						href="?page=${pager.next}&${pager.query}">Next</a></li>
					<li class="page-item"><a class="page-link"
						href="?page=${pager.last}&${pager.query}">마지막으로</a></li>
				</ul>
			</nav>

			<br>
			<div>
				<button class="btn btn- btn-light mr-4">
					<a href="add">등록</a>
				</button>
				<button class="return btn btn-l btn-dark">
					<a href="..">처음으로</a>
				</button>
			</div>


		</article>
</body>
</html>