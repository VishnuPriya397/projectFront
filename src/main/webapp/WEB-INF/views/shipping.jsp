<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shipping Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background = "C:\\Users\\Priya\\Desktop\\image1.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:maroon">Sweet Gene</h2>
<div id="wrap">
<div class="container clear-top">
<c:if test="${not empty addressList}">
	<form  action="selectShippingAddress" method="post">
			<h3>Select a delivery Address:</h3>
			<hr>
			<div class="row">
			<c:forEach var="address" items="${addressList}" varStatus="loopCounter">
			<div class="col-md-4 col-xs-4">
						<c:choose>	
						<c:when test="${loopCounter.index==0}">
								<div class="radio">
								<input type="radio" name="shipaddress" value="${address.id}" checked> <p> ${address.name}<br/>
					      		${address.address1}
					      		<br/>${address.address2}
					      		<br/>${address.landmark}
					      		 <p>${address.city} &nbsp; ${address.state}
					      		 <br/> Pincode : ${address.pincode}	
					      		 <br/> Mobile: <c:choose>
					      		<c:when test="${address.phone eq 0}">${sessionScope.user.phone}</c:when>
					      		<c:when test="${not empty address.phone}">${address.phone}</c:when>
					      		</c:choose>
					      		 </p>
					      		 </div>	
					      </c:when>
					      <c:otherwise>
					      	<div class="radio">
								<input type="radio" name="shipaddress" value="${address.id}"> <p> ${address.name}<br/>
					      		${address.address1}
					      		<br/>${address.address2}
					      		<br/>${address.landmark}
					      		 <p>${address.city} &nbsp; ${address.state}
					      		 <br/> Pincode : ${address.pincode}	
					      		 <br/> Mobile: <c:choose>
					      		 <c:when test="${address.phone eq 0}">${sessionScope.user.phone}</c:when>
					      		<c:when test="${not empty address.phone}">${address.phone}</c:when>
					      		</c:choose>
					      		 </p>
					      		 </div>	
					      </c:otherwise>
			    		</c:choose>
      		 </div>	
      		 </c:forEach>
			</div>
			<br><br>
			<div class="text-center"> 
			 <button type="submit" class="btn btn-warning">Deliver to Selected Address</button>
			 </div>
	</form>
	</c:if>
</div>
<div class="container">
<h3>Add a new Address :</h3>
<div class="row jumbotron">
	<form:form commandName="address" action="saveShippingAddress" method="post">
		<div class="form-group row">
		<div class= "col-xs-6">
		<label for="name"> Full Name: </label>
		<form:input class="form-control" name="name" path ="name" required="required"/>
		</div>
		</div>
		
		 <div class="form-group row">
			<div class="col-xs-6">
		    <label for="address1"> Flat / House No. / Floor / Building:  </label>
		    <form:input  class="form-control" name="address1"  path = "address1" required="required"/>
		    </div>
		 </div>
		 
		 <div class="form-group row">
			<div class="col-xs-6">
		    <label for="address2"> Colony / Street / Locality:   </label>
		    <form:input  class="form-control" name="address2"  path = "address2" required="required"/>
		    </div>
		 </div>
		 
		 <div class="form-group row">
			<div class="col-xs-6">
			<label for="state"> State:   </label>
		    <form:input  class="form-control" name="state"  path = "state" required="required"/>
		    </div>
		 </div>
		 
		  <div class="form-group row">
			<div class="col-xs-6">
		    <label for="pincode"> Pincode:   </label>
		    <form:input  class="form-control" name="pincode"  path = "pincode" placeholder="Enter pincode" required="required"/>
		    </div>
		 </div>
		 
		 <div class="form-group row">
			<div class="col-xs-6">
		    <label for="phone"> Alternate Mobile: 
									(optional)   </label>
		    <form:input  class="form-control" name="phone"  path = "phone" placeholder="Enter Mobile No"/>
		    </div>
		 </div>
		 
		 <div class="form-group row">
			<div class="col-xs-6">
		    <label for="email"> Alternate Email: 
									(optional)   </label>
		    <form:input type="email" class="form-control" name="email"  path = "email" />
		    </div>
		 </div>
		 
		 <div class="form-group row">
			<div class="col-xs-6">
		    <label for="addressType"> Address Type:   </label>
		   				<form:select path="addressType" class="form-control" required="true">
						 <form:option class="form-control"  value="0">---Select---</form:option>	
						 <form:option class="form-control"  value="HOME">Home (All day Delivery)</form:option>
						 <form:option class="form-control"  value="OFFICE">Office (Delivery between 10 AM and 5 PM )</form:option>
						</form:select>
		    </div>
		 </div>
		 <br>
		 <div class="form-group row">
			<div class="col-xs-6">
		    <div class="clearfix">
		      <button type="submit" class="btn btn-success">Save And Deliver Here</button>
		      <button type="reset"  class="btn btn-danger">Cancel</button>		     
		    </div>
		    </div>
		 </div>
	</form:form>
	</div></div></div>		      		 
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>