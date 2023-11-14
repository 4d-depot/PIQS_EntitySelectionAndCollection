Class extends EntitySelection


exposed Function getTotalPrice() : Integer
	return This:C1470.sum("price")
	
	
exposed Function checkEmptyCart()
	
	If (This:C1470.length=0)
		Web Form:C1735["buttonContainer"].addCSSClass("buttonHide")
	Else 
		Web Form:C1735["buttonContainer"].removeCSSClass("buttonHide")
	End if 
	
	
exposed Function addToCart($productAdded : cs:C1710.productEntity) : cs:C1710.productSelection
	var $newSel : cs:C1710.productSelection
	
	$newSel:=This:C1470.copy()
	$newSel.add($productAdded)
	return $newSel
	
exposed Function removeFromCart($productToRemove : cs:C1710.productEntity) : cs:C1710.productSelection
	
	var $newShoppingCart : cs:C1710.productSelection
	
	//$entitiesToRemove:=This.query("name = :1"; $productToRemove.name)
	//return This.minus($entitiesToRemove)
	
	$newShoppingCart:=This:C1470.minus($productToRemove)
	
	return $newShoppingCart
	
	
exposed Function createOrderFromCart()  //: cs.productSelection
	var $newOrder : cs:C1710.orderEntity
	var $orderedProduct : cs:C1710.orderedProductEntity
	var $productInCart : cs:C1710.productEntity
	
	If (This:C1470.length=0)
		throw:C1805(1; "Your cart is empty!")
	Else 
		$newOrder:=ds:C1482.order.new()
		$newOrder.createdOn:=Current date:C33
		For each ($productInCart; This:C1470)
			$orderedProduct:=ds:C1482.orderedProduct.new()
			$orderedProduct.product:=$productInCart
			//$newOrder.orderedProducts.add($orderedProduct.order)
			$orderedProduct.order:=$newOrder
			$orderedProduct.save()
		End for each 
		$newOrder.save()
		
		Web Form:C1735["buttonContainer"].addCSSClass("buttonHide")
		
		Web Form:C1735.setMessage("Thanks for your order N°"+String:C10($newOrder.ID)+"!")
		
	End if 
	
	
	
	
	
	
	