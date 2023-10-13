Class extends DataClass

exposed Function getOrderString() : Text
	var $word : Text
	
	If (This:C1470.all().length>1)
		$word:="orders"
	Else 
		$word:="order"
	End if 
	return $word