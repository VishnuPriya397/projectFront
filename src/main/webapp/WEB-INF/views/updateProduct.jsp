<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image9.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
<c:url var="actionUrl" value="${pageContest.request.contextPath}/updateProd"/>
<form:form  commandName="updateProduct" method="post" action="${actionUrl}" class="form-horizontal" id="btn-add"  enctype="multipart/form-data">
	
	<div class="form-group">
		<div class="col-xs-4">
		<c:if test="${product.id!=0}">
		<form:input type="hidden" name="id" path="id" iplaceholder="product Id" class="form-control" />
			</c:if>
		</div>
	</div>

	<div class="form-group">
		<label for="category Name" class="col-xs-4 control-label">Product Name</label>
		<div class="col-xs-4">
			<form:input name="id" path="name" placeholder="Product Name" class="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<label for="code" class="col-xs-4 control-label">Product Description</label>
		<div class="col-xs-4">
			<form:input name="description" id="description" path="description" placeholder="Product Description" maxlength="50" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<label for="Product Price" class="col-xs-4 control-label">Product Price</label>
		<div class="col-xs-4">
			<form:input name="id" path="price" placeholder="Product Price" class="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<label for="Product Quantity" class="col-xs-4 control-label">Product Quantity</label>
		<div class="col-xs-4">
			<form:input name="id" path="quantity" placeholder="Product Quantity" class="form-control" />
		</div>
	</div>
	
	<div class="form-group">
		<label for="Product Category" class="col-xs-4 control-label">Product Category</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="cid" required="true">
	<c:forEach items="${categoryList}" var="category">
	<form:option class="form-control" value="${category.cid}">${category.cname} </form:option>
	</c:forEach>
	</form:select>
		</div>
	</div>

	<div class="form-group">
		<label for="Product Supplier" class="col-xs-4 control-label">Product Supplier</label>
		<div class="col-xs-4">		
	<form:select class="form-control" path="sid" required="true">
	<c:forEach items="${supplierList}" var="supplier">
	<form:option class="form-control" value="${supplier.sid}">${supplier.suppliername} </form:option>
	</c:forEach>
	</form:select>
		</div>
	</div>
	
	<br>
	<br>
	
	<table>
	<tr>
	<td><form:label class="col-xs-4 control-label" path="image">Image<spring:message text="Image"/></form:label></td>
	<td><form:input type="file" class=" btn btn-default btn-block form-control" path="image" required="true" /></td>
	</tr>
    </table>
    
    <a class="btn btn-primary" role="button" href="${pageContest.request.contextPath}//updateProduct"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Update</a>

<a class="btn btn-primary" role="button" href="#"> Cancel</a> 
</form:form>
</body>
</html> --%>