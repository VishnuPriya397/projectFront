<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image5.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
<div class="container">
<div class="page-header">
<div class="container">

<div class="row">
<div class="col-md-6">
<div class="panel with-nav-tabs panel-danger">
<div class="panel-heading">
<ul class="nav nav-tabs">
<li class="active"><a href="#tab1" data-toggle="tab">Supplier</a>
<li><a href="#tab2" data-toggle="tab">Category</a>
<li><a href="#tab3" data-toggle="tab">Product</a> 
</ul>
<div class="panel-body">
<div class="tab-content">
<div class="tab-pane fade in active" id="tab1">
<form  method="post" action="<c:url value="/admin/saveSupp"/>" class="form-signin">
<span id="reauth-email" class="reauth-email"></span>
<h4 class="input-title">Supplier Id</h4><br>
<input class="form-control" type="number" name="sid" required/>
<h4 class="input-title">Supplier Name</h4><br>
<input class="form-control" type="text" name="sname" required/>
<br><br>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-warning" type="reset">Cancel</button>
</form>
</div>

<div class="tab-pane fade active" id="tab2">
<form  method="post" action="<c:url value="/admin/saveCat"/>" class="form-signin">
<span id="reauth-email" class="reauth-email"></span>
<h4 class="input-title">Category Id</h4><br>
<input class="form-control" type="number" name="cid" required/>
<h4 class="input-title">Category Name</h4><br>
<input class="form-control" type="text" name="cname" required/>
<br><br>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-warning" type="reset">Cancel</button>
</form>
</div>

<div class="tab-pane fade active " id="tab3">
<form  method="post" action="<c:url value="/admin/saveProduct"/>" class="form-signin" enctype="multipart/form-data">
<span id="reauth-email" class="reauth-email"></span>
<h4 class="input-title">Product Name</h4><br>
<input class="form-control" type="text" name="pname" required/><br>
<h4 class="input-title">Product Description</h4><br>
<input class="form-control" type="text" name="pdescription" required/><br>
<h4 class="input-title">Product Price</h4><br>
<input class="form-control" type="number" name="price" required/><br>
<h4 class="input-title">Product Stock</h4><br>
<input class="form-control" type="number" name="pstock" required/><br>
<div class="form-group">
<table>
<tr>
<td>Select Supplier</td>
<td>
<select class="form-control" name="pSupplier" required>
<option value="">----Select Supplier ---</option>
<c:forEach items="${ satList}" var="sat">
<option value="${sat.sid}">${sat.sname}</option></c:forEach>
</select>
</table>
</div>
<div class="from-group">
<table>
<tr>
<td>Select Category</td>
<td>
<select class="form-control" name="pCategory" required>
<option value="">----Select Category---</option>
<c:forEach items="${ catList}" var="cat">
<option value="${cat.cid}">${cat.cname}</option></c:forEach>
</select>
</tr>
</table>
</div>
<div class="fileinputfileinput-new" data-provides="fileinput">
<table><tr>
<td>Product Image</td>
<td><input class="form-control" type="file" name="file" accept="image/*"></td></tr></table>
</div>
<br><br>
<button class="btn btn-lg btn-primary" type="submit">Save</button>
<button class="btn btn-lg btn-warning" type="reset">Cancel</button>
</form>
</div>
</div>
</div></div></div></div></div></div></div></div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>