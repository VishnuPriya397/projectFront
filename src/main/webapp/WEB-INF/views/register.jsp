<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image3.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
   <form:form method="POST" action="saveUser" modelAttribute="user">
            <div class="form-group">
		<label for="username" class="col-xs-4 control-label">username</label>
		<div class="col-xs-4">
			<form:input name="id" path="username" placeholder="UserName" class="form-control" />
		</div>
	</div>
	
	<br><br>

	<div class="form-group">
		<label for="Supplier Name" class="col-xs-4 control-label">Email</label>
		<div class="col-xs-4">
			<form:input name="id" path="email" placeholder="Email" class="form-control" />
		</div>
	</div>
<br>
	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Password</label>
		<div class="col-xs-4">
			<form:input name="password"  path="password" placeholder="User Password" class="form-control" />
		</div>
	</div>
<br>
	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Phone Number</label>
		<div class="col-xs-4">
			<form:input name="phone"  path="contact" placeholder="User Phone" class="form-control" />
		</div>
	</div>


<br>
	<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
		
			
	
		<input type="submit" value="Add User" id="btn-add" class="btn btn-primary" >
	
	

		
		</div>
	</div>
</form:form>
<br><br><br><br><br><br><br><br><br><br><br><br>

</body>

</html>