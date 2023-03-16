<%@page import="in.ineuron.db.DBconnect"%>
<%@page import="in.ineuron.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="in.ineuron.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Book</title>
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
	
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDaoImpl dao3 = new BookDaoImpl(DBconnect.getCon());
			List<BookDtls> list3 = dao3.getAllOldBook();
			for (BookDtls b : list3) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-4">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>


			<%
				}
			%>


		</div>
	</div>

</body>
</html>