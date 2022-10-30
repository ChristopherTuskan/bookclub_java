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
		<h1 class="m-3 text-warning">Edit Your Book!</h1>
		<form:form action="/book/update/${book.getId()}" method="post" modelAttribute="book">
			<div class="form-group m-3">
				<form:label path="title">Title:</form:label>
				<form:errors class="text-danger" path="title"/>
				<form:input path="title" value="${book.getTitle()}" class="form-control"/>
			</div>
			<div class="form-group m-3">
				<form:label path="author">Author:</form:label>
				<form:errors class="text-danger" path="author"/>
				<form:input path="author" value="${book.getAuthor()}" class="form-control"/>
			</div>
			<div class="form-group m-3">
				<form:label path="thought">My Thoughts:</form:label>
				<form:errors class="text-danger" path="thought"/>
				<form:textarea path="thought" value="${book.getThought()}" class="form-control"/>
			</div>
			<div class="d-flex justify-content-between">
				<input type="submit" value="Submit" class="m-3 bg-warning"/>
				<a class="m-3" href="/dashboard">back to the shelves</a>
			</div>
		</form:form>
	</div>
</body>
</html>