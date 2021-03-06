<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags'%>
<html>
<head>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value = "/resources/js/jquery-te-1.4.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value = "/resources/js/jquery-te-1.4.0.min.js"/>"></script>
<script src="<c:url value = "/resources/js/jquery.contextMenu.js"/>"></script>

<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link rel="stylesheet" href="<c:url value="/resources/css/my.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-responsive.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value = "/resources/css/jquery-te-1.4.0.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/jquery.contextMenu.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" type="text/css" />
</head>

<body>
	<tiles:insertAttribute name="body" />
</body>
</html>