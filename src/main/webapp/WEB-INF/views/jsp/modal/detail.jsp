<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="<c:url value = "/resources/js/my.js"/>"></script>
<div class="panel panel-default mypanel1" style="float: left">
	<div class="panel-heading">Your Accounts</div>
	<div class="panel-body">
		<a href="#myAcc" data-toggle="modal">
			<div class="panel panel-info">
				<div class="panel-heading">Add new</div>
			</div>
		</a>
		<c:forEach items="${dto.listAccount}" var="account">
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
			<i><b>${dto.account.name}</b></i> <span></span>
		</h3>
		<!-- Nav tabs -->
		<c:if test="${dto.account.id!=null}">
			<ul class="nav nav-tabs">
				<li><a href="<spring:url value="/account/transaction/id=${dto.account.id}" />">Transaction</a></li>
				<li class="active"><a href="<spring:url value="/account/detail/id=${dto.account.id}" />">Detail</a></li>
				<li><a href="<spring:url value="/account/summary/id=${dto.account.id}" />">Summary</a></li>
				<li><a href="<spring:url value="/account/notes/id=${dto.account.id}" />">Notes</a></li>
			</ul>
		</c:if>
		<!-- Tab panes -->

		<div class="tab-content">
			<div class="tab-pane fade in active" id="Detail">
				<c:url var="post_url" value="/updateAccount" />

				<form:form id="form" name="myForm2" method="POST" action="${post_url}" onsubmit="return validateForm2()" commandName="oneAccount">
					<div class="modal-body">
						<table class="table table-bordered table-hover text-center">
							<tr>
								<td>Account id:</td>
								<td><form:input class="form-control" path="id" id="id" readonly="true" /></td>
							</tr>
							<tr>
								<td>Account name :</td>
								<td><form:input class="form-control" path="name" id="name" /></td>
							</tr>
							<tr>
								<td>Account number:</td>
								<td><form:input class="form-control" path="number" id="number" /></td>
							</tr>
							<tr>
								<td>Account currency :</td>
								<td><form:select class="input form-control" path="currency" id="currency">
										<form:options items="${dto.currencyList}" />
									</form:select></td>

							</tr>
							<tr>
								<td>Account institution :</td>
								<td><form:input class="form-control" path="institution" id="institution" /></td>
							</tr>
							<tr>
								<td>Account address :</td>
								<td><form:input class="form-control" path="address" id="address" /></td>
							</tr>
							<tr>
								<td>Account phone :</td>
								<td><form:input class="form-control" path="phone" id="phone" /></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<input type="button" class="button" value="Cancel" onclick="location.href='<spring:url value="/account/detail/id=${dto.account.id}" />'" /> <input
							class="btn btn-primary" type="submit" value="Submit">
					</div>
				</form:form>
				<c:if test="${updateAccount.id==null}">
				</c:if>
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
	<!-- /.modal -->
	<!-- /.panel-body -->
</div>


