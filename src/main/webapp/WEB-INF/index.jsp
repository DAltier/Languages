<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>Languages</title>
</head>

<body>   
	<div class="container">
		<div class="row justify-content-center mb-2">
			<div class="col p-4">
				<h1 class="text-center">List of Languages</h1>
			</div>
		</div>
		<div class="row">
			 <table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col"><h5>Name</h5></th>
						<th scope="col"><h5>Creator</h5></th>
						<th scope="col"><h5>Version</h5></th>
						<th scope="col"><h5>Actions</h5></th>
					</tr>					        		
				</thead>
				<c:forEach items="${languages}" var="language">								    
					<tr>
						<td><h6><a href="/languages/${language.id}"><c:out value="${language.name}"/></a></h6></td>
						<td><h6><c:out value="${language.creator}"/></h6></td>
						<td><h6><c:out value="${language.version}"/></h6></td>
						<td><h6><a href="/languages/delete/${language.id}">Delete</a> | <a href="/languages/${language.id}/edit">Edit</a></h6></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="row justify-content-center mb-4">
			<div class="col">
				<h2 class="text-center">New Language</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-4 p-2">
				<form:form action="/languages" method="post" modelAttribute="language">
					<div class="row justify-content-start">
						<div class="col-6">
							<form:label path="name">Name</form:label>
							<p class="text-danger"><form:errors path="name"/></p>
						</div>
						<div class="col-6">
							<form:input path="name"/>
						</div>
					</div>
					<div class="row justify-content-start">
						<div class="col-6">
							<form:label path="creator">Creator</form:label>
							<p class="text-danger"><form:errors path="creator"/></p>
						</div>
						<div class="col-6">  
							<form:input path="creator"/>
						</div>
					</div>
					<div class="row justify-content-start">
						<div class="col-6">
							<form:label path="version">Version</form:label>
							<p class="text-danger"><form:errors path="version"/></p>
						</div>
						<div class="col-6">  
						<form:input path="version"/>
						</div>
					</div>
					<div class="row justify-content-end">
						<div class="col-2-offset-5">
							<input type="submit" value="Submit" class="btn btn-success"/>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>