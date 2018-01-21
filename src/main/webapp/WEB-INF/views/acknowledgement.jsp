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
<body background = "C:\\Users\\Priya\\Desktop\\image12.jpg">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<h2 style="color:white">Sweet Gene</h2>
<div id="wrap">
<div id="main" class="container clear-top">

<h4><font color="white">Your order has been placed successfully. Thank you for shopping with us.</font> </h4>

<div class="row">
	 <div class="col-sm-12 col-md-10 col-md-offset-1">
	
	<table class="table table-hover table-condensed bg-warning">
	
	`<c:if test="${not empty error}">
	    	<h4> <font color="red">${error} </font></h4>
	</c:if>
	
		<thead>
			<tr>
			<th>Product</th>
			<th>Expected Delivery</th>
			<th>Quantity</th>
			<th class="text-center">Price</th>
			<th class="text-center">Total</th>
			
			</tr>	
		</thead>
		<tbody>
			<c:forEach items="${orderList}" var ="order">
			<tr>
			 <td class="col-sm-8 col-md-6">
			<div class="media">
			 <a class="thumbnail pull-left" href="">
					<img class="img-responsive"  width="72px" height="72px" src="<c:url value="/resources/images/${order.productId}.jpg" ></c:url>"></a>
			<div class="media-body">
			<c:forEach items="${productList}" var="product">	
				<c:if test="${product.pid == order.productId}">
			<h4 class="media-heading"><a href="">${product.pname}</a></h4>
                                <h5 class="media-heading"></h5>
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                 </c:if>
              </c:forEach>
             <td class="col-sm-1 col-md-1">
             With in 7 working days
 			 </td>
			 <td class="col-sm-1 col-md-1" style="text-align: center">
			
			${order.productQuantity}
			
			</td>
			 <td class="col-sm-1 col-md-1 text-center"><strong><span class="fa fa-inr"></span> ${order.price}</strong></td>
			<c:set var="subtot" value="${order.price * order.productQuantity}"></c:set>
			 <td class="col-sm-1 col-md-1 text-center"><strong><span class="fa fa-inr"></span> ${subtot}</strong></td>
			
				
		</tr>
		
		<c:set var="gtot" value="${gtot + order.price * order.productQuantity}"></c:set>
		</c:forEach>
		<tr>
			<td>  </td>
			<td>  </td>
			<td>  </td>
			<td><h5>SubTotal</h5></td>
			<td class="text-right"><h5><strong><span class="fa fa-inr"></span> ${gtot}</strong></h5></td>
		</tr>
		<tr>
             <td>   </td>
             <td>   </td>
             <td>   </td>
             <td><h5>Estimated shipping</h5></td>
             <td class="text-right"><h5><strong><span class="fa fa-inr"></span> 50.0</strong></h5></td>
         </tr>
         <c:set var="grosstotal" value="${gtot+50}"></c:set>
          <tr>
              <td>   </td>
              <td>   </td>
              <td><h3>Total</h3></td>
              <td colspan="2" class="text-right"><h3><strong><span class="fa fa-inr"></span>${grosstotal}</strong></h3></td>
          </tr>
		
		</tbody>
		
	</table>
	
		</div>
	</div>

    
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>