<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://thymeleaf.org">
<head>
<jsp:include page="/WEB-INF/jsp/head.jsp"></jsp:include>
<meta charset="UTF-8">
<title>CAT Example</title>
</head>
<body>
	<form action="login">
	<div class="container-fluid">
		<br>
		<br>
		<br>
		<br>
		<div class="row text-center">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 text-center">
				<div class="alert alert-info">
					<div class="row">
						<div class="col-sm-12 text-center">
							<div class="alert alert-primary">
							<h2>LOG IN</h2>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12">
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-sm-2">
									<label> User Name : </label>
								</div>
								<div class="col-sm-3">
									<input type="text" class="form-control form-control-sm" id="username"  name="username" value="" placeholder="User Name">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-sm-2">
									<label>Password : </label>
								</div>
								<div class="col-sm-3">
									<input type="password" class="form-control form-control-sm" id="password" name="password" value="" placeholder="Password">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-12 text-center">
									<button class="btn btn-info btn-sm" id="loginBtn"> Login </button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- <div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						<h2>LOG IN</h2>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-2">
						<label> User Name : </label>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control form-control-sm" id="username"  name="username" value="" placeholder="User Name">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<label>Password : </label>
					</div>
					<div class="col-sm-2">
						<input type="password" class="form-control form-control-sm" id="password" name="password" value="" placeholder="Password">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-sm-6 text-center">
						<button class="btn btn-info btn-sm" id="loginBtn"> Login </button>
					</div>
				</div>
			</div>
		</div> -->
	</div>
	</form>
</body>
</html>