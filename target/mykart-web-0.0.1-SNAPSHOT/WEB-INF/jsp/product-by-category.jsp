<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>MyKart</title>
<%@include file="/WEB-INF/common/commonJsCss.jsp"%>

</head>
<body>
	<div id="root">
		<header>
			<%@include file="/WEB-INF/common/header.jsp"%>
		</header>
		<div class="container">
			<div class="products-wrapper">
				<div class="panel panel-default mycart_section">
					<div class="panel-heading">${category.name}</div>
					<div class="panel-body">
						<div class="products">
							<c:forEach items="${products}" var="product">
								<div class="product">
									<div class="product-image">
										<img src="${imgSrc}/${product.image}" alt="${product.name}">
									</div>
									<h4 class="product-name">${product.name}-1
										${product.measuringScale}</h4>
									<p class="product-price">&nbsp;${product.price}</p>
									<div class="stepper-input">
										<a href="javascript:void(0);" class="decrement">-</a> <input
											type="number" class="quantity" value="1" readonly> <a
											href="javascript:void(0);" class="increment">+</a>
									</div>
									<div class="product-action">
										<button class="my-cart-add-btn" type="button"
											data-addtocart="false" data-id="${product.id}"
											data-addtocart="false" data-name="${product.name}"
											data-summary="summary 1" data-price="${product.price}"
											data-quantity="1" data-image="${imgSrc}/${product.image}">ADD
											TO CART</button>
									</div>
								</div>
							</c:forEach>


						</div>
					</div>
				</div>
			</div>
			<footer>
				<%@include file="/WEB-INF/common/footer.jsp"%>
			</footer>

		</div>
	</div>
</body>
</html>