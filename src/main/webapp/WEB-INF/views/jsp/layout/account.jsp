<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="panel panel-default mypanel1" style="float: left">
	<div class="panel-heading">Your Accounts</div>
	<div class="panel-body">
		<a href="#myAcc" data-toggle="modal">
			<div class="panel panel-info">
				<div class="panel-heading">Add new</div>
			</div>
		</a>
		<c:forEach items="${accounts}" var="account">
			<spring:url value="/account/notes/id=${account.id}" var="addHref" />
			<a href="${addHref}">
				<div class="panel panel-info">
					<div class="panel-heading">${account.name}</div>
				</div>
			</a>
		</c:forEach>
	</div>
</div>
<div class="panel panel-default mypanel2" style="float: left">

	<!-- /.panel-heading -->
	<div class="panel-body">
		<!-- Nav tabs -->
			<ul class="nav nav-tabs">
			<li class="active"><a href="#Transaction" data-toggle="tab">Transaction</a></li>
			<li><a href="<spring:url value="/account/detail/id=${oneAccount.id}" />" data-toggle="tab">Detail</a></li>
			<li><a href="<spring:url value="/account/summary/id=${oneAccount.id}" />" data-toggle="tab">Summary</a></li>
			<li><a href="<spring:url value="/account/notes/id=${oneAccount.id}" />" data-toggle="tab">Notes</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane fade" id="Transaction">
				<h4>${oneAccount.name}</h4>

			</div>
			<div class="tab-pane fade in active" id="Detail">
				<h4>Profile Tab</h4>
				<c:url var="post_url" value="/updateAccount" />
				<c:if test="${updateAccount.id!=null}">
					<form:form id="form" method="POST" action="${post_url}" commandName="updateAccount">
						<div class="modal-body">
							<table class="table table-bordered table-hover text-center">
								<tr>
									<td>Account id:</td>
									<td><form:input path="id" id="id" /></td>
								</tr>
								<tr>
									<td>Account name :</td>
									<td><form:input path="name" id="name" /></td>
								</tr>
								<tr>
									<td>Account number:</td>
									<td><form:input path="number" id="number" /></td>
								</tr>
								<tr>
									<td>Account currency :</td>
									<td><form:input path="currency" id="currency" /></td>

								</tr>
								<tr>
									<td>Account institution :</td>
									<td><form:input path="institution" id="institution" /></td>
								</tr>
								<tr>
									<td>Account address :</td>
									<td><form:input path="address" id="address" /></td>
								</tr>
								<tr>
									<td>Account phone :</td>
									<td><form:input path="phone" id="phone" /></td>
								</tr>
							</table>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
							<input class="btn btn-primary" type="submit" value="submit">
						</div>
					</form:form>
				</c:if>
				<c:if test="${updateAccount.id==null}">
		Check account or create new
		</c:if>
				${oneAccount.name} ${oneAccount.number} ${oneAccount.currency} ${oneAccount.institution} ${oneAccount.address} ${oneAccount.phone}
			</div>
			<div class="tab-pane fade" id="Summary">
				<h4>Messages Tab</h4>
				<p>Summary</p>
			</div>
			<div class="tab-pane fade" id="Notes">
				<c:forEach items="${commentsForOne}" var="comment">
					<blockquote>
						<p>${comment.userName}</p>
						<p>${comment.commentText}</p>
						<small>comment.userName <cite title="Source Title"></cite>
						</small>
					</blockquote>
				</c:forEach>
				<a href=""></a>

				<c:forEach items="${filesForOne}" var="file">
					<p>
						<a href="<spring:url value="/downloadfile?fileName=${file.name}" />">${file.name}</a>
					</p>
				</c:forEach>

				<div id="commentHidden">
					<input class="input" placeholder="Add note">
				</div>

				<script src="<c:url value = "/resources/js/my.js"/>"></script>

				<div align="left" id="commentForma" style="display: none">
					<form method="post" action="upload/${oneAccount.id}" enctype="multipart/form-data">
						<input id="file-id" type="file" name="multipartFile" /> <br /> <input class="btn btn-info btn-circle btn-lg" type="submit" value="Upload" />
					</form>
					<form:form action="addcomment/${oneAccount.id}" method="post" commandName="commentForm">
						<table style="width: 800px">

							<tr>
								<td>User Name:</td>
								<td><form:input class="form-control" placeholder="name:" path="userName" /></td>
							</tr>
							<tr height=" 10px;">
							</tr>
							<tr>
								<td style="padding: 10px 0;">Note text:</td>
								<td><form:textarea class="jqte-test" placeholder="comment:" rows="5" cols="40" path="commentText" /></td>
							</tr>
							<tr height=" 10px;">
							</tr>
							<tr>

							</tr>
							<tr>
								<td colspan="2" align="center"><input type="submit" class="btn btn-info btn-circle btn-lg" value="AddNote" /></td>
							</tr>
						</table>
					</form:form>

				</div>
			</div>
		</div>
	</div>
	<div class="modal hide" id="myAcc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel">New Account</h3>
		</div>
		<c:url var="post_url" value="/createAccount" />
		<form:form id="form" method="POST" action="${post_url}" commandName="newAccount">
			<div class="modal-body">
				<table class="table table-bordered table-hover text-center">
					<tr>
						<td>Account name :</td>
						<td><form:input class="input" path="name" id="name" /></td>
					</tr>
					<tr>
						<td>Account number:</td>
						<td><form:input class="input" path="number" id="number" /></td>
					</tr>
					<tr>
						<td>Account currency :</td>
						<td><form:select class="input" path="currency" id="currency">
								<form:options items="${allCurrency}" />
							</form:select></td>
					</tr>
					<tr>
						<td>Account institution :</td>
						<td><form:input class="input" path="institution" id="institution" /></td>
					</tr>
					<tr>
						<td>Account address :</td>
						<td><form:input class="input" path="address" id="address" /></td>
					</tr>
					<tr>
						<td>Account phone :</td>
						<td><form:input class="input" path="phone" id="phone" /></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<input class="btn btn-primary" type="submit" value="submit">
			</div>
		</form:form>
	</div>
	<!-- /.panel-body -->
</div>


