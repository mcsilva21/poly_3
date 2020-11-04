<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">

				<c:if test="${list.size() < 1}">
						<li>등록된 리뷰가 없습니다.</li>
				</c:if>
				
				<c:forEach var="item" items="${list}">
					<li>${item.content} (${item.custid}) ${item.star} </li>
				</c:forEach>
