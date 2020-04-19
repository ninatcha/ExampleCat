<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
 	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<%-- <c:url value="/WEB-INF/jsp/menu.jsp" var="jstlMenu" />
	<link href="${jstlCss}" rel="stylesheet" /> --%>
	
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/menu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 text-center">
				<br>
				<div class="row text-center">
					<div class="col-sm-2"></div>
					<div class="col-sm-8 text-center">
						<div class="alert alert-info">
							<div class="row">
								<div class="col-sm-12 text-center">
									<div class="alert alert-success">
									<h4>Personnel Information</h4>
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-4 text-center"></div>
								<div class="col-sm-2 text-left">
									<p>Name :</p>
								</div>
								<div class="col-sm-6 text-left">
									<p>Ninatcha Pabjanda</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 text-center"></div>
								<div class="col-sm-2 text-left">
									<p>Nick Name :</p>
								</div>
								<div class="col-sm-6 text-left">
									<p>Nat</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 text-center"></div>
								<div class="col-sm-2 text-left">
									<p>Age : </p>
								</div>
								<div class="col-sm-6 text-left">
									<p>28</p>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4 text-center"></div>
								<div class="col-sm-2 text-left">
									<p>Occupation : </p>
								</div>
								<div class="col-sm-6 text-left">
									<p>Java Programmer</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-sm-12 text-center">
				<footer class="footer">2020 Example CAT Create By Ninatcha Pabjanda.</footer>
			</div>
			
		</div>
	</div>
</body>

</html>