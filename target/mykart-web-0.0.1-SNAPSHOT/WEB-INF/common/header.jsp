 <div class="top-header">
            <div class="d-flex justify-content-end" style="min-height: 30px;">
              <ul class="list-unstyled list-inline right-section">
                <li>
                  <ul class="list-unstyled list-inline login-section">
                    <li style="font-size: 13px;color: #666;">
                      <i class="fa fa-phone trashicon"></i>&nbsp;&nbsp;9733892131
                    </li>
                  </ul>
                </li>
              </ul>
              <ul class="list-unstyled list-inline right-section">
                <li>&nbsp</li>
              </ul>
              <ul class="list-unstyled list-inline right-section">
                <li>&nbsp</li>
              </ul>
              
              <!-- Login /Lpgout Section -->
              <ul class="list-unstyled list-inline right-section ${empty userDetails.firstName? 'showSection' : 'hideSection'}">
                <li>
                  <ul class="list-unstyled list-inline login-section">
                    <li>
                      <i class="fa fa-user trashicon"></i>
                    </li>
                    <li class="auth">
                      <a>Login</a>
                      <span style="margin: 0 5px;">|</span>
                      <a>Sign up</a>
                    </li>
                  </ul>
                </li>
              </ul>
              <ul class="list-unstyled list-inline right-section ${empty userDetails.firstName? 'hideSection' : 'showSection'}">
                <!-- <li>
                  <ul class="list-unstyled list-inline login-section">
                    <li>
                      <i class="fa fa-user trashicon"></i>
                    </li>
                    <li class="auth">
                      <span style="margin: 0 5px;" id="userSpan">Welcome <c:out value="${userDetails.username}" /></span>
                    </li>
                  </ul>
                </li> -->
                
                <div id="dd" class="wrapper-dropdown-5" tabindex="1">
                <span id="userSpan">Welcome <c:out value="${userDetails.firstName}" /></span>
					<ul class="dropdown">
						<li><a href="${contextPath}/viewProfile"><i class="icon-user"></i>Profile</a></li>
						<li><a href="#"><i class="icon-cog"></i>Settings</a></li>
						<li><a href="#" data-link="${contextPath}/logout" class="confirm-link"><i class="icon-remove"></i>Log out</a></li>
					</ul>
				</div>
              </ul>
              <!-- Login /Lpgout Section -->
              
              
              <ul class="list-unstyled list-inline right-section">
                <li>&nbsp</li>
              </ul>
              <ul class="list-unstyled list-inline right-section">
                <li>&nbsp</li>
              </ul>
            </div>
          </div>
<!--bg-light-->
          <nav class="navbar navbar-expand-md navbar-light">
            <a href="${contextPath}" class="navbar-brand">
              <div class="brand greenLogo">MY
                <span class="redLogo bigfont">K</span>
                <span class="redLogo">ART</span>
              </div>
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
              <!--<div class="navbar-nav"><a href="#" class="nav-item nav-link active">Home</a><div class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Messages</a><div class="dropdown-menu"><a href="#" class="dropdown-item">Inbox</a><a href="#" class="dropdown-item">Sent</a><a href="#" class="dropdown-item">Drafts</a></div></div></div>-->
              <div class="navbar-nav">
                <a href="#" class="navbar-brand font-weight-bold d-block d-lg-none">Shop By Category</a>
                <button type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbars"
                  aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div id="navbarContent" class="collapse navbar-collapse">
                  <ul class="navbar-nav mx-auto">
                    <li class="nav-item dropdown megamenu">
                      <a id="megamneu" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
                        class="nav-link dropdown-toggle font-weight-bold text-uppercase">Shop By Category</a>
                      <div aria-labelledby="megamneu" class="dropdown-menu border-0 p-0 m-0">
                        <div class="container">
                          <div class="row bg-white rounded-0 m-0 shadow-sm">
                            <div class="col-lg-7 col-xl-8">
                              <div class="p-4">
                                <div class="row">
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Heading one</h6>
                                    <ul class="list-unstyled">
                                    <c:forEach items="${categoryList}" var="category">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0">${category.name}</a>
                                      </li>
                                      </c:forEach>
                                    </ul>
                                  </div>
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Heading two</h6>
                                    <ul class="list-unstyled">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Home</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">About</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Help</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Account</a>
                                      </li>
                                    </ul>
                                  </div>
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Heading three</h6>
                                    <ul class="list-unstyled">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Home</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">About</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Help</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Account</a>
                                      </li>
                                    </ul>
                                  </div>
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Heading four</h6>
                                    <ul class="list-unstyled">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Home</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">About</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Help</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Account</a>
                                      </li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
              <!--<form class="form-inline"><div class="input-group"><input type="text" class="form-control" placeholder="Search"><div class="input-group-append"><button type="button" class="btn btn-secondary"><i class="fa fa-search"></i></button></div></div></form>-->
              <div class="navbar-nav search">
                <div class="search">
                  <a class="mobile-search" href="#">
                  <img src="./static/GreenKart - veg and fruits kart_files/search-green.png" alt="search">
                  </a>
                  <form action="#" method="get" class="search-form">
                    <a class="back-button" href="#">
                    <img src="./static/GreenKart - veg and fruits kart_files/back.png" alt="back">
                    </a>
                    <input type="search" placeholder="Search for Vegetables and Fruits" class="search-keyword">
                    <button class="search-button" type="submit"></button>
                  </form>
                </div>
              </div>
              <div class="navbar-nav mycart">
                <div class="cart-icon-holder">
                  <span class="fa fa-2x fa-shopping-basket my-cart-icon">
                  <span class="badge badge-notify my-cart-badge"></span>
                  </span>
                  <span class="hidden-xs hidden-sm" style="display: inline-block">
                  <span class="cartprice">Total:&nbsp;&nbsp;
                  <span id="itemsTotalAmount">&nbsp;</span>
                  </span>
                  </span>
                </div>
              </div>
              <!--<div class="navbar-nav"><div class="cart-info"><table><tbody><tr><td>Price</td><td>:</td><td><strong id="itemsTotalAmount">0</strong></td></tr></tbody></table></div></div><div class="navbar-nav"><div class="d-flex justify-content-end" style="min-height: 30px;"><ul class="list-unstyled list-inline right-section"><li><ul class="list-unstyled list-inline login-section"><li style="font-size: 13px;color: #666;"><i class="fa fa-phone trashicon"></i>&nbsp;&nbsp;9733892131</li></ul></li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul><ul class="list-unstyled list-inline right-section"><li><ul class="list-unstyled list-inline login-section"><li><i class="fa fa-user trashicon"></i></li><li class="auth"><a>Login</a><span style="margin: 0 5px;">|</span><a>Sign up</a></li></ul></li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul><ul class="list-unstyled list-inline right-section"><li>&nbsp</li></ul></div></div>-->
            </div>
          </nav>