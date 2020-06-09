<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>MyKart</title>
<%@include file="/WEB-INF/common/commonJsCss.jsp"%>
<spring:url value="/static/user-profile.css" var="userProfileCSS" />
<link href="${userProfileCSS}" rel="stylesheet" />

<spring:url value="/static/user-profile.js" var="userProfileJS" />
<script src="${userProfileJS}"></script>
</head>
<body>
	<div id="root">
		<header>
			<%@include file="/WEB-INF/common/header.jsp"%>
		</header>
		<div class="container">

			<!-- MANAGE PROFILE PAGE HTML CODE  -->

			<div id="manageProfileAccordian">

				<div class="card">
					<button class="card-header card-link" data-toggle="collapse"
						data-target="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">

						<b class="header-title">Manage Password</b>
						<!-- <i class="fa fa-minus float-right "></i> -->
					</button>

					<div id="collapseOne" class="collapse show"
						aria-labelledby="#collapseOne"
						data-parent="#manageProfileAccordian">
						<div class="card-body">Manage Password</div>
					</div>
				</div>

				<div class="card">
					<button class="card-header card-link" data-toggle="collapse"
						data-target="#collapseTwo" aria-expanded="true"
						aria-controls="collapseTwo">

						<b class="header-title">Manage Address</b>
						<!-- <i class="fa fa-minus float-right "></i> -->
					</button>

					<div id="collapseTwo" class="collapse show"
						aria-labelledby="collapseTwo"
						data-parent="#manageProfileAccordian">
						<div class="card-body">

							<div id="existingAddressTable">

								<div class="container-fluid">
									<table id="addressListTable" class="table table-hover">
										<caption>Registered Address</caption>
										<tbody>
											<c:forEach items="${userAddressList}" var="userAddress">
												<tr class="d-flex">
													<td class="col-7">${userAddress.addrLine1},
														${userAddress.addrLine2}, City: ${userAddress.city},
														State: ${userAddress.state}, Pin: ${userAddress.pin}</td>
													<td class="col-2">Home</td>
													<td class="col-3"><span
														data-id='${userAddress.addressId}'
														data-addrl1='${userAddress.addrLine1}'
														data-addrl2='${userAddress.addrLine2}'
														data-city='${userAddress.city}'
														data-state='${userAddress.state}'
														data-pin='${userAddress.pin}'><i class="fa fa-edit"
															style="color: green;"></i></span> <span><a href="#"
															data-link='${contextPath}/delete/address/${userAddress.addressId}'><i
																class="fa fa-trash" style="color: red;"></i></a></span></td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<div id="addNewButtonHolder">
									<button type="button" id="addNewAddress"
										class="btn btn-success">
										<i class="fa fa-plus"></i> Add New Address
									</button>
								</div>
								<div class="newAddressForm">
									<form action="${contextPath}/profile/addAddress"
										model-attribute="userAddress" method="post">
										<span>Add New Address Form</span>
										<div id="address">
											<div class="form-group">
												<div class="form-group">
													<label for="inputAddress">Line 1</label> <input type="text"
														class="form-control" id="" name="addrLine1"
														placeholder="Flat No., House No." required>
												</div>
												<div class="form-group">
													<label for="inputAddress2">Line 2</label> <input
														type="text" class="form-control" id="" name="addrLine2"
														placeholder="">
												</div>
												<div class="form-row">
													<div class="form-group col-md-6">
														<label for="inputCity">City</label> <input type="text"
															class="form-control" id="" name="city" placeholder="City"
															required>
													</div>
													<div class="form-group col-md-4">
														<label for="inputState">State</label> <select id=""
															class="form-control" name="state" required>
															<option selected>Choose...</option>
															<option>Andhra Pradesh</option>
															<option>Bihar</option>
															<option>Delhi</option>
															<option>Maharastra</option>
															<option>Uttar Pradesh</option>
															<option>West Bengal</option>
														</select>
													</div>
													<div class="form-group col-md-2">
														<label for="inputZip">PIN Code</label> <input type="text"
															class="form-control" id="" name="pin" required>
													</div>
												</div>
												<div class="form-group">
													<input type="submit" class="btn btn-primary pull-right"
														name="submit" value="Update" />
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="updateExistingAddressForm">
								<form action="${contextPath}/profile/updateAddress"
									model-attribute="userAddress" method="post">
									<span>update Address Form</span>
									<div id="address">
										<div class="form-group">
											<div class="form-group">
												<label for="inputAddress">Line 1</label> <input type="text"
													class="form-control" id="inputAddress1" name="addrLine1"
													placeholder="Flat No., House No." required>
											</div>
											<div class="form-group">
												<label for="inputAddress2">Line 2</label> <input type="text"
													class="form-control" id="inputAddress2" name="addrLine2"
													placeholder="">
											</div>
											<div class="form-row">
												<div class="form-group col-md-6">
													<label for="inputCity">City</label> <input type="text"
														class="form-control" id="inputCity" name="city"
														placeholder="City" required>
												</div>
												<div class="form-group col-md-4">
													<label for="inputState">State</label> <select
														id="inputState" class="form-control" name="state" required>
														<option selected>Choose...</option>
														<option>Andhra Pradesh</option>
														<option>Bihar</option>
														<option>Delhi</option>
														<option>Maharastra</option>
														<option>Uttar Pradesh</option>
														<option>West Bengal</option>
													</select>
												</div>
												<div class="form-group col-md-2">
													<label for="inputZip">PIN Code</label> <input type="text"
														class="form-control" id="inputPin" name="pin" required>
												</div>
											</div>
											<div class="form-group">
												<input type="button" class="btn btn-danger" id="cancelUpdateAddress"
													name="cancel" value="Cancel" />
												<input type="submit" class="btn btn-primary pull-right"
													name="submit" value="Submit" />
											</div>
										</div>
										<input type="hidden" name="addressId" id="hiddenAddressId" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<button class="card-header card-link" data-toggle="collapse"
						data-target="#collapseThree" aria-expanded="true"
						aria-controls="collapseThree">

						<b class="header-title">View Past Orders</b>
						<!-- <i class="fa fa-minus float-right "></i> -->
					</button>

					<div id="collapseThree" class="collapse show"
						aria-labelledby="collapseThree"
						data-parent="#manageProfileAccordian">
						<div class="card-body">View Past Orders</div>
					</div>
				</div>
			</div>

			<!-- MANAGE PROFILE PAGE HTML CODE  -->

			<footer>
				<%@include file="/WEB-INF/common/footer.jsp"%>
			</footer>

		</div>
	</div>

	<!-- 	<script>
		$('.card-header').click(function() {
			$(this).find('i').toggleClass('fa fa-plus fa fa-minus');
		});

		//$('#manageProfileAccordian .collapse').collapse('show');
		//$('.collapse.in').collapse('hide');
		$('.panel-collapse').removeData('bs.collapse').collapse({
			parent : false,
			toggle : false
		}).collapse('show').removeData('bs.collapse').collapse({
			parent : '#manageProfileAccordian',
			toggle : false
		});
	</script> -->

	<div class="modal fade" id="confirmDeleteAddressYesNo" tabindex="-1"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete Address</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>Do you want to delete this address?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
					<button type="button" id="btnYesDeleteAddress"
						class="btn btn-success agree">Yes</button>

				</div>
			</div>
		</div>
	</div>

</body>
</html>