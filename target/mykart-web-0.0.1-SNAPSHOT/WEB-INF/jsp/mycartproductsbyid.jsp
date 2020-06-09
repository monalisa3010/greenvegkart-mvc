<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GreenKart - veg and fruits kart</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<spring:url value="/static/GreenKart - veg and fruits kart_files"
	var="imgSrc" />

<spring:url value="/static/bootstrap.css" var="bootstrap" />
<link href="${bootstrap}" rel="stylesheet" />

<spring:url value="/static/header.css" var="headerJS" />
<link href="${headerJS}" rel="stylesheet" />


<spring:url value="/static/product.css" var="product" />
<link href="${product}" rel="stylesheet" />


<spring:url value="/static/font.css" var="fontCSS" />
<link href="${fontCSS}" rel="stylesheet" />

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
	<div id="root">
		<header>
			<!--bg-light-->
			<nav class="navbar navbar-expand-md navbar-light">
				<a href="#" class="navbar-brand">
					<div class="brand greenLogo">
						MY <span class="redLogo bigfont">K</span> <span class="redLogo">ART</span>
					</div>
				</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse">
					<!--<div class="navbar-nav"><a href="#" class="nav-item nav-link active">Home</a><div class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Messages</a><div class="dropdown-menu"><a href="#" class="dropdown-item">Inbox</a><a href="#" class="dropdown-item">Sent</a><a href="#" class="dropdown-item">Drafts</a></div></div></div>-->
					<div class="navbar-nav">
						<a href="#"
							class="navbar-brand font-weight-bold d-block d-lg-none">Shop
							By Category</a>
						<button type="button" data-toggle="collapse"
							data-target="#navbarContent" aria-controls="navbars"
							aria-expanded="false" aria-label="Toggle navigation"
							class="navbar-toggler">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div id="navbarContent" class="collapse navbar-collapse">
							<ul class="navbar-nav mx-auto">
								<li class="nav-item dropdown megamenu"><a id="megamneu"
									href="" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"
									class="nav-link dropdown-toggle font-weight-bold text-uppercase">Shop
										By Category</a>
									<div aria-labelledby="megamneu"
										class="dropdown-menu border-0 p-0 m-0">
										<div class="container">
											<div class="row bg-white rounded-0 m-0 shadow-sm">
												<div class="col-lg-7 col-xl-8">
													<div class="p-4">
														<div class="row">
															<div class="col-lg-6 mb-4">
																<h6 class="font-weight-bold text-uppercase">Heading
																	one</h6>
																<ul class="list-unstyled">
																	<c:forEach items="${categoryList}" var="category">
																		<li class="nav-item"><a href=""
																			class="nav-link text-small pb-0">${category.name}</a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
															<div class="col-lg-6 mb-4">
																<h6 class="font-weight-bold text-uppercase">Heading
																	two</h6>
																<ul class="list-unstyled">
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Home</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">About</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Help</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Account</a></li>
																</ul>
															</div>
															<div class="col-lg-6 mb-4">
																<h6 class="font-weight-bold text-uppercase">Heading
																	three</h6>
																<ul class="list-unstyled">
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Home</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">About</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Help</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Account</a></li>
																</ul>
															</div>
															<div class="col-lg-6 mb-4">
																<h6 class="font-weight-bold text-uppercase">Heading
																	four</h6>
																<ul class="list-unstyled">
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Home</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">About</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Help</a></li>
																	<li class="nav-item"><a href=""
																		class="nav-link text-small pb-0 ">Account</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div></li>
							</ul>
						</div>
					</div>
					<!--<form class="form-inline"><div class="input-group"><input type="text" class="form-control" placeholder="Search"><div class="input-group-append"><button type="button" class="btn btn-secondary"><i class="fa fa-search"></i></button></div></div></form>-->
					<div class="navbar-nav search">
						<div class="search">
							<a class="mobile-search" href="#"> <img
								src="./static/GreenKart - veg and fruits kart_files/search-green.png"
								alt="search">
							</a>
							<form action="#" method="get" class="search-form">
								<a class="back-button" href="#"> <img
									src="./static/GreenKart - veg and fruits kart_files/back.png"
									alt="back">
								</a> <input type="search"
									placeholder="Search for Vegetables and Fruits"
									class="search-keyword">
								<button class="search-button" type="submit"></button>
							</form>
						</div>
					</div>
					<div class="navbar-nav mycart">
						<div class="cart-icon-holder">
							<span class="fa fa-2x fa-shopping-basket my-cart-icon"> <span
								class="badge badge-notify my-cart-badge"></span>
							</span> <span class="hidden-xs hidden-sm" style="display: inline-block">
								<span class="cartprice">Total:&nbsp;&nbsp; <span
									id="itemsTotalAmount">&nbsp;</span>
							</span>
							</span>
						</div>
					</div>
					<!--<div class="navbar-nav"><div class="cart-info"><table><tbody><tr><td>Price</td><td>:</td><td><strong id="itemsTotalAmount">0</strong></td></tr></tbody></table></div></div><div class="navbar-nav"><div class="d-flex justify-content-end" style="min-height: 30px;"><ul class="list-unstyled list-inline right-section"><li><ul class="list-unstyled list-inline login-section"><li style="font-size: 13px;color: #666;"><i class="fa fa-phone trashicon"></i>&nbsp;&nbsp;9733892131</li></ul></li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul><ul class="list-unstyled list-inline right-section"><li><ul class="list-unstyled list-inline login-section"><li><i class="fa fa-user trashicon"></i></li><li class="auth"><a>Login</a><span style="margin: 0 5px;">|</span><a>Sign up</a></li></ul></li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul></div></div>-->
				</div>
			</nav>
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
			</section>
			<footer>
				<p>
					© 2019 <strong>GreenKart</strong> - buy veg and fruits online
				</p>
			</footer>
			<div class="modal fade" id="my-cart-modal" tabindex="-1"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!--<h4 class="modal-title" id="myModalLabel"><span class="fa fa-xs fa-shopping-cart"></span> My Cart</h4></div><button type="button" class="close" data-dismiss="modal">&times;</button>-->
							<h5 class="modal-title">My Cart</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<!--<table class="table table-hover table-responsive" id="my-cart-table"></table>-->
							<table class="table table-hover table-responsive"
								id="my-cart-table"></table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary my-cart-checkout">Checkout</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>