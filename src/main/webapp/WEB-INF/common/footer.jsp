<section id="footer">
		<div class="container">
			<div class="row text-center text-xs-center text-sm-left text-md-left">
				<!-- <div class="col-xs-12 col-sm-4 col-md-4">
					<h5>GreenvegKart</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>About Us</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>In News</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Privacy Policy</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Terms and Conditions</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Help</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQs</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Contact Us</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-angle-double-right"></i>Vendor Connect</a></li>
					</ul>
				</div> -->
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p>About Us | Contact Us | FAQs</p>
				</div>
				<hr>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02"><i class="fa fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a href="https://www.fiverr.com/share/qb8D02" target="_blank"><i class="fa fa-envelope"></i></a></li>
					</ul>
				</div>
				<hr>
			</div>	
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p class="h6">Copyright © GeenvegKart<a class="text-green ml-2" href="#"></a></p>
				</div>
				<hr>
			</div>	
		</div>
	</section>

<div class="modal fade" id="my-cart-modal" tabindex="-1"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<!--<h4 class="modal-title" id="myModalLabel"><span class="fa fa-xs fa-shopping-cart"></span> My Cart</h4></div><button type="button" class="close" data-dismiss="modal">&times;</button>-->
				<h5 class="modal-title">Basket Items</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<!--<table class="table table-hover table-responsive" id="my-cart-table"></table>-->
				<table class="table table-hover table-responsive" id="my-cart-table"></table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-success my-cart-checkout">Checkout</button>
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
						<i class="fa fa-refresh fa-spin" style="font-size:28px;color:#27ae60;margin: 0% 0% 0% 38%;"></i>
					</span>
					<span class="loginMessage">
					</span>
				</div>
				<form id="loginForm" autocomplete="off">
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
				<form id="registerForm" autocomplete="off">
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
						 <input id="user_Name_Submit" type="button" name="next" class="next action-button" value="Next" disabled="disabled"/>
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
