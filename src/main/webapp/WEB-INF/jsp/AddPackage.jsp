<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp" %>
<%@ include file="menu.jsp" %>
<meta charset="UTF-8">
<title>CAT Example</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#spinner").css("visibility", "hidden");    
		
		$("#saveBtn").click(function() {
			 if ($("#packageID").val().trim() === "") {
				 $("#headerDialogAlert").html("กรุณากรอกข้อมูลPackage ID !!");
                 $('#alertModal').modal('show');
             }else if ($("#packageName").val().trim() === "") {
                 $("#headerDialogAlert").html("กรุณากรอกข้อมูล Package Name !! ");
                 $('#alertModal').modal('show');
             } else if ($("#amount").val().trim() === "") {
                 $("#headerDialogAlert").html("กรุณากรอกข้อมูล Amount !!");
                 $('#alertModal').modal('show');
             }else {
            	 $.ajax({
                     url: '${pageContext.request.contextPath}/insert',
                     type: "post", async: false,
                     data: {
                    	 packageID: $("#packageID").val(), packageName: $("#packageName").val(), amount: $("#amount").val()
                     },
                     success: function (result) {
                    	 if(result.message === "Insert success"){
                     		alert(result.message);
                     		$("#packageID").val("");
                     		$("#packageName").val("");
                     		$("#amount").val("");
                     	}else{
                     		alert(result.message);
                     	}
                     }
                 });
             }
		});
	});
</script>
</head>
<body>
	<%-- <jsp:include page="/WEB-INF/jsp/menu.jsp"></jsp:include> --%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="alert alert-info">
							<div class="row">
								<div class="col-sm-12 text-left">
									<h4>Add Package</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-2">
								<label> Package ID : </label>
							</div>
							<div class="col-sm-2">
								<input type="text" class="form-control form-control-sm" id="packageID" value="">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-2">
								<label>Page Name : </label>
							</div>
							<div class="col-sm-2">
								<input type="text" class="form-control form-control-sm" id="packageName" value="">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-2">
								<label>Amount :</label>
							</div>
							<div class="col-sm-2">
								<input type="text" class="form-control form-control-sm" id="amount" value="">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-12 text-center">
								<button class="btn btn-success btn-sm" id="saveBtn"> Save </button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="alertModal" role="dialog">
         <div class="modal-dialog">
             <div class="modal-content" style="">
                 <div class="modal-header">
                     <button type="button" id="close" class="close" data-dismiss="modal">&times;</button>
                     <h3 id="headerDialogAlert" class="heading"></h3>
                 </div>
                 <div class="modal-body">
                     <table id="criteria" style="width: 100%;" align="center">
                         <tr style="height: 50px; vertical-align: bottom">
                             <td colspan="2" style="text-align: center">
                                 <input type="button" value="OK" id="okBtn-confirm" class="btn btn-info btn-sm" data-dismiss="modal">
                             </td>
                         </tr>
                     </table>
                 </div>
             </div>
         </div>
     </div>
	</div>
	<!-- <footer class="footer">© Copyright 2020 , iKON.</footer> -->
</body>
</html>