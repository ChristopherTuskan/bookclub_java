<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/main.css"/>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>New Book</title>
</head>
<body>
	<div class="col-4 mx-auto text-white bg-dark p-3">
		<h1 class="m-3 text-warning">${book.getTitle()}</h1>
		<c:choose>
		    <c:when test="${bookUser.getName().equals(sessionUser.getName())}">
		    	<h2 class="m-3 text-primary">You read <c:out value="${book.getTitle()}"></c:out> by <c:out value="${book.getAuthor()}"></c:out></h2>
		        <h3 class="m-3 text-success">Here are your thoughts:</h3>
		    </c:when>    
		    <c:otherwise>
		        <h2 class="m-3 text-primary"><c:out value="${bookUser.getName()}"></c:out> read <c:out value="${book.getTitle()}"></c:out> by <c:out value="${book.getAuthor()}"></c:out></h2>
		        <h3 class="m-3 text-success">Here are <c:out value="${bookUser.getName()}"></c:out> thoughts:</h3>
		    </c:otherwise>
		</c:choose>
		<p class="m-3"><c:out value="${book.getThought()}"></c:out></p>
		<div class="d-flex justify-content-between">
			<c:if test="${bookUser.getName().equals(sessionUser.getName())}">
				<div>
					<button class="m-3 bg-warning" ><a href="/book/edit/${book.getId()}">edit</a></button>
					<button class="m-3 bg-warning" ><a href="/book/delete/${book.getId()}">delete</a></button>
				</div>
			</c:if>
			<c:if test="${bookUser==null}">
				<div>
					<button class="m-3 bg-warning" ><a href="/book/edit/${book.getId()}">edit</a></button>
					<button class="m-3 bg-warning" ><a href="/book/delete/${book.getId()}">delete</a></button>
				</div>
			</c:if>
			<a class="m-3 float-right" href="/dashboard">back to the shelves</a>
		</div>
	</div>
</body>
</html>