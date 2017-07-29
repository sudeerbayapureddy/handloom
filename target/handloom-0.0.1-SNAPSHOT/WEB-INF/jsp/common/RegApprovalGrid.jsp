          <jsp:include page="../includes/includes.jsp"></jsp:include>   

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.dataTable tr th{
    background: #2c82c9;
    color: #fff;
}
.dataTable td{
font-weight: bold;
 padding: 8px 20px !important;
 color: black !important;
}

</style>
<script>
$(document).ready(function() {
    $('#grid').DataTable();
} );

</script>

<div class="content-page">
   <div class="content">
        <div class="container">
            <div class="row">
                   <div class="col-sm-12">
                       <h4 class="pull-left page-title">Welcome to Telangana Handlooms !</h4>
                       <ol class="breadcrumb pull-right">
                           <!--<li><a href="#">Telangana Handlooms</a></li>-->
                           <li class="active">Registration Approval </li>
                       </ol>
                   </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                       <div class="panel panel-default">
                          <div class="panel-heading">
                             <h4 class="panel-title">Registration Approval</h4>
                          </div>
                          <div class="panel-body">
                               <div class="row">
                                  <div class="col-md-12">
                                      <div class="table table-responsive">
                                         <table id="grid" class="table">
<col width="30px" />
<col width="30px" />
<col width="30px" />
<col width="30px" />
<col width="30px" />
<col width="30px" />
<col width="60px" />
<thead ><tr>
<th>Request No</th>
<th>Stakeholder Type</th>
<th>Stakeholder</th>
<th>Created</th>
<th>Approved</th>
<th>Approved By</th>
<th>Approval Status</th></tr>
</thead>
<tbody align="left">
<c:forEach  items="${approvalGridDetails}" var="approvalGridDetails">
<tr>
<td><a href="./regViewForm?shId=${approvalGridDetails.requestId}">${approvalGridDetails.requestNo}</a></td>
<td>${approvalGridDetails.stakeholderType}</td>
<td>${approvalGridDetails.stakeholderName}</td>
<td>${approvalGridDetails.submittedDate}</td>
<td>${approvalGridDetails.approvedDate}</td>
<td>${approvalGridDetails.approvedBy}</td>
<td>${approvalGridDetails.status}</td>
</tr></c:forEach>
</tbody>
</table> 
										  
										  
										  
										  
                                      </div>
                                  </div>
                               </div>
                          </div>
                       </div>
                  </div>
               </div>
               
        </div>
   </div>
</div>
