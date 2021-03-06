<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse" style=" background-color:maroon; color:maroon">
     <div class="container-fluid">
         <div class="navbar-header">
             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                     <span class="icon-bar"></span> 
            </button>
        </div>
     </div>
     <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
             <li class="active"><a href="index">Home</a></li>           
              <ul class="nav navbar-nav navbar-right">
      <c:if test="${pageContext.request.userPrincipal.name==null}">
        <li><a href="${pageContext.request.contextPath}/goToRegister">Register</a></li>
        <li><a href="${pageContext.request.contextPath}/goToLogin"><span class="glyphicon-glyphicon-log-in"></span>Login</a></li>
        </c:if>
        
        <c:if test="${pageContext.request.userPrincipal.name !=null}">
                <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
                <li><a href="<c:url value="/j_spring_security_logout"/>"><span class="glyphicon-glyphicon-log-out"></span>Logout</a></li>
       </c:if>
                 
        <c:if test="${pageContext.request.userPrincipal.name == 'p@gmail.com'}">
        <li><a href="${pageContext.request.contextPath}/admin/adding">Admin</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/productList">Product</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/supplierList">Supplier</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/categoryList">Category</a></li>
        </c:if> 
        
        <li><a href="${pageContext.request.contextPath}/viewcart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart
        <i class="fa fa-cart-plus" aria-hidden="true"></i></a></li>
      </ul>
      <li>
      
    <!-- <div class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
      Category Choice<span class="caret"></span></a> 
      <ul class="dropdown-menu">-->
      <c:forEach var="catval" items="${catList}">
      <li><a href="${pageContext.request.contextPath}/productCustList?cid=${catval.cid}">${catval.cname}</a>
      </li>
      </c:forEach>
  <!--     </ul> 
    </div>  -->  
    </li>        
             <li><a href="#">Contact us</a></li> 
             <li><a href="#">About us</a></li> 
         </ul>
    </div>
</nav>           
</body>
</html>
