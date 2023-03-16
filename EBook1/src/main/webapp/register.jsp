<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
	 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Register</title>
<%@include file="all_component/allCSS.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="conatiner p-2">
		<div class="row">
			<div class="col-md-3 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center md-2">Registration Page</h4>
					
						<c:if test="${not empty success }">
						<p class="text-center text-success">${sucesss }</p>
						<c:remove var="success" scope="session"/>
						</c:if>
						<c:if test="${not empty failure }">
						<p class="text-center text-danger">${failure }</p>
						<c:remove var="failure" scope="session"/>
						</c:if>
						
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name= "fname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Phone No</label> <input
									type="number" class="form-control" id="exampleInputPassword1" required="required" name="phno"
									>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" required="required" name="password"
									>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms & Conditions</label>
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="all_component/footer.jsp" %>

</body>
</html>