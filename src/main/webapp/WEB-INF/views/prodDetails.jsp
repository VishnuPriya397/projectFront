<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image7.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>

<div class="container">
<div class="row">
<div class="col-sm-4 item-photo">
<img style="max-width:100%;margin-top:30px;" src="${pageContext.request.contextPath}/resources/${product.imagName}">
</div>
<div class="col-sm-5" style="border:0px solid gry">
<h3>${product.pname}</h3>
<h4>${product.pdescription}</h4>
<h4>${product.price}</h4>
<h5>${product.supplier.sname}</h5>
<div class="section" style="padding-bottom:20px;"></div>
<form  action="${pageContext.request.contextPath}/addToCart/${product.pid} "method="post">
<input type="hidden" value="${product.pid}" name="pid"/>
<input type="hidden" value="${product.price}" name="price"/>
<input type="hidden" value="${product.pname}" name="pname"/>
<input type="hidden" value="${product.imagName}" name="imagName"/>
<input type="number" class="form-control"name="productQuantity" required/><br><br>
<input class="btn btn-warning btn-lg" type="submit" value="Add To Cart">
<h6><span class="glyphicon-heart-empty" style="cursor:pointer;"></span>Wish List</h6>
</form>
</div>
</div>
<hr>
<div class="col-sm-9">
<h3>Product Details</h3>
<ul class="menu-items">
<li>Delicious desserts </li>
<li>Ideal for all celebrations </li>
</ul>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>