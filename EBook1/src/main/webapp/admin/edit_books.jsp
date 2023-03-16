<%@page import="in.ineuron.entity.BookDtls"%>
<%@page import="in.ineuron.db.DBconnect"%>
<%@page import="in.ineuron.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin :add_books</title>
<%@include file="allCSS.jsp"%>
</head>
<body style="background-color:#f0f1f2">


	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						
						<c:if test="${not empty success }">
						<p class="text-center text-sucess">${success}</p>
							<c:remove var="success" scope="session"/>
						</c:if>
						<c:if test="${not empty failure }">
						<p class="text-center text-danger">${failure}</p>
							<c:remove var="success" scope="session"/>
						</c:if>
						
						<%
						int id =Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao=new BookDaoImpl(DBconnect.getCon());
						BookDtls b=dao.getBookById(id);
						%>
						
						<form action="../editbooks" method="post">
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value ="<%=b.getBookname() %>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value ="<%=b.getAuthor() %>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value ="<%=b.getPrice() %>">

							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Status</label> <select
									name="status" class="form-control" id="exampleInputEmail1">
									<% 
									if("Active".equals(b.getStatus())){
										%>
										<option value ="Active">Active</option>
										<option value ="Inactive">Inactive</option>
									
										<% 
									
									}else 
									{
										%>
										<option value ="Inactive">Inactive</option>
										<option value ="Active">Active</option>
									
										<% 
									}
									
									
									%>
									
									
									<option value ="active">Active</option>
									
									</select>

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname">

							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
<div style="margin-top: 380px">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>