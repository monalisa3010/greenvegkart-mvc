$(document).ready(
		function() {

			var currencySymbol = '$';
			var classProductQuantity = 'my-product-quantity';
			var classProductRemove = 'my-product-remove';
			var classProductTotal = 'my-product-total';
			var idGrandTotal = 'my-cart-grand-total';
			var idCartModal = 'my-cart-modal';
			var classCartBadge = 'my-cart-badge';
			var classCheckoutCart = 'my-cart-checkout';
			var $cartBadge = $("." + classCartBadge);
			var idEmptyCartMessage = 'my-cart-empty-message';
			// $cartBadge.text(getTotalQuantity());
			updateCartInformation();
			updateAddToCartButtonWithExistingCartItemsForAllProduct();

			$("button.my-cart-add-btn").click(
					function() {
						// alert('Quanity Is: ' +
						// $(this).parent().siblings('.stepper-input').find("input").val());
						var id = $(this).data('id');
						var name = $(this).data('name');
						var summary = $(this).data('summary');
						var price = $(this).data('price');
						var quantity = $(this).data('quantity');
						var image = $(this).data('image');
						console
								.log('name: ' + name + ',summary: ' + summary
										+ ', price:' + price + ', quantity:'
										+ quantity);
						addTocart(image, $(this));
						addProduct(id, name, summary, price, quantity, image);

						// change the basket items with count and total price
						updateCartInformation();

						// change the data-addtocart="false" to
						// data-addtocart="true"
						setAddProductStatusInCart($(this), true);

						// change the text of 'ADD TO CART' to '✔ ADDED'
						updateAddToCartButton($(this));
					});

			$("a.increment").click(
					function() {
						var input = $(this).parent().find("input");
						var quantity = parseInt(input.val(), 10);
						quantity = quantity + 1;
						input.val(quantity);
						var actionButton = $(this).parent().siblings(
								'.product-action').find(
								"button.my-cart-add-btn");
						actionButton.data('quantity', quantity);
						actionButton.attr('data-quantity', quantity);
						updateAddToCartButton(actionButton);

					});

			$("a.decrement").click(
					function() {
						var input = $(this).parent().find("input");
						var quantity = parseInt(input.val(), 10);

						if (quantity === 1) {
						} else {
							quantity = quantity - 1;
						}
						input.val(quantity);
						var actionButton = $(this).parent().siblings(
								'.product-action').find(
								"button.my-cart-add-btn");
						actionButton.data('quantity', quantity);
						actionButton.attr('data-quantity', quantity);
						updateAddToCartButton(actionButton);
					});

			// click on cart icon
			$(".my-cart-icon").click(function() {
				showModal();
			});

			$(document).on(
					"input",
					"." + classProductQuantity,
					function() {
						var price = $(this).closest("tr").data("price");
						var id = $(this).closest("tr").data("id");
						var quantity = $(this).val();

						$(this).parent("td").next("." + classProductTotal)
								.text(
										currencySymbol
												+ getRoundedNumber(price
														* quantity));
						updatePoduct(id, quantity);

						// $cartBadge.text(getTotalQuantity());
						updateCartInformation();
						showGrandTotal();
					});

			$(document).on('keypress', "." + classProductQuantity,
					function(evt) {
						if (evt.keyCode == 38 || evt.keyCode == 40) {
							return;
						}
						evt.preventDefault();
					});

			$(document).on('click', "." + classProductRemove, function() {
				var $tr = $(this).closest("tr");
				var id = $tr.data("id");
				$tr.hide(500, function() {
					removeProduct(id);
					drawTable();
					// $cartBadge.text(getTotalQuantity());
					updateCartInformation();
				});
			});

			$(document).on(
					'click',
					"." + classCheckoutCart,
					function() {
						var products = getAllProducts();
						if (!products.length) {
							$("#" + idEmptyCartMessage).fadeTo('fast', 0.5)
									.fadeTo('fast', 1.0);
							return;
						}
						updateCart();
						checkoutCart(getAllProducts(), getTotalPrice(),
								getTotalQuantity());
						//clearProduct();
						// $cartBadge.text(getTotalQuantity());
						//updateCartInformation();
						$("#" + idCartModal).modal("hide");
					});

			// login modal
			$("li.auth > a:nth-child(1)").click(function() {
				$("#login-modal").modal('show');
			});

			// sign up modal

			$("li.auth > a:nth-child(3)").click(function() {
				$("#signup-modal").modal('show');
			});
			// jQuery time
			var current_fs, next_fs, previous_fs; // fieldsets
			var left, opacity, scale; // fieldset properties which we will
			// animate
			var animating; // flag to prevent quick multi-click glitches

			$(".next").click(
					function() {
						console
								.log('.next called with animating: '
										+ animating);

						current_fs = $(this).parent();
						var isFormValid = validateFormData(current_fs);
						if (!isFormValid) {
							return false;
						}

						if (animating) {
							return false;
						}

						animating = true;
						next_fs = $(this).parent().next();

						// activate next step on progressbar using the index of
						// next_fs
						$("#progressbar li").eq(
								$('#registerForm > fieldset').index(next_fs))
								.addClass("active");

						// show the next fieldset
						next_fs.show();
						// hide the current fieldset with style
						current_fs.animate({
							opacity : 0
						}, {
							step : function(now, mx) {
								// as the opacity of current_fs reduces to 0 -
								// stored in "now"
								// 1. scale current_fs down to 80%
								scale = 1 - (1 - now) * 0.2;
								// 2. bring next_fs from the right(50%)
								left = (now * 50) + "%";
								// 3. increase opacity of next_fs to 1 as it
								// moves in
								opacity = 1 - now;
								current_fs.css({
									'transform' : 'scale(' + scale + ')',
									'position' : 'absolute'
								});
								next_fs.css({
									'left' : left,
									'opacity' : opacity,
									'position' : 'relative'
								});
							},
							duration : 800,
							complete : function() {
								current_fs.hide();
								animating = false;
							},
							// this comes from the custom easing plugin
							easing : 'easeInOutBack'
						});
					});

			$(".previous").click(
					function() {
						if (animating)
							return false;
						animating = true;

						current_fs = $(this).parent();
						previous_fs = $(this).parent().prev();

						// de-activate current step on progressbar
						$("#progressbar li")
								.eq(
										$('#registerForm > fieldset').index(
												current_fs)).removeClass(
										"active");

						// show the previous fieldset
						previous_fs.show();
						// hide the current fieldset with style
						current_fs.animate({
							opacity : 0
						}, {
							step : function(now, mx) {
								// as the opacity of current_fs reduces to 0 -
								// stored in "now"
								// 1. scale previous_fs from 80% to 100%
								scale = 0.8 + (1 - now) * 0.2;
								// 2. take current_fs to the right(50%) - from
								// 0%
								left = ((1 - now) * 50) + "%";

								// 3. increase opacity of previous_fs to 1 as it
								// moves in
								opacity = 1 - now;
								current_fs.css({
									'left' : left,
									'top' : 0,
									'position' : 'absolute'
								});
								previous_fs.css({
									'transform' : 'scale(' + scale + ')',
									'opacity' : opacity,
									'position' : 'relative'
								});
							},
							duration : 800,
							complete : function() {
								current_fs.hide();
								animating = false;
							},
							// this comes from the custom easing plugin
							easing : 'easeInOutBack'
						});
					});
			// register user form submit

			$("#registerForm").submit(function(event) {
				// Prevent the form from submitting via the browser.
				event.preventDefault();
				current_fs = $('#registerForm > fieldset:last-child');
				if (!validateFormData(current_fs)) {
					return false;
				}

				registerUser();
			});

			$("#loginForm").submit(function(event) {
				// Prevent the form from submitting via the browser.
				event.preventDefault();
				/*
				 * if (!validateLoginFormData(current_fs)) { return false; }
				 */
				loginUser();
			});

			$(document).on('click', '#dd', function(e) {
				$(this).toggleClass('active');
				e.stopPropagation();
			});

			$(document).on('click',
					'#loginForm > fieldset > input[name="resetForm"]',
					function(e) {
						$('#loginForm').trigger('reset');
					});


			/** *** Log Out confirmation *********** */
			$('#confirmLogoutYesNo').on(
					'show',
					function() {
						var link = $(this).data('link'), agreeBtn = $(this)
								.find('.agree');
					});

			$('.confirm-link').on('click', function(e) {
				e.preventDefault();
				var link = $(this).data('link');
				$('#confirmLogoutYesNo').data('link', link).modal('show');
			});

			$('#btnYes').click(function() {
				// handle redirect here
				var link = $('#confirmLogoutYesNo').data('link');
				location.href = link;
				$('#confirmLogoutYesNo').modal('hide');
			});
			/** *** Log Out confirmation *********** */
			
		});

