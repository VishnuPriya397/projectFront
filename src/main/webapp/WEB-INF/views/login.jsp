<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title> cakes </title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h6 style="color:maroon">Sweet Gene</h6>
<form  method="post" action="${pageContext.request.contextPath}/login" class="form-horizontal" >
<div class="form-group">
		<label for="User Email" class="col-xs-4 control-label">Email</label>
		<div class="col-xs-4">
			<input name="username" type="email"  placeholder=" User Email" class="form-control" />
		</div>
</div>

<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Password</label>
		<div class="col-xs-4">
			<input name="password"  type="password" placeholder="User Password" class="form-control" />
		</div>
</div>

<div class="form-group">
	<label for="code" class="col-xs-4 control-label"></label>	
	<div class="col-xs-4">
		<input type="submit" value="Login" id="btn-add" class="btn btn-primary" >
	</div>
</div>
</form>
</body>
</html>