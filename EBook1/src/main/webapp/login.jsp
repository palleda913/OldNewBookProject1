<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Login</title>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp" %>
		<div class="conatiner p-2">
		<div class="row mt-2">
			<div class="col-md-3 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center md-2">Login</h4>
					
						<c:if test="${not empty failure }">
						<h5 class="text-center text-danger">${failure}</h5>
							<c:remove var="failure" scope="session"/>
						</c:if>
						<c:if test="${not empty success }">
						<h5 class="text-center text-success">${success}</h5>
							<c:remove var="failure" scope="session"/>
						</c:if>
						
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
						
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" required="required" name="password"
									>
							</div>
							
							<div class="text-center">
							
								<button type="submit" class="btn btn-primary">Login</button><br>
								<a href="register.jsp">Create account</a>
								
							</div>
							
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
</body>
</html>