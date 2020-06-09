<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
   <head>
      <title>MyKart</title>
      <%@include file="/WEB-INF/common/commonJsCss.jsp"  %>
   </head>
   <body>
      <div id="root">
         <header>
            <%@include file="/WEB-INF/common/header.jsp"  %>
         </header>
         <div class="container">
            <div class="products-wrapper">
               <c:forEach items="${productsByCategoryMap}" var="entry">
                  <div class="panel panel-default mycart_section">
                     <div class="panel-heading">${entry.key.name}</div>
                     <div class="panel-body">
                        <div class="products">
                           <c:forEach items="${entry.value}" var="item" varStatus="loop">
                              <div class="product">
                                 <div class="product-image">
                                    <img
                                       src="${imgSrc}/${item.image}"
                                       alt="${item.name}">
                                 </div>
                                 <h4 class="product-name">${item.name}-1
                                    ${item.measuringScale}
                                 </h4>
                                 <p class="product-price">&nbsp;${item.price}</p>
                                 <div class="stepper-input">
                                    <a href="javascript:void(0);" class="decrement">-</a> <input
                                       type="number" class="quantity" value="1" readonly> <a
                                       href="javascript:void(0);" class="increment">+</a>
                                 </div>
                                 <div class="product-action">
                                    <button class="my-cart-add-btn" type="button"
                                       data-addtocart="false" data-id="${item.id}"
                                       data-addtocart="false" data-name="${item.name}"
                                       data-summary="summary 1" data-price="${item.price}"
                                       data-quantity="1"
                                       data-image="${imgSrc}/${item.image}">ADD
                                    TO CART</button>
                                 </div>
                              </div>
                           </c:forEach>
                        </div>
                     </div>
                     <div class="panel-footer">
                        <div class="form-group text-right">
                           <a href="${contextPath}/getProducts/category?cat_id=${entry.key.id}" class="btn btnsmall btn-warning ">Show All >></a>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
   </body>
   <footer>
      <%@include file="/WEB-INF/common/footer.jsp"  %>
   </footer>
</html>