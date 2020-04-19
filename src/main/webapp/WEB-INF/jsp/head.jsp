<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="page" />


<link rel="stylesheet" type="text/css" href="webjars/bootstrap/4.1.1/css/bootstrap.min.css" />
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
<script type="text/javascript" src="webjars/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("a[id^=box]").click(function () {
            $("#spinner").modal();
            $("#spinner").css("visibility", "visible");
        });
    });
</script>