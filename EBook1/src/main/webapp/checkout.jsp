<%@page import="java.util.List"%>
<%@page import="in.ineuron.entity.Cart"%>
<%@page import="in.ineuron.entity.User"%>
<%@page import="in.ineuron.db.DBconnect"%>
<%@page import="in.ineuron.dao.CartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout Page</title>
<%@include file="all_component/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>

	<c:if test="${not empty success }">
		<div>${success}</div>
			<c:remove var="success" scope="session"/>
	</c:if>
<c:if test="${not empty failure}">
		<div>${failure}</div>
			<c:remove var="failure" scope="session"/>
	</c:if>




	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">BookName</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									User u = (User) session.getAttribute("userobj");
								CartDaoImpl dao = new CartDaoImpl(DBconnect.getCon());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>"
										class="btn btn-danger"> Remove</a></td>
								</tr>


								<%
									}
								%>
								<tr>
									<th>TotalPrice</th>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>

			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" value="">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" id="inputEmail4"
										placeholder="Email">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Password">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input
										type="password" class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Model</label> <select class="form-control">
									<option>...select...</option>
									<option>Cash On Delivery</option>
									<option>UPI</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success"> Continue</a>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>