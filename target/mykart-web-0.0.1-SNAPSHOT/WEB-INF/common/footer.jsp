<p>
	Â© 2019 <strong>GreenKart</strong> - buy veg and fruits online
	
</p>

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
				<table class="table table-hover table-responsive" id="my-cart-table"></table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary my-cart-checkout">Checkout</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="login-modal" tabindex="-1"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Sign In to Your Account</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<div id="loginMessageHolder">
					<span class="loader">
						<i class="fa fa-refresh fa-spin" style="font-size:28px;color:#27ae60;margin-top:8px;"></i>
					</span>
					<span class="loginMessage">
					</span>
				</div>
				<form id="loginForm">
					<!-- <div class="form-group">
						<input type="text" class="form-control" placeholder="Username"
							name="username" value="" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="Password" name="password" value="" />
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary submit action-button" id="loginsubmit" name="submit" value="Login" />
					</div> -->
					
					<fieldset>
						<h2 class="fs-title">Login Form</h2>
						<input type="text" name="username" placeholder="Username" />
						<input type="password" name="password" placeholder="Password" />
						<input type="button" name="resetForm" class="action-button" value="Reset" />
						<input
							type="submit" name="submit" class="submit action-button">
					</fieldset>
					
				</form>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="signup-modal" tabindex="-1"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Create your Account</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div id="registraionMessageHolder">
					<span class="loader">
						<i class="fa fa-refresh fa-spin" style="font-size:28px;color:#27ae60;margin-top:8px;"></i>
					</span>
					<span class="registraionMessage">
					</span>
				</div>
				<form id="registerForm">
					<!-- progressbar -->
					<ul id="progressbar">
						<li class="active">Create Username</li>
						 <li>Choose Password</li> 
						<li>Personal Details</li>
					</ul>
					<!-- fieldsets -->
					<fieldset>
						<h2 class="fs-title">Create Username</h2>
						<h3 class="fs-subtitle">Step 1</h3>
						<input type="text" name="username" placeholder="Username" />
						 <input type="button" name="next" class="next action-button" value="Next" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">Choose Password</h2>
						<h3 class="fs-subtitle">Step 2</h3>
 							<input type="password" name="password" placeholder="Password" />
 							<input type="password" name="cpassword" placeholder="Confirm Password" />
 							<input type="button" name="previous"
							class="previous action-button" value="Previous" />
 							<input type="button" name="next" class="next action-button" value="Next" />
					</fieldset>
					<fieldset>
						<h2 class="fs-title">Personal Details</h2>
						<h3 class="fs-subtitle">Final Step</h3>
						<input type="text" name="fname" placeholder="First Name" /> <input
							type="text" name="lname" placeholder="Last Name" /> <input
							type="text" name="contact" placeholder="Phone" />
						<input type="email" name="email" placeholder="Email" />
						<input type="button" name="previous"
							class="previous action-button" value="Previous" /> 
							
							<!-- <button type="submit" class="btn btn-success">
    							<i class="fa fa-spinner fa-pulse buttonLoader"></i> Submit Submit
							</button> -->

						<input
							type="submit" id="signupsubmit" name="submit" class="submit action-button">
					</fieldset>
				</form>
			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="confirmLogoutYesNo" tabindex="-1"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Logout Confirmation</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				 <p>Do you want to logout?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
				<button type="button" id="btnYes" class="btn btn-success agree">Yes</button>
				
			</div>
		</div>
	</div>
</div>

<!-- <div id="confirmLogoutYesNo" class="modal hide">
    <div class="modal-header">
        <a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
         <h3>Logout Confirmation</h3>
    </div>
    <div class="modal-body">
       <p>Do you want to logout?</p>
    </div>
    <div class="modal-footer">
      <a href="#" id="btnYes" class="btn agree">Yes</a>
      <a href="#" data-dismiss="modal" aria-hidden="true" class="btn secondary">No</a>
    </div>
</div> -->
