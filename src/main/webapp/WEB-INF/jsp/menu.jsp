<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<%-- <jsp:include page="/WEB-INF/jsp/head.jsp"></jsp:include> --%>
<%@ include file="head.jsp" %>
<title>CAT Example</title>
</head>
<body>
	<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Example CAT </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%=request.getContextPath()%>/home">
          <i class="fa fa-home"></i>
          Home
          <span class="sr-only">(current)</span>
          </a>
      </li>
      <%-- <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/init">
          <i class="fa fa-address-card">
            <!-- <span class="badge badge-info">11</span> -->
          </i>
          Personnel Info
        </a>
      </li> --%>
      <li class="nav-item">
        <!-- <a class="nav-link disabled" href="#"> -->
        <a class="nav-link" href="<%=request.getContextPath()%>/packagea">
          <i class="fa fa-plus">
            <!-- <span class="badge badge-warning">11</span> -->
          </i>
          Add PACKAGE
        </a>
      </li>
      <li class="nav-item">
        <!-- <a class="nav-link disabled" href="#"> -->
        <a class="nav-link" href="<%=request.getContextPath()%>/view">
          <i class="fa fa-list-alt"></i>
          PACKAGE Detail
        </a>
      </li>
      <!-- <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-envelope-o">
            <span class="badge badge-primary">11</span>
          </i>
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
    </ul>
    <!-- <ul class="navbar-nav ">
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fa fa-bell">
            <span class="badge badge-danger">11</span>
          </i>
         	 แจ้งเตือน
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fa fa-globe">
            <span class="badge badge-success">11</span>
          </i>
          Test
        </a>
      </li>
    </ul> -->
   <!--  <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> -->
  </div>
</nav>
</body>
</html>