var currencySymbol = '$';
var classProductQuantity = 'my-product-quantity';
var classProductRemove = 'my-product-remove';
var classProductTotal = 'my-product-total';
var idGrandTotal = 'my-cart-grand-total';
var idCartModal = 'my-cart-modal';
var idEmptyCartMessage = 'my-cart-empty-message';
var classCartBadge = 'my-cart-badge';

function addProduct(id, name, summary, price, quantity, image) {
	var products = getAllProducts();

	// check if the product is alreay added

	var productIndex = getIndexOfProductFromProducts(id, products);

	if (productIndex === -1) {
		// add product in produts array
		products.push({
			id : id,
			name : name,
			summary : summary,
			price : price,
			quantity : quantity,
			image : image
		});
	} else {
		// update existing produts array
		products[productIndex].quantity = products[productIndex].quantity
				+ quantity;
	}
	setAllProducts(products);
}

function setAllProducts(products) {
	localStorage.cartProducts = JSON.stringify(products);
}

function getAllProducts() {
	try {
		var products = JSON.parse(localStorage.cartProducts);
		return products;
	} catch (e) {
		return [];
	}
}

function addTocart(image, $addTocartBtn) {

	var imageStr = '<img width="80px" height="80px" src="' + image + '"/>';
	var $image = $(imageStr).css({
		"position" : "fixed",
		"z-index" : "999"
	});
	$addTocartBtn.prepend($image);
	var position = $(".my-cart-icon").position();
	$image.animate({
		top : position.top,
		left : position.left
	}, 1000, "linear", function() {
		$image.remove();
	});
}

