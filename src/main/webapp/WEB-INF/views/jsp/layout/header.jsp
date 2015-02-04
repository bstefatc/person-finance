
<head>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags'%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags'%>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:url value = "/resources/js/jquery-te-1.4.0.min.js"/>"></script>


</head>
<body>
	<sec:authorize ifAnyGranted='anonim'>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<sec:authorize ifAnyGranted='anonim'>
					<br>
					<a href="#myModal" data-toggle="modal">Registration</a>
				</sec:authorize>
				<a style="margin-left:100px" href="<spring:url value="/rest" />" data-toggle="modal">rest</a>
			</div>
			<sec:authorize ifAnyGranted='anonim'>
				<form method="POST" class="navbar-form navbar-right" action="<c:url value='/j_spring_security_check'/>" role="search">
					<div class="form-group">
						<input type="text" name="j_username" class="form-control" placeholder="login"> <input class="form-control" type="password"
							name="j_password" class="span2" placeholder="password">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</sec:authorize>
			<sec:authorize ifAnyGranted='user'>
				<ul class="nav pull-right">
					<li><a href="#"><b><sec:authentication property="principal.username" /></b></a> <a href=<c:url value='/j_spring_security_logout'/>>Logout</a></li>
				</ul>
			</sec:authorize>
		</div>
	</nav>
	</sec:authorize>
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h3 id="myModalLabel">Registration</h3>
				</div>
				<c:url var="post_url" value="/createuser" />
				<form:form id="form" method="POST" action="${post_url}" commandName="user">
					<div class="modal-body">
						<table class="table table-bordered table-hover text-center">
							<tr>
								<td>Username :</td>
								<td><form:input class="input form-control" path="username" id="username" />
									<div id="usernameanswer"></div></td>

							</tr>
							<tr>
								<td>Password :</td>
								<td><form:password class="input form-control" path="password" /></td>
							</tr>
							<tr>
								<td>Email :</td>
								<td><form:input class="input form-control" path="email" id="email" />
									<div id="emailvalid"></div></td>
							</tr>

						</table>
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
						<input class="btn btn-primary" type="submit" value="submit">
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<div class="navbar navbar-default mynavbar">
		<div class="navbar-inner" style="margin-top: 10px">
			<p>
				<a href="<spring:url value="/" />" class="mybtn btn btn-default">Dashboard</a> <a href="<spring:url value="/rest" />"
					class="btn btn-default mybtn">REST</a> <a class="btn btn-default mybtn">Calendar</a> <a class="btn btn-default mybtn">Reports</a> <a
					class="btn btn-default mybtn">Notes</a> <a class="btn btn-default mybtn">Settings</a>
			</p>
		</div>
	</div>

</body>