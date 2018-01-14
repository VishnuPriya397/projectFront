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


<c:url var = "actionUrl" value="saveUser"/>

<form  commandName="user" method="post" action="${actionUrl }" class="form-horizontal" >
	<div class="form-group">
		<label for="username" class="col-xs-4 control-label">UserName</label>
		<div class="col-xs-4">
			<input name="username" path="username" placeholder="Enter First Name" class="form-control" />
	<!-- 	<td><errors path="username" cssClass="error"/></td> -->
		</div>
	</div> 
		
	<div class="form-group">
		<label for="email" class="col-xs-4 control-label">Email</label>
		<div class="col-xs-4">
			<input name="email" path="email" placeholder="Enter Email" class="form-control" />
<!-- 		<td><errors path="email" cssClass="error"/></td>   -->
		</div>
	</div>

	<div class="form-group">
		<label for="password" class="col-xs-4 control-label">Password</label>
		<div class="col-xs-4">
			<input name="password"  path="password" placeholder="Enter Password" class="form-control" />
			<!-- <td><errors path="password" cssClass="error"/></td>  
 -->		</div>
	</div>

	<div class="form-group">
		<label for="contact" class="col-xs-4 control-label">Phone Number</label>
		<div class="col-xs-4">
			<input name="contact"  path="contact" placeholder="contact" class="form-control" />
	<!-- 		<td><errors path="contact" cssClass="error"/></td>   -->
		</div>
	</div>

	<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">
			
		<input type="submit" value="Register" id="btn-add" class="btn btn-primary" >
	
	</div>
	</div>
	</form>
<br><br><br><br><br><br><br><br><br><br><br><br>

</body>

</html>