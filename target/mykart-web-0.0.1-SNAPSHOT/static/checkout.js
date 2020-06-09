$(document)
		.ready(
				function() {

				// accordian collapse all toggle

					var currencySymbol = '$';

					showGrandTotal();

					$(document)
							.on(
									"input",
									'.quanityInput',
									function() {
										var price = $(this).closest("tr").data(
												"price");
										var id = $(this).closest("tr").data(
												"id");
										var quantity = $(this).val();

										$(this)
												.closest("tr")
												.find("td.itemTotal strong")
												.text(
														currencySymbol
																+ getRoundedNumber(price
																		* quantity));
										updatePoduct(id, quantity);
										showGrandTotal();
									});

					$(document).on('click', ".removeItem", function() {
						var $tr = $(this).closest("tr");
						var id = $(this).closest("tr").data("id");
						$tr.hide(500, function() {
							$tr.data('removed', true);
							$tr.attr('data-removed', true);
							removeProduct(id);
							showGrandTotal();
						});

					});

					// select address line here
					$(document).on(
							'click',
							".deliverhere",
							function() {
								var $radio = $(this).closest("tr").find(
										'input:radio[name="address"]');
								$radio.prop("checked", true);
								$('#paymentFormControlSelect').prop("disabled",
										false);

							});

					// enable button

					$('#paymentFormControlSelect')
							.change(
									function() {
										var paymentType = $(
												'#paymentFormControlSelect')
												.find(":selected").text();
										if (paymentType === 'Cash On Delivery') {
											$('#placeOrderButton').removeAttr(
													"disabled");
										}
										
										if (this.value == 'Card') {
											$(".paymentform").show();
										} else {
											$(".paymentform").hide();
										}
									});

					// place order
					$(document)
							.on(
									'click',
									"#placeOrderButton",
									function() {
										var addressId = $(
												'input[type=radio][name=address]:checked')
												.attr('id');
										// var $radio =
										// $(this).closest("tr").find('input:radio[name="address"]');
										console
												.log('Selected address id is: -- '
														+ addressId);
										var products = getAllProducts();
										console
												.log('Final Checkout Products :--'
														+ JSON
																.stringify(products));

										var paymentType = $(
												'#paymentFormControlSelect')
												.find(":selected").text();

										console
												.log('Final Checkout payment method :--'
														+ paymentType);

									});


				});

function showGrandTotal() {
	var amount = 0;
	$.each($('.itemTotal > strong'), function() {
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
		method : "POST",
		contentType : "application/json",
		url : "/mykart-web/postCheckoutItemsToSession",
		data : JSON.stringify(products),
		dataType : 'json',
		timeout : 100000,
		beforeSend : function() {
			// setting a timeout
		},
		success : function(responsedata) {
			$('#registraionMessageHolder > span.loader').hide();
			if (responsedata.success) {
				window.location.href = "/urlToDashboard";
			} else {

			}

		},
		error : function(e) {
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
	products[productIndex].quantity = typeof quantity === "undefined" ? products[productIndex].quantity * 1 + 1
			: quantity;
	setAllProducts(products);
	return true;
}

function setAllProducts(products) {
	localStorage.cartProducts = JSON.stringify(products);
}

function removeProduct(id) {
	var products = getAllProducts();
	var productId = products = $.grep(products, function(value, index) {
		return value.id != id;
	});
	setAllProducts(products);
}

function clearProduct() {
	setAllProducts([]);
}
