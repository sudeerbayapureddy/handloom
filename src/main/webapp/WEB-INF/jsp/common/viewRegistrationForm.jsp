 <jsp:include page="../includes/includes.jsp"></jsp:include>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> 
<style>
.ui-accordion-header-icon{
float:left;
}
</style>
<script>
$(document).ready(function(){
    $("#Approve").click(function(){
        $("#myModalApprove").modal("toggle");
    });
});
$(document).ready(function(){
    $("#Reject").click(function(){
        $("#myModalReject").modal("toggle");
    });
});

</script>


		<div class="content-page">
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<h4 class="pull-left page-title">Welcome to Telangana
								Handlooms !</h4>
							<ol class="breadcrumb pull-right">
								<!--<li><a href="#">Telangana Handlooms</a></li>-->
								<li class="active">Application Approval</li>
							</ol>
						</div>
					</div>
					<div class="row">
					<form:form action="" commandName="registrationApprovalView" name="registrationApprovalView">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">Registration Form Details</h4>
								</div>
								<div class="panel-body">
									<div class="row m-t-20">
											<div class="col-md-12">

												<div id="accordion" class="panel panel-primary">
													<div class="panel-heading">
														<h5 class="panel-title">Stack Holder</h5>
													</div>
													<div>
														<table class="table table-bordered">
															<tr>
																<td><label>Stakeholder Type</label></td>
																<td>${registrationApprovalView.stakeHolderType}</td>

																<td><label>Name</label></td>
																<td>${registrationApprovalView.stakeHolderName}</td>

															</tr>
															<tr>
																<td><label>Aadhaar Number</label></td>
																<td>${registrationApprovalView.stakeHolderAadharNo}</td>
																<td><label>Bank Account Number</label></td>
																<td>${registrationApprovalView.shAccountNo}</td>

															</tr>
															<tr>
																<td><label>Bank Name</label></td>
																<td>${registrationApprovalView.shBranchName}</td>
																<td><label>IFSC Code</label></td>
																<td>${registrationApprovalView.shBankIfsc}</td>

															</tr>
															<tr>
																<td><label>Address</label></td>
																<td>${registrationApprovalView.shAddress}</td>
																<td><label>District</label></td>
																<td>${registrationApprovalView.shDestrict}</td>

															</tr>
															<tr>
																<td><label>Mandal</label></td>
																<td>${registrationApprovalView.shMandal}</td>
																<td><label>Village:</label></td>
																<td>${registrationApprovalView.shVillage}</td>

															</tr>

															<tr>
																<td><label>Pincode</label></td>
																<td>${registrationApprovalView.shPincode}</td>
																<td></td>
																<td></td>
															</tr>
														</table>
													</div>
													<div class="panel-heading m-t-5">
														<h5 class="panel-title">Loom Details</h5>
													</div>

													<div>
														<table class="table table-bordered">
														<c:forEach  items="${registrationApprovalView.loomDetailsBeanList}" var="loomDetailsBeanList">
															<tr>
																<td><label>Loom Code</label></td>
																<td>${loomDetailsBeanList.loomBarcode}</td>

																<td><label>Yarn Type</label></td>
																<td>${loomDetailsBeanList.loomYarnType}</td>

															</tr>
															</c:forEach>
														</table>


													</div>
													<div class="panel-heading  m-t-5">
														<h5 class="panel-title">Ancilary Workers Details</h5>
													</div>
													<div>
														<table class="table table-bordered">
														<thead>
														<tr>
														<th><label>Ancillary Workers</label></th>
														<th><label>Aadhar Number</label></th>
														<th><label>Bank Name</label></th>
														<th><label>Bank Branch</label></th>
														<th><label>Bank Account Number</label></th>
														<th><label>IFSC code</label></th>
														</tr>
														</thead>
														<tbody>
										<c:forEach  items="${registrationApprovalView.ancillaryDetailsBean}" var="ancillaryDetailsBean">
														<tr>
														<td>${ancillaryDetailsBean.adName}</td>
														<td>${ancillaryDetailsBean.adAadharNo}</td>
														<td>${ancillaryDetailsBean.awBankName}</td>
														<td>${ancillaryDetailsBean.awBranchName}</td>
														<td>${ancillaryDetailsBean.awAccountNo}</td>
														<td>${ancillaryDetailsBean.awBankIfsc}</td>
														</tr></c:forEach>
														</tbody>
														</table>													

													</div>
													<div class="panel-heading  m-t-5">
														<h5 class="panel-title">Approval History</h5>
													</div>
													<div>
													<c:if test="${registrationApprovalView.stakeHolderStatus == 'Submitted'}">
													<sec:authorize access="!hasRole('Stakeholder')">
													<table class="table table-bordered">
														
														<tr><td><div align="center"><input type="button" id="Approve" value="Approve" style="background: #007fff;color: white">&nbsp;&nbsp;<input type="button" value="Reject" id="Reject" style="background: #007fff;color: white"></div></td></tr>	
                                                        														</table></sec:authorize>
                                                        														 </c:if>
                                                 <c:if test="${registrationApprovalView.stakeHolderStatus == 'Approved'}">
														 <table class="table table-bordered">
														 <col width="20px" />
    													<col width="20px" />
    													<col width="40px" />
    													<col width="40px" />
    												<thead >
																<tr >
																	<th align="left" style="text-align: left; font-weight: 700;">Approved Date</th>
																	<th align="left" style="text-align: left;font-weight: 700;">Approved By</th>
																	<th align="left" style="text-align: left;font-weight: 700;">Comments</th>
																	<th align="left" style="text-align: left;font-weight: 700;">Status</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.shRegApprovedRejectedDate}</td>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.shRegModifiedBy}</td>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.shRegComments}</td>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.stakeHolderStatus}</td>
																</tr>
																
															</tbody>

														</table> </c:if>
														 <c:if test="${registrationApprovalView.stakeHolderStatus == 'Rejected'}">
														 <table class="table table-bordered">
															<thead>
																<tr>
																	<th align="left" style="text-align: left; font-weight: 700;">Rejected Date</th>
																	<th align="left" style="text-align: left; font-weight: 700;">Rejected By</th>
																	<th align="left" style="text-align: left; font-weight: 700;"> Comments</th>
																	<th align="left" style="text-align: left; font-weight: 700;">Status</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.shRegApprovedRejectedDate}</td>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.shRegModifiedBy}</td>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.shRegComments}</td>
																	<td style="word-break:break-all;" align="left" valign="top" style="text-align: left;">${registrationApprovalView.stakeHolderStatus}</td>
																</tr>
																
															</tbody>

														</table> </c:if>
													</div>
												</div>

											</div>
										
									</div>
								</div>
							</div>
						</div>
						</form:form>
					</div>
				</div>
				<div class="modal fade" id="myModalApprove" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Approval Comments</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-12">
										<form class="form-horizontal" action="./regApprovalRejectComments" method="post">
											
												<div class="form-group">
													<div class="col-md-12">
														<textarea class="form-control" id="textarea" rows="5"
															name="comments" id="comments" ></textarea>
																<input type="hidden" id="stackholderId" name="stackholderId" value="${registrationApprovalView.stakeHolderId}"/>
															<input type="hidden" id="decision" name="decision" value="Approved"/>
													</div>
												</div>
												<div class="form-group pull-right">
													<div class="col-md-12 ">
											<input type="submit" class="btn btn-sm btn-primary" value="Submit">
											<button type="button" class="btn btn-sm btn-danger"
									data-dismiss="modal">Close</button>
													
													</div></div>
											
										</form>
									</div>
								</div>
							</div>
							
						
								
						
						</div>
					</div>
				</div>
				<div class="modal fade" id="myModalReject" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Reject Comments</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-12">
										<form class="form-horizontal" action="./regApprovalRejectComments" method="post">
											
												<div class="form-group">
													<div class="col-md-12">
														<textarea class="form-control" id="textarea" rows="5"
															name="comments" id="comments"></textarea>
															<input type="hidden" id="stackholderId" name="stackholderId" value="${registrationApprovalView.stakeHolderId}"/>
															<input type="hidden" id="decision" name="decision" value="Rejected"/>
													</div>
												</div>
												<div class="form-group pull-right">
													<div class="col-md-12 ">
													<input type="submit" class="btn btn-sm btn-primary" value="Submit">
								<button type="button" class="btn btn-sm btn-danger"
									data-dismiss="modal">Close</button>
													
													</div></div>
											
										</form>
									</div>
								</div>
							</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	
	<script>
		$(function() {
			$("#accordion").accordion();
		});
	</script>

