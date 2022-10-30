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
<title>Dashboard</title>
</head>
<body>
	<div class="col-6 mx-auto">
		<div class="d-flex justify-content-between">
			<h1 class="m-2 text-primary">Welcome, ${user.getName()}</h1>
			<a class="m-2" href="/logout">logout</a>
		</div>
		<div class="d-flex justify-content-between">
			<p class="m-2">Books from everyone's shevles:</p>
			<a class="m-2" href="/book/new">+ Add a to my shelf</a>
		</div>
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>
			</tr>
			<c:forEach var="book" items="${books}">
				<tr>
					<td><c:out value="${book.getId()}"></c:out></td>
					<td><a href="/book/show/${book.getId()}"><c:out value="${book.getTitle()}"></c:out></a></td>
					<td><c:out value="${book.getAuthor()}"></c:out></td>
					<td><c:out value="${book.getUser().getName()}"></c:out></td>
				</tr>
    		</c:forEach>
		</table>
	</div>
</body>
</html>