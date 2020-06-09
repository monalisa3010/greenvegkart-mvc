$(document)
	.ready(
		function () {

			// accordian collapse all toggle

			var currencySymbol = '$';

			showGrandTotal();

			$(document)
				.on(
					"input",
					'.quanityInput',
					function () {
						var price = $(this).closest("tr").data(
							"price");
						var id = $(this).closest("tr").data(
							"id");
						var quantity = $(this).val();

						$(this)
							.closest("tr")
							.find("td.itemTotal strong")
							.text(
								currencySymbol +
								getRoundedNumber(price *
									quantity));
						updatePoduct(id, quantity);
						showGrandTotal();
					});

			$(document).on('click', ".removeItem", function () {
				var $tr = $(this).closest("tr");
				var id = $(this).closest("tr").data("id");
				$tr.hide(500, function () {
					$tr.data('removed', true);
					$tr.attr('data-removed', true);
					removeProduct(id);
					showGrandTotal();
				});

			});

			// select address line here
			$(document).on(
				'click',
				"div._6ATDKp",
				function () {
					var $radio = $(this).closest("tr").find(
						'input:radio[name="address"]');
					$radio.prop("checked", true);
					$('#paymentFormControlSelect').prop("disabled",
						false);

				});

			
			$(document).on(
					'click',
					".deliverhere",
					function () {
						var $radio = $(this).closest("tr").find(
							'input:radio[name="address"]');
						$radio.prop("checked", true);
						$('#paymentFormControlSelect').prop("disabled",
							false);

					});
			
			
			// enable button

			$('#paymentFormControlSelect')
				.change(
					function () {
						var paymentType = $(
								'#paymentFormControlSelect')
							.find(":selected").text();
						if (paymentType === 'Cash On Delivery') {
							$('#placeOrderButton').removeAttr(
								"disabled");
							$(".paymentform").hide();
							$('#card_Number').val('');
							$('#card_expiry').val('');
							$('#card_cvv').val('');
							$('#card_holder_name').val('');
						}else if(paymentType === 'Card'){
							$(".paymentform").show();
							$('#placeOrderButton').removeAttr(
							"disabled");
						}else{
						$('#placeOrderButton').attr(
							"disabled",true);
						$(".paymentform").hide();
						$('#card_Number').val('');
						$('#card_expiry').val('');
						$('#card_cvv').val('');
						$('#card_holder_name').val('');
						}
					});

			// place order
			$(document).on('click',"#placeOrderButton",function () {
						
			//validate form
			var isvalid = isValidPlaceOrder();
			if(isvalid){
				var addressId = $('input[type=radio][name=address]:checked').attr('id');
				console.log('Selected address id is: -- ' +addressId);
				var products = getAllProducts();
				console.log('Final Checkout Products :--' +JSON.stringify(products));
	
				var paymentType = $('#paymentFormControlSelect').find(":selected").text();
	
				console.log('Final Checkout payment method :--' +paymentType);
				
				var cardNumber = $('#card_Number').val();
				var cardExp = $('#card_expiry').val();
				var cardCVV = $('#card_cvv').val();
				var nameonCard = $('#card_holder_name').val();
				
				//card object
				var card = {};
				card["cardNo"]=cardNumber;
				card["cardexp"]=cardExp;
				card["cardcvv"]=cardCVV;
				card["nameonCard"]=nameonCard;
				
				//payment object
				var payment = {};
				payment["type"] = paymentType;
				if(paymentType==='Card'){
					payment["paymentCard"] = card;
				}
				
				
				//order object
				var requestOrder = {};
				requestOrder["orderItems"] = products;
				requestOrder["payment"] = payment;
				requestOrder["addressid"] = addressId;
				
				showPleaseWait();
				setTimeout(
						function() {
							
							//call ajax
							$.ajax({
								method: "POST",
								contentType: "application/json",
								url: "/mykart-web/createOrder",
								data: JSON.stringify(requestOrder),
								dataType: 'json',
								timeout: 100000,
								beforeSend: function () {
									// setting a timeout
								},
								success: function (responsedata) {
									clearProduct();
									var orderId = responsedata.orderId;
									console.log('orderId' + orderId);
									window.location.href = "/mykart-web/order/"+orderId;
								},
								error: function (e) {
									console.log("ERROR: ", e);
									display(e);
									window.location.href = "/mykart-web/unauth";
								}
							}).done(function(responsedata) {
								hidePleaseWait();
							});
						
						}, 3000);
				
						
						
						/**/
				}
			});
			
			/**
			 * Add new Address
			 */

			$('#addNewAddress').click(function() {
				// handle redirect here
				$(this).find('i').toggleClass('fa fa-plus fa fa-minus');
				$('div.newAddressForm').toggle('slow');
			});


		});

