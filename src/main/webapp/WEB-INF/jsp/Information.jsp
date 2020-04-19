<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/head.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Information</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#spinner").css("visibility", "hidden");    
		
		$("#saveBtn").click(function() {
			 if ($("#perNo").val().trim() === "") {
				 $("#headerDialogAlert").html("กรุณากรอกข้อมูล Personnel No !!");
                 $('#alertModal').modal('show');
             }else if ($("#empName").val().trim() === "") {
                 $("#headerDialogAlert").html("กรุณากรอกข้อมูล ชื่อ !! ");
                 $('#alertModal').modal('show');
             } else if ($("#empsurname").val().trim() === "") {
                 $("#headerDialogAlert").html("กรุณากรอกข้อมูล นามสกุล !!");
                 $('#alertModal').modal('show');
             }else if ($("#email").val().trim() === "") {
                 $("#headerDialogAlert").html("กรุณากรอกข้อมูล email !!");
                 $('#alertModal').modal('show');
             }else {
            	 $.ajax({
                     url: '${pageContext.request.contextPath}/save',
                     type: "post", async: false,
                     data: {
                    	 empName: $("#empName").val(), surname: $("#empsurname").val(), email: $("#email").val(), perID: $("#perNo").val()
                     },
                     success: function () {
                         search($("#holidayYear").val());
                         $('#modal1').modal('hide');
                     }
                 });
             }
		});
	});
	
	function search(persNo) {
        $.ajax({ 
            url: '${pageContext.request.contextPath}/fineByPersonnel',
            type: "post", data: {persNo: persNo},                   
            beforeSend: function () {
                $("#spinner").modal().css("visibility", "visible");
            },
            success: function (result) {
                //drawTable(result);
            },
            complete: function () {
                $("#spinner").modal('hide').css("visibility", "hidden");
            }
        });
    }
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/menu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						<h2>Information</h2>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-2">
						<label> Personnel No : </label>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control form-control-sm" id="perNo" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<label>ชื่อ  : </label>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control form-control-sm" id="empName" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<label>สกุล  : </label>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control form-control-sm" id="empsurname" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<label>Email : </label>
					</div>
					<div class="col-sm-2">
						<input type="text" class="form-control form-control-sm" id="email" value="">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 text-center">
						<button class="btn btn-success btn-sm" id="saveBtn"> Save </button>
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
	<footer class="footer">© Copyright 2020 , iKON.</footer>
</body>
</html>