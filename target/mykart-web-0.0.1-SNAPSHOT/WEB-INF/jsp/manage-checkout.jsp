<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>MyKart</title>
<%@include file="/WEB-INF/common/commonJsCss.jsp"%>
<spring:url value="/static/payment.css" var="paymentCSS" />
<link href="${paymentCSS}" rel="stylesheet" />

<spring:url value="/static/checkout.js" var="checkoutJS" />
<script src="${checkoutJS}"></script>

</head>
<body>
	<div id="root">
		<header id="greenBasketHeader">
			<%@include file="/WEB-INF/common/header-with-logoOnly.jsp"%>
		</header>
		<div class="container">
		
				  <div class="accordion-option">
		    <h3 class="title">Checkout Sections</h3>
		    <a href="javascript:void(0)" class="toggle-accordion active" accordion-id="#checkoutAccordion"></a>
		  </div>
		  <div class="clearfix"></div>
  
			<!-- MANAGE CHCEK OUT PAGE HTML CODE  -->
			<div class="panel-group" id="checkoutAccordion" role="tablist" aria-multiselectable="true">
				<div class="card">
					<button class="card-header card-link" data-toggle="collapse"
						data-target="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">

						<b class="header-title"> Review Your Order </b>
						<!--<i class="fa fa-minus float-right "></i>-->
					</button>

					<div id="collapseOne" class="panel-collapse collapse in show"
						aria-labelledby="collapseOne" data-parent="#checkoutAccordion">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-12 col-md-10 col-md-offset-1">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Product</th>
												<th>Quantity</th>
												<th class="text-center">Price</th>
												<th class="text-center">Total</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${checkOutItems}" var="item">
											<tr data-id="${item.id}" data-name="${item.name}" data-summary="summary 1" data-price="${item.price}"
											data-quantity="${item.image}" data-image="${item.image}" data-removed=false>
												<td class="col-sm-8 col-md-6">
													<div class="media">
														<a class="pull-left" href="#"> <img width="50px"
															height="50px"
															src="${item.image}">
														</a>
														<div class="media-body">
															<h4 class="media-heading">${item.name}</h4>
														</div>
													</div>
												</td>
												<td class="col-sm-1 col-md-1" style="text-align: center">
													<input type="number" class="form-control quanityInput" min="1" value="${item.quantity}">
												</td>
												<td class="col-sm-1 col-md-1 text-center"><strong>$${item.price}</strong></td>
												<td class="col-sm-1 col-md-1 text-center itemTotal"><strong>$${item.price*item.quantity}</strong></td>
												<td class="col-sm-1 col-md-1">
													<button type="button" class="btn btn-danger removeItem">
														<span class="fa fa-remove"></span> Remove
													</button>
												</td>
											</tr>
									</c:forEach>

											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td>
													<h3>Total</h3>
												</td>
												<td class="text-right productTotal">
													<h3>
														<strong>$31.53</strong>
													</h3>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<button class="card-header collapsed card-link"
						data-toggle="collapse" data-target="#collapseTwo"
						aria-expanded="true" aria-controls="collapseTwo">

						<b class="header-title">Choose Delivery Address</b>
					</button>

					<div id="collapseTwo" class="panel-collapse collapse in show"
						data-parent="#checkoutAccordion">
						<div class="card-body">
						
							<div class="container-fluid">
									<table id="addressListTable" class="table table-hover table-borderless" style="margin-top: 1rem;">
										<tbody>
											<c:forEach items="${userAddressList}" var="userAddress">
												<tr class="d-flex">
													<%-- <td class="col-7">${userAddress.addrLine1},
														${userAddress.addrLine2}, City: ${userAddress.city},
														State: ${userAddress.state}, Pin: ${userAddress.pin}</td> --%>
														
														<td class="col-12">
														<label for="CNTCT3831AD5E804A446ABB2A90055" class="_8J-bZE _1tkDFt _2i24Q8">
													   <input type="radio" readonly class="_2haq-9" name="address" id="${userAddress.addressId}">
													   <div class="_6ATDKp"></div>
													   <div class="_2o59RR">
													      <div class="A1v2GV">
													         <div id="CNTCT3831AD5E804A446ABB2A90055" class="_1i74Oi">
													            <p class="_22O2Xt">
														            <span class="_3n0HwW">${userDetails.firstName} ${userDetails.lastName}</span>
														            <span class="_rmbzw">WORK</span><span class="_2kSC_X _3n0HwW">${userDetails.contact}</span>
													            </p>
													            <span class="_22O2Xt GeUS8P">${userAddress.addrLine1}, ${userAddress.addrLine2}, ${userAddress.city}, ${userAddress.state} - <span class="_3n0HwW">${userAddress.pin}</span></span>
													            <button class="_2AkmmA _I6-pD _7UHT_c deliverhere">Deliver Here</button>
													         </div>
													      </div>
													   </div>
													</label>
														</td>
														
														
														
													<!-- <td class="col-2">Home</td>
													<td class="col-3"><input type="radio" name="addressIDRadioButton"/></td> -->

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

						</div>
					</div>
				</div>
				<div class="card">
					<button class="card-header collapsed" data-toggle="collapse"
						data-target="#collapseThree" aria-expanded="true"
						aria-controls="collapseThree">

						<b class="header-title"> Payment Option </b>

					</button>
					<div id="collapseThree" class="panel-collapse collapse in show"
						data-parent="#checkoutAccordion">
						<div class="card-body">
							<div class="col-md-7 paymentdropdown">
								<div class="form-group">
									<select class="form-control" id="paymentFormControlSelect" disabled>
										<option>Choose Payment Method</option>
										<option>Cash On Delivery</option>
										<option>Card</option>
									</select>
								</div>
							</div>
							<div class="paymentform row paymentrow">
								<div class="col-md-7">
									<div class="left border">
										<div class="row paymentrow">
											<span class="header">Payment</span>
											<div class="icons">
												<img
													src="./static/GreenKart - veg and fruits kart_files/visa.png" />
												<img
													src="./static/GreenKart - veg and fruits kart_files/mastercard-logo.png" />
												<img
													src="./static/GreenKart - veg and fruits kart_files/maestro.png" />
											</div>
										</div>

										<span>Cardholder's name:</span> <input
											placeholder="Linda Williams"> <span>Card
											Number:</span> <input placeholder="0125 6780 4567 9909">
										<div class="row paymentrow">
											<div class="col-4">
												<span>Expiry date:</span> <input placeholder="YY/MM">
											</div>
											<div class="col-4">
												<span>CVV:</span> <input id="cvv">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div>
								<button id="placeOrderButton" class="pull-right" disabled>Place order</button>
								<div></div>
							</div>
						</div>
					</div>
				</div>

				<!-- MANAGE CHECK OUT HTML CODE  -->

				<footer>
					<%@include file="/WEB-INF/common/footer.jsp"%>
				</footer>

			</div>
		</div>
	</div>
</body>
</html>