function drawTable() {
	var $cartTable = $("#my-cart-table");
	$cartTable.empty();

	var products = getAllProducts();
	$
			.each(
					products,
					function() {
						var total = this.quantity * this.price;

						$cartTable
								.append('<tr title="'
										+ this.summary
										+ '" data-id="'
										+ this.id
										+ '" data-price="'
										+ this.price
										+ '">'
										+ '<td class="text-center" style="width: 30px;"><img width="30px" height="30px" src="'
										+ this.image
										+ '"/></td>'
										+ '<td>'
										+ this.name
										+ '</td>'
										+ '<td title="Unit Price">'
										+ currencySymbol
										+ getRoundedNumber(this.price)
										+ '</td>'
										+ '<td title="Quantity"><input type="number" min="1" style="width: 70px;" class="'
										+ classProductQuantity
										+ '" value="'
										+ this.quantity
										+ '"/></td>'
										+ '<td title="Total" class="'
										+ classProductTotal
										+ '">'
										+ currencySymbol
										+ getRoundedNumber(total)
										+ '</td>'
										+ '<td title="Remove from Cart" class="text-center" style="width: 30px;"><a href="javascript:void(0);" class="'
										+ classProductRemove
										+ '"><i class="fa fa-trash-o trashicon"></i></a></td>'
										+ '</tr>');

					});

	$cartTable.append(products.length ? '<tr>' + '<td></td>'
			+ '<td><strong>Total</strong></td>' + '<td></td>' + '<td></td>'
			+ '<td><strong id="' + idGrandTotal + '"></strong></td>'
			+ '<td></td>' + '</tr>'
			: '<div class="alert alert-danger" role="alert" id="'
					+ idEmptyCartMessage + '">Your cart is empty</div>');

	showGrandTotal();
}

