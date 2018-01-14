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
<body background = "C:\\Users\\Priya\\Desktop\\image8.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
<div class="container">
<h2>Supplier List For Admin</h2>
<table class="table table-hover bg-warning" id="apl" class="display" border="2" width="80" align="center">
<tr>
<th>S.No</th>
<th>Supplier ID</th>
<th>Supplier Name</th>
<th class="span2">Action</th>
</tr>
<c:if test="${empty satList}">
<tr>
<td colspan="10" align="center">No record exists!!</td>
</tr>
</c:if>
<c:forEach var="p" varStatus="st" items="${satList}">
<tr>
<td><c:out value="${st.count}"></c:out></td>
<td><c:out value="${p.sid }"></c:out></td>
<td><c:out value="${p.sname}"></c:out></td>



<td><c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<a class="btn btn-info" role="button" href="${contextRoot}/Edit">Edit</a>
<a class="btn btn-danger" role="button" href="<c:url value="/deleteSupp/${p.sid}"/>">Delete</a>


<tr>
</c:forEach>
</table>
</div>

</body>
</html>