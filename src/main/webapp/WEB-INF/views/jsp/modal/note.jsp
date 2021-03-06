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
			<spring:url value="/account/detail/id=${account.id}" var="addHref" />
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
		<h3 id="example">
			<i><b>${oneAccount.name}</b></i> <span></span>
		</h3>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li><a href="<spring:url value="/account/transaction/id=${oneAccount.id}" />">Transaction</a></li>
			<li><a href="<spring:url value="/account/detail/id=${oneAccount.id}" />">Detail</a></li>
			<li><a href="<spring:url value="/account/summary/id=${oneAccount.id}" />">Summary</a></li>
			<li class="active"><a href="<spring:url value="/account/notes/id=${oneAccount.id}" />">Notes</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane fade in active" id="Notes">

				<c:forEach items="${commentsForOne}" var="comment">
					<blockquote>
						<p>${comment.userName}</p>
						<p>${comment.commentText}</p>
						<small>comment.userName <cite title="Source Title"></cite>
						</small>
						<p>
							<a target="_blank" href="<spring:url value="/downloadfile?fileName=${comment.docName}" />">${comment.docName}</a>
						</p>
					</blockquote>
				</c:forEach>
				<a href=""></a>
				<div style="margin-left: 15px; margin-top:10px;" id="commentHidden">
					<input type="button" class=" btn btn-lg" value="Add new comment">
				</div>
				<script src="<c:url value = "/resources/js/my.js"/>"></script>
				<div align="left" id="commentForma" style="display: none; margin-left: 15px; margin-top: 10px;">
					<form:form action="addcomment/${oneAccount.id}" enctype="multipart/form-data" method="post" commandName="commentForm">
						<table style="width: 800px">
							<tr>
								<td style="padding-bottom: 10px;">User Name:</td>
								<td><form:input class="form-control" placeholder="name:" path="userName" /></td>
							</tr>
							<tr>
								<td style="padding: 2px 0;">Note text:</td>
								<td><form:textarea class="jqte-test" style=" margin-top: 1px; margin-bottom: 1px;" placeholder="comment:" rows="5" cols="40"
										path="commentText" /></td>
							<tr>
								<td></td>
								<td><input id="file-id" type="file" name="multipartFile" /></td>
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
	<div class="modal fade" id="myAcc">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h3 id="myModalLabel" style="margin-left: 30px;">New Account</h3>
				</div>
				<script src="<c:url value = "/resources/js/my.js"/>"></script>
				<c:url var="post_url" value="/createAccount" />
				<form:form id="form" name="myForm" method="POST" action="${post_url}" onsubmit="return validateForm()" commandName="newAccount">
					<div class="modal-body">
						<table class="table table-bordered table-hover text-center">
							<tr>
								<td>Account name :</td>
								<td><form:input class="input form-control" path="name" id="name" name="name" /></td>
							</tr>
							<tr>
								<td>Account number:</td>
								<td><form:input class="input form-control" path="number" id="number" /></td>
							</tr>
							<tr>
								<td>Account currency :</td>
								<td><form:select class="input form-control" path="currency" id="currency">
										<form:options items="${dto.currencyList}" />
									</form:select></td>
							</tr>
							<tr>
								<td>Account institution :</td>
								<td><form:input class="input form-control" path="institution" id="institution" /></td>
							</tr>
							<tr>
								<td>Account address :</td>
								<td><form:input class="input form-control" path="address" id="address" /></td>
							</tr>
							<tr>
								<td>Account phone :</td>
								<td><form:input class="input form-control" path="phone" id="phone" /></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
						<input class="btn btn-primary" type="submit" value="Submit">
					</div>
				</form:form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.panel-body -->
</div>