function showModal() {
	drawTable();
	$("#" + idCartModal).modal('show');
}

function getRoundedNumber(number) {
	return number.toFixed(2);
}

function showGrandTotal() {
	$("#" + idGrandTotal).text(
			currencySymbol + getRoundedNumber(getTotalPrice()));
}

function getTotalPrice() {
	var products = getAllProducts();
	var total = 0;
	$.each(products, function(index, value) {
		total += value.quantity * value.price;
		total = getRoundedNumber(total) * 1;
	});
	return total;
}

function getTotalQuantity() {
	var total = 0;
	var products = getAllProducts();
	$.each(products, function(index, value) {
		total += value.quantity * 1;
	});
	return total;
}

function removeProduct(id) {
	var products = getAllProducts();
	var productId = products = $.grep(products, function(value, index) {
		return value.id != id;
	});
	setAllProducts(products);
	// update
	updateAddToCartButtonByProductIDWhenRemoved(id);
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

function getIndexOfProduct(id) {
	var productIndex = -1;
	var products = getAllProducts();
	$.each(products, function(index, value) {
		if (value.id == id) {
			productIndex = index;
			return;
		}
	});
	return productIndex;
}

function getIndexOfProductFromProducts(id, products) {
	var productIndex = -1;
	$.each(products, function(index, value) {
		if (value.id == id) {
			productIndex = index;
			return;
		}
	});
	return productIndex;
}

function updateCart() {
	$.each($("." + classProductQuantity), function() {
		var id = $(this).closest("tr").data("id");
		updatePoduct(id, $(this).val());
	});
}

function checkoutCart(products, totalPrice, totalQuantity) {
//	var checkoutString = "Total Price: " + totalPrice + "\nTotal Quantity: "
//			+ totalQuantity;
//	checkoutString += "\n\n id \t name \t summary \t price \t quantity \t image path";
//	$.each(products, function() {
//		checkoutString += ("\n " + this.id + " \t " + this.name + " \t "
//				+ this.summary + " \t " + this.price + " \t " + this.quantity
//				+ " \t " + this.image);
//	});
//	alert(checkoutString)
	console.log("checking out", products, totalPrice, totalQuantity);
	
	showCheckoutPage(products,totalPrice, totalQuantity);
}

function clearProduct() {
	setAllProducts([]);
}

function updateCartInformation() {
	var $cartBadge = $("." + classCartBadge);
	$cartBadge.text(getTotalQuantity());
	$("#itemsTotalAmount").text(currencySymbol + '' + getTotalPrice());

}

function updateAddToCartButton(actionButton) {
	if (isProductInCart(actionButton) === true) {
		actionButton.addClass("added");
		actionButton.text('ADDED');
		actionButton.prop('disabled', true);
	} else {
		actionButton.text('ADD TO CART');
		actionButton.removeClass("added");
		actionButton.prop('disabled', false);
	}
}

function isProductInCart(actionButton) {
	var productInCart = actionButton.data('addtocart');
	return productInCart;

}

function setAddProductStatusInCart(actionButton, value) {
	actionButton.data('addtocart', value);
	actionButton.attr('data-addtocart', value);
}

function updateAddToCartButtonWithExistingCartItemsForAllProduct() {
	console
			.log('Inside updateAddToCartButtonWithExistingCartItemsForAllProduct');
	var products = getAllProducts();
	var isFound = false;
	$.each(products, function(index, value) {
		var productId = value.id;
		var productQuantity = value.quantity;
		$('button.my-cart-add-btn').each(
				function(i, obj) {
					var id = $(this).data('id');
					var quantity = $(this).data('quantity');
					var isPresentInCart = $(this).data('addtocart');

					if (productId == id) {
						// modify the input values
						var input = $(this).parent().siblings('.stepper-input')
								.find("input");
						input.val(productQuantity);
						// modify data values for the button
						$(this).data('quantity', productQuantity);
						$(this).attr('data-quantity', productQuantity);

						$(this).data('addtocart', true);
						$(this).attr('data-addtocart', true);

						// change the text of 'ADD TO CART' to '✔ ADDED'
						updateAddToCartButton($(this));

						isFound = true;
						return false;
					}
				});
		if (!isFound) {
			console.log('No match found for:' + productId);
		}

	});
}

function updateAddToCartButtonByProductIDWhenRemoved(productId) {
	$('button.my-cart-add-btn').each(
			function(i, obj) {
				var id = $(this).data('id');
				if (productId == id) {
					// modify the input values
					var input = $(this).parent().siblings('.stepper-input')
							.find("input");
					input.val(1);
					// modify data values for the button
					$(this).data('quantity', 1);
					$(this).attr('data-quantity', 1);

					$(this).data('addtocart', false);
					$(this).attr('data-addtocart', false);

					// change the text of 'ADD TO CART' to '✔ ADDED' or 'ADD TO
					// CART'
					updateAddToCartButton($(this));
					return false;
				}
			});
}

function registerUser() {

	// reset all
	$('#registraionMessageHolder > span.loader').hide();
	$(".registraionMessage").html('');
	hideSpan($(".registraionMessage"));

	// disable buttons

	var userRegistrationRequest = {};

	// create userDetails object
	var userDetails = {};

	userDetails["username"] = $('#registerForm input[name="username"]').val();
	userDetails["firstName"] = $('#registerForm input[name="fname"]').val();
	userDetails["lastName"] = $('#registerForm input[name="lname"]').val();
	userDetails["contact"] = $('#registerForm input[name="contact"]').val();
	userDetails["email"] = $('#registerForm input[name="email"]').val();

	// get the password
	var password = $('#registerForm input[name="password"]').val();

	// create userRegistrationRequest object
	userRegistrationRequest["userDetails"] = userDetails;
	userRegistrationRequest["password"] = password;

	$
			.ajax(
					{
						method : "POST",
						contentType : "application/json",
						url : "/mykart-web/registerCustomer",
						data : JSON.stringify(userRegistrationRequest),
						dataType : 'json',
						timeout : 100000,
						beforeSend : function() {
							// setting a timeout
							$('#registraionMessageHolder > span.loader').show();
						},
						success : function(responsedata) {
							$('#registraionMessageHolder > span.loader').hide();
							if (responsedata.success) {
								$("#registerForm").trigger("reset");
								$(".registraionMessage")
										.html(
												'<i class="fa fa-check-square-o" style="font-size:18px;color:#27ae60;font-weight: bolder;">'
														+ responsedata.message
														+ '</i>');
							} else {
								$(".registraionMessage")
										.html(
												'<i class="fa fa-remove" style="font-size:18px;color:#800f0f;font-weight: bolder;">'
														+ responsedata.message
														+ '</i>');
							}
							showSpan($(".registraionMessage"));

						},
						error : function(e) {
							console.log("ERROR: ", e);
							display(e);
						}
					})
			.done(
					function(responsedata) {

						if (responsedata.success) {
							setTimeout(
									function() {
										$(".registraionMessage").html('');
										hideSpan($(".registraionMessage"));
										$("#signup-modal").modal('hide');
										$(
												'#registerForm > fieldset:nth-child(4) > input.previous.action-button')
												.click();
										setTimeout(
												function() {
													$(
															'#registerForm > fieldset:nth-child(3) > input.previous.action-button')
															.click();
												}, 2000);

									}, 3000);
						} else {

						}

					});

}

function loginUser() {

	// reset all
	$('#loginMessageHolder > span.loader').hide();
	$('.loginMessage').html('');
	hideSpan($(".loginMessage"));

	var login = {};

	login["username"] = $('#loginForm input[name="username"]').val();
	login["password"] = $('#loginForm input[name="password"]').val();

	$
			.ajax(
					{
						method : "POST",
						contentType : "application/json",
						url : "/mykart-web/login",
						data : JSON.stringify(login),
						dataType : 'json',
						timeout : 100000,
						beforeSend : function() {
							// setting a timeout
							$('#loginMessageHolder > span.loader').show();
						},
						success : function(responsedata) {
							$('#loginMessageHolder > span.loader').hide();
							if (responsedata.success) {
								$('#loginForm').trigger("reset");
								$("#userSpan").html(
										"Welcome " + responsedata.message);
								$('ul.right-section.showSection').hide();
								$('ul.right-section.hideSection').show();
							} else {
								$('.loginMessage')
										.html(
												'<i class="fa fa-remove" style="font-size:18px;color:#800f0f;font-weight: bolder;">'
														+ responsedata.message
														+ '</i>');
								showSpan($(".loginMessage"));
							}

						},
						error : function(e) {
							console.log("ERROR: ", e);
							display(e);
						}
					}).done(function(responsedata) {

				if (responsedata.success) {
					setTimeout(function() {
						$("#login-modal").modal('hide');
					}, 1000);
				}
			});

}

function display(data) {
	var json = JSON.stringify(data, null, 4);
}

function validateFormData(fs) {
	var password = '';
	var isvalid = true;
	$(".error").remove();
	var inputs = fs.find(':input');
	inputs
			.each(function() {
				if ($(this).attr('name') == 'username') {
					var userNameVal = $(this).val();
					if (userNameVal.length < 8) {
						$(this)
								.after(
										'<span class="error">Username must be 8 character long</span>');
						isvalid = false;
					}
				} else if ($(this).attr('name') == 'password') {
					password = $(this).val();
					if (password.length < 8) {
						$(this)
								.after(
										'<span class="error">Password must be 8 character long</span>');
						isvalid = false;
					}
				} else if ($(this).attr('name') == 'cpassword') {
					cpassword = $(this).val();
					if (cpassword != password) {
						$(this)
								.after(
										'<span class="error">Password not matched</span>');
						isvalid = false;
					}

				} else if ($(this).attr('name') == 'fname') {
					var fnameval = $(this).val();
					if (fnameval.length < 1) {
						$(this)
								.after(
										'<span class="error">First name Cannot be empty</span>');
						isvalid = false;
					}
				} else if ($(this).attr('name') == 'lname') {
					var lnameVal = $(this).val();
					if (lnameVal.length < 1) {
						$(this)
								.after(
										'<span class="error">Last name Cannot be empty</span>');
						isvalid = false;
					}
				} else if ($(this).attr('name') == 'contact') {
					var contact = $(this).val();

					var regEx = /^(\d{10})$/;
					var validcontact = regEx.test(contact);
					if (!validcontact) {
						$(this)
								.after(
										'<span class="error">Contact must be extact 10 digit long</span>');
						isvalid = false;
					}
				}
			});
	return isvalid;
}

function hideSpan(span) {
	span.css("display", "none");
}

function showSpan(span) {
	span.css("display", "inline-block");
}

function showCheckoutPage(products,totalPrice, totalQuantity) {
	
	var basket = {};
	basket["checkOutItems"]=products;
	basket["totalPrice"]=totalPrice;
	basket["totalQuantity"]=totalQuantity;
	
	$.ajax({
		method : "POST",
		contentType : "application/json",
		url : "/mykart-web/postCheckoutItemsToSession",
		data : JSON.stringify(basket),
		dataType : 'json',
		timeout : 100000,
		beforeSend : function() {
			// setting a timeout
		},
		success : function(responsedata) {
			if (responsedata) {
				window.location.href = "/mykart-web/checkout";
			} else {
				
			}

		},
		error : function(e) {
			console.log("ERROR: ", e);
			display(e);
		}
	});
}