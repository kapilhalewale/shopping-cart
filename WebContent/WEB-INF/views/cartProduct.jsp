<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Mall</title>
<%@ include file="staticFiles.jsp" %>

</head>
<body>
<%@ include file="topMenu.jsp" %>
	<div class="container">
	<div class="row">
		<div class="col-sm-8">
		  <table class="table table-bordered">
		  <c:set value="${0}" var="total"/>
	  
		    <thead>
		      <tr bgcolor="#ccc">
		        <th>Sno</th>
		        <th>Name</th>
		        <th>Quantity</th>
		        <th>Price</th>
		        <th>sub total</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="product" items="${sessionCarts}" varStatus="sno">
		      <tr>
		        <td>${sno.index+1}</td>
		        <td>${product.name}</td>
		        <td>${product.quantity}</td>
		        <td>${product.price}</td>
		        <td>${product.price * product.quantity}</td>
		        <c:set var="total" value="${total + product.price * product.quantity}" />
		        
		        <td>
		        	<button type="button" class="btn btn-primary btn-xs" onclick="addTocart('${product.name}', ${product.id}, '${product.price}')"> <i class="fa fa-shopping-cart"></i> &nbsp;Add</button>
		        </td>
		      </tr>
		     </c:forEach>
   		      <tr><td colspan="6"><label>Discount Added  : </label></td></tr>	     
   		      <tr><td colspan="6"><label>Grand Total  : ${total}</label></td></tr>	     
   		      <tr>
		     	<td>
		     		<button type="button" class="btn btn-success" onclick=""> <i class="fa fa-shopping-cart"></i> &nbsp;Next</button>
		     	</td>
			  </tr>	     
		    </tbody>
		  </table>
		  </div>
	   </div>  
	</div>
</body>
</html>