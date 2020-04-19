<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/head.jsp"></jsp:include>
<meta charset="UTF-8">
<title>No Authorized</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						<h2>No Authorized !!</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<a href="<%=request.getContextPath()%>/">กลับสู่หน้า Login</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>