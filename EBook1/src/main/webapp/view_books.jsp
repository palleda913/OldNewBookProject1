<%@page import="in.ineuron.entity.BookDtls"%>
<%@page import="in.ineuron.dao.BookDaoImpl"%>
<%@page import="in.ineuron.db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view all books</title>
<%@include file="all_component/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
	BookDaoImpl dao = new BookDaoImpl(DBconnect.getCon());
	BookDtls b = dao.getBookById(bid);
	%>



	<div class="container p-3">
		<div class="row p-5">
			<div class="col-md-6 text center p-5 border bg-white">
				<img style="height: 100px; width: 100px"
					src="book/<%=b.getPhotoName()%>"><br>

				<h4>
					Book Name :<%=b.getBookname()%></h4>
				<h4>
					Author Name:<%=b.getAuthor()%></h4>
				<h4>
					Category Name:<%=b.getBookCategory()%></h4>


			</div>
			<div class="col-md-6 text center p-5 border bg-white">
				<h1><%=b.getBookname()%></h1>

				<%
					if ("Old".equals(b.getBookCategory())) {
				%>
				<h5>Contact to Seller</h5>
				<h5 class="text-primary">
					Email:<%=b.getEmail()%></h5>


				<%
					}
				%>
				<div class="row mt-2">
					<a href="" class="btn btn-primary">COD</a> <a href=""
						class="btn btn-danger ml-2">Return</a> <a href=""
						class="btn btn-danger ml-2">Free Delivary</a>


				</div>
				<%
					if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="row mt-2">
					<a href="index.jsp" class="btn btn-primary">Continue S</a> <a href=""
						class="btn btn-info ml-2">Price</a>


				</div>

				<%
					} else {
				%>
				<div class="row mt-2">
					<a href="" class="btn btn-primary">Add cart</a> <a href=""
						class="btn btn-info ml-2">Price</a>
				</div>


				<%
					}
				%>



			</div>
		</div>
	</div>
	</div>

</body>
</html>