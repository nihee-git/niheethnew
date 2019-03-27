<%@include file="AdminHome.jsp"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title>Add Supplier</title>
<style>
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: black;
}

.tg td {
	font-family: calibri;
	font-size: 14px;
	font-weight: bold;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: calibri;
	font-size: 18px;
	font-weight: bold;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: midnightblue;
	background-color: lightgrey;
	text-align: center;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}
</style>
</head>
<body>
	<center>
		<form:form method="POST" action="addsup" modelAttribute="supplier">
			<h2>Add Supplier</h2>
			<table class="tg text-center">
				<c:if test="${!empty supplier.suppliername}">
					<tr>
						<td><form:label path="supplierid">ID</form:label></td>
						<td><form:input path="supplierid" readonly="true" size="8"
								disabled="true" /> <form:hidden path="supplierid" /></td>
					</tr>
				</c:if>
				<tr>
					<td><form:label path="suppliername">Supplier-Name:</form:label></td>
					<td><form:input path="suppliername" required="required" /></td>
				
				<tr>
					<c:if test="${empty supplier.suppliername}">
						<td><input type="submit" value="Submit"
							style="font-size: 15px;" /></td>
						<td><input type="reset" value="Cancel"
							style="font-size: 15px" /></td>
					</c:if>
					<c:if test="${!empty supplier.suppliername}">
						<td><input type="submit" value="Edit Supplier" /></td>
					</c:if>
				</tr>
			</table>
		</form:form>

		<br> <br>

		<h2>Supplier List</h2>
		<c:if test="${!empty supplierList}">
			<table class="tg text-center" style="align: center;">
				<tr>
					<th>Supplier Id</th>
					<th>Supplier Name</th>
					<th>Location</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>

				<c:forEach items="${supplierList}" var="supplier">
					<tr>
						<td>${supplier.supplierid}</td>
						<td>${supplier.suppliername}</td>
						
						<td><a
							href="<c:url value='editsupplier${supplier.supplierid}'/>">Edit</a></td>
						<td><a
							href="<c:url value='deletesupplier${supplier.supplierid}'/>">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<a href="AdminHome">Back</a>