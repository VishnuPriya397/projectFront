<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image10.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
<c:if test="${not empty msg}">
           <div class="msg">${msg}</div>
       </c:if>
<form  name="loginform" action="<c:url value="/j_spring_security_check"/>"  method="post" class="form-horizontal" >

<h1 align="center">LOGIN</h1>
	<div class="form-group">
		<label for="username" class="col-xs-4 control-label">Email</label>
		<div class="col-xs-4">
			<input name="username" type="email" id="username" placeholder=" User Email" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Password</label>
		<div class="col-xs-4">
			<input name="password"  type="password" placeholder="User Password" id="password" class="form-control" />
		</div>
	</div>
            
            <div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>
		
		<div class="col-xs-4">	
		<input type="submit" value="Login" id="btn-add" class="btn btn-primary" >
		</div>
	</div> 
            
       <input type = "hidden" name= "${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>     
</body>
</html>