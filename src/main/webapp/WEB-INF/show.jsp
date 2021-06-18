<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title><c:out value="${ language.name }"/></title>
</head>

<body>  
	<div class="container">
		<div class="card text-center">
  			<div class="card-header">
  				<h3><a class="btn btn-lg btn-primary" href="/languages">Dashboard</a></h3>
    			<h1>Language Details</h1>
  			</div>
	  		<div class="card-body">
	    		<h4 class="card-title"><c:out value="${language.name}"/></h4>
	    		<h4>Creator: <c:out value="${language.creator}"/></h4>
	    		<h4>Version: <c:out value="${language.version}"/></h4>
	    	</div>
	    	<div class="card-footer text-muted">
	    		<a href="/languages/${language.id}/edit" class="btn btn-lg btn-primary">Edit</a>
	    		&emsp; | &emsp;
	    		<a href="/languages/delete/${language.id}" class="btn btn-lg btn-primary">Delete</a>
	  		</div>
		</div>
	</div>
</body>
</html>

