<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<spring:url value="/static/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />

<spring:url value="/static/header.css" var="header" />
<link href="${header}" rel="stylesheet" />


<spring:url value="/static/product.css" var="product" />
<link href="${product}" rel="stylesheet" />


<spring:url value="/static/font.css" var="font" />
<link href="${font}" rel="stylesheet" />

<spring:url value="/static/font-awesome.min.css" var="fontAwesomeCSS" />
<link href="${fontAwesomeCSS}" rel="stylesheet" />

<spring:url value="/static/jquery-3.3.1.min.js" var="jqueryJS" />
<script src="${jqueryJS}"></script>

<spring:url value="/static/bootstrap.min.js" var="bootstrapJS" />
<script src="${bootstrapJS}"></script>

<spring:url value="/static/mycart.js" var="mycartJS" />
<script src="${mycartJS}"></script>
</head>
<body>

	<c:forEach items="${productsByCategoryMap}" var="entry">
		<div class="panel panel-default mycart_section">
			<div class="panel-heading">${entry.key}</div>
			<div class="panel-body">
				<div class="products">
					<c:forEach items="${entry.value}" var="item" varStatus="loop">
						<div class="product">
							<div class="product-image">
								<img
									src="./static/GreenKart - veg and fruits kart_files/broccoli.jpg"
									alt="${item.name}">
							</div>
							<h4 class="product-name">${item.name}-1${item.measuringScale}</h4>
							<p class="product-price">${item.price}</p>
							<div class="stepper-input">
								<a href="javascript:void(0);" class="decrement">€-</a> <input
									type="number" class="quantity" value="1" readonly> <a
									href="javascript:void(0);" class="increment">+</a>
							</div>
							<div class="product-action">
								<button class="my-cart-add-btn" type="button"
									data-addtocart="false" data-id="${item.id}"
									data-addtocart="false" data-name="${item.name}"
									data-summary="summary 1" data-price="${item.price}"
									data-quantity="1"
									data-image="./static/GreenKart - veg and fruits kart_files/broccoli.jpg">ADD
									TO CART</button>
							</div>
						</div>
						----------------------------------------------------------------------------------------------
					</c:forEach>


				</div>
			</div>
			<div class="panel-footer">
				<div class="form-group text-right">
					<a href="#" class="btn btnsmall btn-warning ">Show All >></a>
				</div>
			</div>
		</div>
	</c:forEach>





</body>
</html>