Class extends DataStoreImplementation

exposed Function getManifestObject() : Object
	var $manifestFile : 4D:C1709.File
	var $manifestObject : Object
	$manifestFile:=File:C1566("/PACKAGE/Project/Sources/Shared/manifest.json")
	$manifestObject:=JSON Parse:C1218($manifestFile.getText())
	return $manifestObject
	
exposed Function getProductCol() : Collection
	var $productsFile : 4D:C1709.File
	var $productsCol : Collection
	$productsFile:=File:C1566("/PACKAGE/Project/Sources/Shared/products.json")
	$productsCol:=JSON Parse:C1218($productsFile.getText())
	return $productsCol
	
exposed Function addToCartCol($product : Object; $shoppingCart : Collection) : Collection
	$shoppingCart.insert(0; $product)
	return $shoppingCart
	
exposed Function removeCol($product : Object; $shoppingCart : Collection) : Collection
	var $indices : Collection
	
	$indices:=$shoppingCart.indices("name = :1"; $product.name)
	
	If ($indices.length>0)
		$shoppingCart.remove($indices[0])
	End if 
	
	return $shoppingCart
	
exposed Function getTotalPriceCol($shoppingCart : Collection) : Integer
	var $price : Integer
	$price:=$shoppingCart.sum("price")
	return $price
	