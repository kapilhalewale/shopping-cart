function addTocart(name, productId, price)
{
	console.log("Called");
	console.log(name);
	console.log(productId);
	
	var quantity  = "<input type='hidden' name='price' value="+price+" /><input type='hidden' name='id' value="+productId+" /><input type='hidden' name='name' value="+name+" /><input type='text' name='quantity' placeholder='Quantity'/>";
	$("#pName").append(name);
	$("#quantity").append(quantity);
	$("#addTocart").modal('show');
}