<%@page import="in.ineuron.entity.User"%>
<%@page import="in.ineuron.entity.BookDtls"%>
<%@page import="java.util.List"%>
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
<title>All New Book</title>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<%
		User u = (User) session.getAttribute("userobj");
	%>
	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		</script>
		<c:if var="addCart" scope="session" test="" />

	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
				BookDaoImpl dao = new BookDaoImpl(DBconnect.getCon());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho mt-2">
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
							 <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
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