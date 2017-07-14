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
		    <thead>
		      <tr bgcolor="#ccc">
		        <th>Sno</th>
		        <th>Name</th>
		        <th>Quantity</th>
		        <th>Price</th>
		        <th>Expiry</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		    <c:forEach var="product" items="${products}" varStatus="sno">
		      <tr>
		        <td>${sno.index+1}</td>
		        <td>${product.name}</td>
		        <td>${product.quantity}</td>
		        <td>${product.price}</td>
		        <td>${product.expiry}</td>
		        <td>
		        	<button type="button" class="btn btn-primary btn-xs" onclick="addTocart('${product.name}', ${product.id}, '${product.price}')"> <i class="fa fa-shopping-cart"></i> &nbsp;Add</button>
		        </td>
		      </tr>
		     </c:forEach>
		     
		     
		    </tbody>
		  </table>
		  </div>
		  
		  <div class="col-sm-4">
		  <c:if test="${sessionCarts.size() > 0}">
		      <div class="panel panel-primary" style="width: 280px;">
	      		<div class="panel-heading"><i class="fa fa-shopping-cart fa-lg"></i> &nbsp;Cart</div>
			      <div class="panel-body">
			    	  <table class='table'>
			    	  <c:set value="${0}" var="total"/>
			  		    <c:forEach var="cartProduct" items="${sessionCarts}" varStatus="sno">
				  		    <tr>
				  		    	<td>${sno.index+1}</td>
				  		    	<td>${cartProduct.name}</td>
				  		    	<td>${cartProduct.quantity}</td>
				  		    	<td><i class="fa fa-rupee "></i> ${cartProduct.price}</td>
				  		    	<td><i class="fa fa-rupee "></i> ${cartProduct.price * cartProduct.quantity}</td>
    				    	    <c:set var="total" value="${total + cartProduct.price * cartProduct.quantity}" />
				  		    	
				  		    </tr>
			  			</c:forEach>
			  		    <tr>
			  		    	<td colspan="5" align="right">
								<label>Total : <i class="fa fa-rupee fa-lg"></i> ${total}</label>
			  		    	</td>
			  		    </tr>

			  		    <tr>
			  		    	<td colspan="3">
					        	<button type="button" class="btn btn-success" onclick="location.href='order-cart'"> <i class="fa fa-credit-card fa-lg"></i> &nbsp;Order</button>
			  		    	</td>
			  		    </tr>
		  			</table>
	 			</div>
	   		 </div>
	   		 </c:if>
	   		 </div>
	   		</div>
		  <c:if test="${cartProducts.size() > 0}">
		      <div class="panel panel-primary" style="width: 280px;">
	      		<div class="panel-heading"><i class="fa fa-shopping-cart fa-lg"></i> &nbsp;Cart</div>
			      <div class="panel-body">
			    	  <table class='table'>
			    	  <c:set value="${0}" var="total"/>
			  		    <c:forEach var="cartProduct" items="${cartProducts}" varStatus="sno">
				  		    <tr>
				  		    	<td>${sno.index+1}</td>
				  		    	<td>${cartProduct.name}</td>
				  		    	<td><i class="fa fa-rupee "></i> ${cartProduct.price}</td>
    				    	    <c:set var="total" value="${total + cartProduct.price}" />
				  		    	
				  		    </tr>
			  			</c:forEach>
			  		    <tr>
			  		    	<td colspan="3" align="right">
								<label>Total : <i class="fa fa-rupee fa-lg"></i> ${total}</label>
			  		    	</td>
			  		    </tr>

			  		    <tr>
			  		    	<td colspan="3">
					        	<button type="button" class="btn btn-success" onclick="location.href='payment/${cartProducts.size()}'"> <i class="fa fa-credit-card fa-lg"></i> &nbsp;Payment</button>
			  		    	</td>
			  		    </tr>
		  			</table>
	 			</div>
	   		 </div>
	   		 </c:if>
		</div>
		
		<!-- Modal -->
	  <div class="modal fade" id="addTocart" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	      <form action="save-cart" method="post" >
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title"><span id="pName"></span> Quantity</h4>
	        </div>
	        <div class="modal-body">
	          <p id=""> <span id="quantity"></span></p>
	        </div>
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-primary" >Add</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	        </form>
	      </div>
	    </div>
	  </div>
</body>
</html>