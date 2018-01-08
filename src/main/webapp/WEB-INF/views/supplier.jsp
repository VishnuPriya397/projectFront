<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Supplier Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image3.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
	<form:form  method="POST" action="AddSupplier" modelAttribute="supplier" >
				<table align="center"class="table table-striped table-bordered" cellspacing="2" style="width:50%">
			<tr>
				<td align= "center" colspan="2">Supplier Module</td>
			</tr>
			
		
			<tr>
				<td><form:label path="suppliername">Supplier Name</form:label></td>
                    <td><form:input path="suppliername"/></td>
                
			</tr>
		
			<tr>
				<td><form:label path="supplieraddress">Supplier Address</form:label></td>
                <td><form:input path="supplieraddress"/></td>
			</tr>
	
		<tr>
			<td colspan="2">
				<center><input type="submit" value="Insert" class="btn btn-success"/>
				</center>
			</td>
		</tr>
	</table>
	</form:form>
	
	<table class="table table-striped table-bordered" style="width:100%">
	<tr bgcolor="gray">
		<td>Supplier ID</td>
		<td>Supplier Name</td>
		<td>Supplier Address</td>
		<td>Operation</td>
	</tr>
	
	<c:forEach items="${supplierList}" var="supplier">
		<tr bgcolor="#F7DC6F  ">
			<td>${supplier.sid}</td>
			<td>${supplier.suppliername}</td>
			<td>${supplier.supplieraddress}</td>
			<td>
			
				<a class="btn btn-danger" href="editsupplier/${supplier.sid}">EDIT </a>/
				<a class="btn btn-success" href="removesupplier/${supplier.sid}">DELETE</a>
			</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>