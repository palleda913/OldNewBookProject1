<%@page import="java.util.List"%>
<%@page import="in.ineuron.entity.BookDtls"%>
<%@page import="in.ineuron.db.DBconnect"%>
<%@page import="in.ineuron.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCSS.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h1 class="text-center">Hello Admin</h1>
	<c:if test="${not empty success }">
		<p class="text-center text-sucess">${success}</p>
		<c:remove var="success" scope="session" />
	</c:if>
	<c:if test="${not empty failure }">
		<p class="text-center text-danger">${failure}</p>
		<c:remove var="success" scope="session" />
	</c:if>
	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
				BookDaoImpl dao = new BookDaoImpl(DBconnect.getCon());
			List<BookDtls> list = dao.getAllBooks();
			for (BookDtls b : list) {
			%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary">Edit</a> <a
					href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>

			<%
				}
			%>





		</tbody>
	</table>
	<div style="margin-top: 380px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>