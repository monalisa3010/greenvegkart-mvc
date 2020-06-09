<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<spring:url value="/static/GreenKart - veg and fruits kart_files" var="imgSrc" />

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

<spring:url value="/static/jquery.easing.min.js" var="easingJS" />
<script src="${easingJS}"></script>