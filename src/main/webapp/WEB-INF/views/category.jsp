<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Category Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image3.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
<form:form  method="POST" action="AddCategory" modelAttribute="category" >
				<table align="center"class="table table-striped table-bordered" cellspacing="2" style="width:50%">
			<tr>
				<td align= "center" colspan="2">Enter Category Details</td>
			</tr>
			
		
			<tr>
				<td><form:label path="cname">Category Name</form:label></td>
                    <td><form:input path="cname"/></td>
                
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
				<td>Category ID</td>
				<td>Category Name</td>
				<td>Operation</td>
			</tr>
	
	
		<c:forEach items="${categoryList}" var="category">
			<tr bgcolor="#85C1E9">
				<td>${category.cid}</td>
				<td>${category.cname}</td>
				<td>
						<a class="btn btn-danger" href="removecategory/${category.cid}">DELETE</a>
						<a class="btn btn-success" href="editcategory/${category.cid}">EDIT</a>
				</td>
			</tr>
		</c:forEach>




		</table><br>
</body>
</html>