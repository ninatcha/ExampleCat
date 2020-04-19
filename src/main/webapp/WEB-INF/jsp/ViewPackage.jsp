<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>CAT Example</title>
<%-- <jsp:include page="/WEB-INF/jsp/head.jsp"></jsp:include> --%>
<%@ include file="head.jsp" %>
<%@ include file="menu.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchDiv").hide();
		$("input:checkbox").on("change", function(){
            $(this).next().prop("disabled", !$(this).prop("checked"));
            $(".search_checkInput").val("");
            $("#searchDiv").hide();
   		 	$("#resultTbl tbody tr").remove();
          	$("#resultTbl tbody").empty();
            /* if($("input:checkbox").prop("checked") === false){
            	$("#searchAllBtn").attr("disabled", false);
            }else{
            	$("#searchAllBtn").prop("disabled", true);
            } */
            
        });
		
		$("#searchBtn").click(function() {
			 if (($("#search_packageName").val().trim() === "") && ($("#search_amount").val().trim() === "") && ($("#search_createDate").val().trim() === "")) {
				 $("#headerDialogAlert").html("กรุณากรอกข้อมูลการค้นหา !!");
	             $('#alertModal').modal('show');
	         }else {
	        	  $.ajax({
	                 url: '${pageContext.request.contextPath}/find',
	                 type: "post", async: false,
	                 data: {
	                	 packageName: $("#search_packageName").val(), amount: $("#search_amount").val(), createDate: $("#search_createDate").val()
	                 },
	                 success: function (result) {
	                	 if(result.dataList.length > 0){
	                		 drawTable(result);
	                	 }else{
	                		 alert("ไม่พบข้อมูล");
	                	 }
	                	 
	                 }
	             }); 
	         }
		});
		$("#searchAllBtn").click(function() {
			$.ajax({
	            url: '${pageContext.request.contextPath}/findAll',
	            type: "post", async: false,
	            success: function (result) {
	           	 if(result.dataList.length > 0){
	           		 drawTable(result);
	           	 }else{
	           		 alert("ไม่พบข้อมูล");
	           	 }
	           	 
	            }
	        }); 
		});
		
	});
	
	
	function deleteBtn(i){
		$.ajax({
            url: '${pageContext.request.contextPath}/delete',
            type: "post", async: false,
            data: {
           	 packageID: $("#p_id"+i).val()
            },
            success: function (result) {
            	if(result.message === "Delete success"){
            		alert(result.message);
            		searchAfter();
            	}else{
            		alert(result.message);
            	}
            	
            }
        });
	}
	function searchAfter(){
		$.ajax({
            url: '${pageContext.request.contextPath}/find',
            type: "post", async: false,
            data: {
           	 packageName: $("#search_packageName").val(), amount: $("#search_amount").val(), createDate: $("#search_createDate").val()
            },
            success: function (result) {
           	 drawTable(result);
            }
        }); 
	}
	
	function drawTable(result){
		$("#searchDiv").show();
		 $("#resultTbl tbody tr").remove();
       	 $("#resultTbl tbody").empty();
       	 var rows = "";
       	 for(var i=0; i< result.dataList.length; i++){
           		rows+="<tr>";
               		rows+="<td><input type='hidden' id='p_id"+i+"' value='"+result.dataList[i].packageId+"'>"+result.dataList[i].packageId+"</td>";
               		rows+="<td><input type='hidden' id='p_name"+i+"' value='"+result.dataList[i].packageName+"'>"+result.dataList[i].packageName+"</td>";
               		rows+="<td><input type='hidden' id='p_amount"+i+"' value='"+result.dataList[i].amount+"'>"+result.dataList[i].amount+"</td>";
               		rows+="<td><input type='hidden' id='p_createdate"+i+"' value='"+result.dataList[i].createDate+"'>"+result.dataList[i].createDate+"</td>";
               		rows+="<td><i class='fa fa-trash-o' aria-hidden'true' style='cursor:pointer; color:#ff0000' onclick='deleteBtn("+i+")'></i></td>";
           		rows+="</tr>";
       	 }
    	 $("#resultTbl tbody").append(rows);
	}
	
	function chk(id){
		if($("#"+id).prop("checked") === false){
        	$("#searchAllBtn").prop("disabled", false);
        }else{
        	$("#searchAllBtn").prop("disabled", true);
        }
	}
	
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<br>
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="alert alert-info">
							<div class="row">
								<div class="col-sm-12 text-left">
									<h4>Search And Delete Package</h4>
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
							<div class="col-sm-6" style="height: 40px;">
								<input type="checkbox" id="search_checkbox01" name="chk[]" value="1" onchange="chk(this.id)">
								Package Name :
								<input type="text" class="search_checkInput" id="search_packageName" value="" disabled="disabled" style="border-radius: 5px;">
								<br>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6" style="height: 40px;">
								<input type="checkbox" id="search_checkbox02" name="chk[]" value="2" onchange="chk(this.id)">
								Amount :
								<input type="text" class="search_checkInput" id="search_amount" value="" disabled="disabled" style="border-radius: 5px;">
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6" style="height: 40px;">
								<input type="checkbox" id="search_checkbox03" name="schk[]" value="3" onchange="chk(this.id)">
								Create Date :
								<input type="date"  class="search_checkInput" id="search_createDate" value="" style="border-radius: 5px;" disabled="disabled">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-6 text-center">
								<button class="btn btn-primary btn-sm" id="searchBtn"> Search </button>
								<button class="btn btn-info btn-sm" id="searchAllBtn"> Search All</button>
							</div>
						</div>
						
						<div class="row" id="searchDiv">
							<div class="col-sm-3"></div>
							<div class="col-sm-6 text-center">
								<br>
								<hr>
								<br>
								<table class="table table-bordered" id="resultTbl">
									<thead>
								      <tr>
								        <th>Package ID</th>
								        <th>Package Name</th>
								        <th>Amount</th>
								        <th>Create Date</th>
								        <th>Delete</th>
								      </tr>
								    </thead>
								    <tbody><tr></tr></tbody>
								</table>
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
</body>
</html>