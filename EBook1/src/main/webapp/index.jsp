<%@page import="in.ineuron.entity.User"%>
<%@page import="in.ineuron.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="in.ineuron.db.DBconnect"%>
<%@page import="in.ineuron.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: index</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	weight: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #dcdcde;
	"
}
</style>
</head>
<body style="background-color: #dcdcde;">
	<%
		User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center">
			<i class="fa-thin fa-book"></i> E-book Management System
		</h2>
	</div>




	<hr>
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
				BookDaoImpl dao2 = new BookDaoImpl(DBconnect.getCon());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho ">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
								if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-4">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>

						<%
							} else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>
							<%
								} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add Cart</a>

							<%
								}
							%>
							 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> 
								<a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>


						<%
							}
						%>
					</div>
				</div>
			</div>


			<%
				}
			%>


		</div>
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp" class="btn btn-info btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- end of the recent book -->
	<hr>

	<!-- start of new book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
				BookDaoImpl dao = new BookDaoImpl(DBconnect.getCon());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho ">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<%
								if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>
							<%
								} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add Cart</a>

							<%
								}
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>


			<%
				}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-info btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- end of the new book -->
	<hr>
	<!-- start of old book -->


	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
				BookDaoImpl dao3 = new BookDaoImpl(DBconnect.getCon());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list2) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho ">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-4">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>


			<%
				}
			%>
		</div>
		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-info btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- end of the old book -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>