function showGrandTotal() {
	var amount = 0;
	$.each($('.itemTotal > strong'), function () {
		if (!$(this).closest("tr").data("removed")) {
			var itemTotalAmount = parseFloat($(this).html().substring(1));
			amount = amount + itemTotalAmount;
		}

	});

	$('.productTotal > h3 > strong').text(currencySymbol + amount);

}

function getRoundedNumber(number) {
	return number.toFixed(2);
}

function showCheckoutPage(products) {
	$.ajax({
		method: "POST",
		contentType: "application/json",
		url: "/mykart-web/postCheckoutItemsToSession",
		data: JSON.stringify(products),
		dataType: 'json',
		timeout: 100000,
		beforeSend: function () {
			// setting a timeout
		},
		success: function (responsedata) {
			$('#registraionMessageHolder > span.loader').hide();
			if (responsedata.success) {
				window.location.href = "/urlToDashboard";
			} else {

			}

		},
		error: function (e) {
			console.log("ERROR: ", e);
			display(e);
		}
	});
}

function getAllProducts() {
	try {
		var products = JSON.parse(localStorage.cartProducts);
		return products;
	} catch (e) {
		return [];
	}
}

function updatePoduct(id, quantity) {
	var productIndex = getIndexOfProduct(id);
	if (productIndex < 0) {
		return false;
	}
	var products = getAllProducts();
	products[productIndex].quantity = typeof quantity === "undefined" ? products[productIndex].quantity * 1 + 1 :
		quantity;
	setAllProducts(products);
	return true;
}

function setAllProducts(products) {
	localStorage.cartProducts = JSON.stringify(products);
}

function removeProduct(id) {
	var products = getAllProducts();
	var productId = products = $.grep(products, function (value, index) {
		return value.id != id;
	});
	setAllProducts(products);
}

function clearProduct() {
	setAllProducts([]);
}


function isValidPlaceOrder(){
	$(".error").remove();
	var isValid = true;
	var addressId = $('input[type=radio][name=address]:checked').attr('id');
	var paymentType = $('#paymentFormControlSelect').find(":selected").text();
	
	addressId = parseInt(addressId, 10);
	
	if(addressId <= 0){
		isValid = false;
	}
	
	if(paymentType==='Card'){
		var cardNumber = $('#card_Number').val();
		var cardExp = $('#card_expiry').val();
		var cardCVV = $('#card_cvv').val();
		var nameonCard = $('#card_holder_name').val();
		
		if (nameonCard.length <= 0) {
			$('#card_holder_name').after('<span class="error">Please enter Cardholder name:</span>');
			isValid = false;
		}
		
		if (cardNumber.length != 16) {
			$('#card_Number').after('<span class="error">Card must be 16 digit long</span>');
			isValid = false;
		}
		
		if (cardExp.length != 5) {
			$('#card_expiry').after('<span class="error">Username must be 4 digit long</span>');
			isValid = false;
		}
		
		if (cardCVV.length != 3) {
			$('#card_cvv').after('<span class="error">CVV must be 3 character long</span>');
			isValid = false;
		}
	}else if(paymentType==='Cash On Delivery'){
		//do nothing
	}else{
		isvalid = false;
	}
	return isValid;
}



/**
 * Displays overlay with "Please wait" text. Based on bootstrap modal. Contains animated progress bar.
 */
function showPleaseWait() {
    
    if (document.querySelector("#pleaseWaitDialog") == null) {
        var modalLoading = '<div class="modal" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false" role="dialog">\
            <div class="modal-dialog">\
                <div class="modal-content">\
                    <div class="modal-header">\
                        <h4 class="modal-title">Please wait while we are confirming your order...</h4>\
                    </div>\
                    <div class="modal-body">\
                        <div class="progress">\
                          <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"\
                          aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%; height: 40px">\
                          </div>\
                        </div>\
                    </div>\
                </div>\
            </div>\
        </div>';
        $(document.body).append(modalLoading);
    }
  
    $("#pleaseWaitDialog").modal("show");
}

/**
 * Hides "Please wait" overlay. See function showPleaseWait().
 */
function hidePleaseWait() {
    $("#pleaseWaitDialog").modal("hide");
}


