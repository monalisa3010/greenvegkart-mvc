 <div class="top-header">
            <div class="d-flex justify-content-end" style="min-height: 30px;">
              <ul class="list-unstyled list-inline right-section">
                <li>
                  <ul class="list-unstyled list-inline login-section">
                    <li style="font-size: 13px;color: #666;">
                      <i class="fa fa-phone trashicon"></i>&nbsp;&nbsp;1860 234 321
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
              <h5><span class="big greenveg">G</span><span class="greenveg">reenveg</span><span class="big cart">K</span><span class="cart">art</span>
              <img src="${contextPath}/static/GreenKart - veg and fruits kart_files/greenvegkart.png" id="kartpic">
              </h5>
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
                          <div class="row bg-white rounded-0 m-0 shadow-sm megamenu-max-width">
                            <div class="col-lg-12 col-xl-12">
                              <div class="p-4">
                                <div class="row">
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Fruits & Vegetables</h6>
                                    <ul class="list-unstyled">
                                    <c:forEach items="${categoryList}" var="category">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0">${category.name}</a>
                                      </li>
                                      </c:forEach>
                                    </ul>
                                  </div>
                                  
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Foodgrains</h6>
                                    <ul class="list-unstyled">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Atta, Flours & Sooji</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Dals & Pulses</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Rice & Rice Products</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Salt, Sugar & Jaggery</a>
                                      </li>
                                    </ul>
                                  </div>
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Bakery, Cakes & Dairy</h6>
                                    <ul class="list-unstyled">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Dairy</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Breads & Buns</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Ice Creams & Desserts</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Cakes & Pastries</a>
                                      </li>
                                    </ul>
                                  </div>
                                  <div class="col-lg-6 mb-4">
                                    <h6 class="font-weight-bold text-uppercase">Beverages</h6>
                                    <ul class="list-unstyled">
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Energy & Soft Drinks</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Tea</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Health Drink, Supplement</a>
                                      </li>
                                      <li class="nav-item">
                                        <a href="" class="nav-link text-small pb-0 ">Fruit Juices & Drinks</a>
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
              <div class="navbar-nav search">
                <div class="search">
                  <a class="mobile-search" href="#">
                  <img src="${contextPath}/static/GreenKart - veg and fruits kart_files/search-green.png" alt="search">
                  </a>
                  <form action="#" method="get" class="search-form">
                    <a class="back-button" href="#">
                    <img src="${contextPath}/static/GreenKart - veg and fruits kart_files/back.png" alt="back">
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
            </div>
          </nav>