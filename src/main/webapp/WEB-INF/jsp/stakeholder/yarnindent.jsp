      <jsp:include page="../includes/includes.jsp"></jsp:include>  
         <!--  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.js"></script> 
          <link rel="stylesheet" type="text/css" href="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ng-table/0.8.3/ng-table.min.js"></script>
       <link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
 <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.min.js"></script>
        -->
       
       
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
.dis_select  option:disabled {
    color: #ccc;
    font-weight: bold;
}



</style>
        
          <script>
$(document).ready(function() {

} );

</script>
          
           <script>
        var app=angular.module('app_Indent', []);
           app.controller('indentController',  function($scope,$http,$filter) {
        	   
        	  /*  $scope.gridDiv=false;
        	   $scope.formDiv=true;
 */
 
 $scope.stackHolderDetails={
		 stakeHolderType : '',  
		 stakeHolderName : '',
		 stakeHolderAadharNo : '',
		 shMandal : '',
		 shVillage : '',
		 shDestrict:'',
		 stakeHolderId:''
 }; 
        	  
 $scope.looms=[];
 $scope.indentsArray=[];
        	   
        	   console.log(  $scope.looms)
        	   $scope.getLoomdetails=function(element,index)
               {
        		  
        		   
        		   for(var i=0;i<$scope.looms.length;i++)
            	   {
        			  if($scope.looms[i].loomBarcode!=null || $scope.looms[i].loomBarcode!='')
            		   if($scope.looms[i].loomBarcode==element){
            			   $scope.looms[i].disabled="true"
            			  // $scope.looms.splice(i,1);	
           				}
            	   }
        		   console.log(index);
        		   console.log(  $scope.looms)
            	   $http({
                       method: 'GET',
                       url: 'getLoomdetails',
                       params: {loomId:element}
               }).then(function successCallback(response) {
             	  	console.log(response);
             	  	$scope.loomDetails=response.data;
             	  	console.log($scope.loomDetails);
             		$scope.hsYarnIndentDetails[index].yidSubsidyEligibilityQty=$scope.loomDetails.ldSubsidyEligibilityQty;
             	  	$scope.hsYarnIndentDetails[index].yarnType=$scope.loomDetails.ldYarnType;
             	  	//$scope.hsYarnIndentDetails[index].hsYarnIndentDetails=$scope.loomDetails.hsYarnIndentDetails;
             	  	console.log("details");
             	console.log($scope.hsYarnIndentDetails);
               
               }, function errorCallback(response) {
                     //return $scope.nextTab();
               });
      
            	   
            	   
               };
               
               $scope.getStakeHolderDetails=function()
               {
            	   $http({
                       method: 'GET',
                       url: 'getStakeHolderDetails',
                       async: false,
               }).then(function successCallback(response) {
             	  	console.log("stackholderDetails:::");
             	  	console.log(response);
             	  	if(response.data.stakeHolderStatus=='Approved'){
             	  		$scope.access="true";
             	  		var length=response.data.loomDetailsBeanList.length;
                 	  	for(var i=0;i<length;i++)
                 	   $scope.looms.push({
                 		  loomBarcode:response.data.loomDetailsBeanList[i].loomBarcode,
                 		  disabled:"false"
                 	   });
                 	  	console.log("Looms");
                 	  	console.log($scope.looms);
                 	  	
                 	  	
                 	  	$scope.stackHolderDetails.stakeHolderType =response.data.stakeHolderType ;  
                 	  	$scope.stackHolderDetails.stakeHolderName =response.data.stakeHolderName ;  
                 	  	$scope.stackHolderDetails.stakeHolderAadharNo =response.data.stakeHolderAadharNo ;  
                 	  	$scope.stackHolderDetails.shMandal =response.data.shMandal ;  
                 	  	$scope.stackHolderDetails.shVillage =response.data.shVillage ;  
                 	  	$scope.stackHolderDetails.shDestrict =response.data.shDestrict ;
                 	  	$scope.stackHolderDetails.stakeHolderId =response.data.stakeHolderId ;
                 	  	
                 	  return $scope.getIndentsGrid();
             	  	}
             	  	else{
             	  		//alert("Your Application is not yet Approved !!!!!!!!!");
             	  		$scope.access="false";
             	  	}
               
               }, function errorCallback(response) {
                     //return $scope.nextTab();
               });
               } 
               
               
               
               $scope.yarnIndent={
            		   yarnSHId : '',
            		   hsYarnIndentDetails : $scope.hsYarnIndentDetails		  
        	   }; 
               
               $scope.hsYarnIndentDetails =[{
            		   yidLoomBarcode :'',
        			   yidQuantity : '',
        			   yidSubsidyEligibilityQty : '',
        			   yarnType:''
        	  }];
               
               $scope.loomList=[{
           		
        	   }];
               $scope.addLoom =function(){
               	$scope.loomList.push({
               		name:''
               	});
               }
               
               $scope.addIntentRow = function(){
            	  
            	   $scope.indent={
            			   yidLoomBarcode :'',
            			   yidQuantity : '',
            			   yidSubsidyEligibilityQty : '' ,
            			   yarnType:''
            			   
            	   }
            	   $scope.hsYarnIndentDetails= $scope.hsYarnIndentDetails.concat($scope.indent)
               }
               
               $scope.removeChoice = function(index) {
           	    
      	         $scope.hsYarnIndentDetails.splice(index,1);
      	    };
               
               
               
               $scope.submitIndetDeailsForm=function(yarnIndentDetails)
               {
            	   
            	   console.log(yarnIndentDetails)
            	  $scope.gridDiv=false;
            	   $scope.formdiv=true; 
            	   $scope.shDiv=true; 
            	   
            	   $http({
                       method: 'POST',
                       url: 'saveIndents',
                       data:yarnIndentDetails
               }).then(function successCallback(response) {
             	  	console.log("stackholderDetails:::aftesave");
             	  	console.log(response);
             	 	if(response.data=="S")
             	 		{
             	 		$scope.hsYarnIndentDetails =[{
                 		   yidLoomBarcode :'',
             			   yidQuantity : '',
             			   yidSubsidyEligibilityQty : '',
             			   yarnType:''
             	  }];
             	 		
             	 		for(var i=0;i<$scope.looms.length;i++) 
              			   $scope.looms[i].disabled="false";
              			  
             	 			alert("Indent Created Successfully..!")
             	 		 $scope.getIndentsGrid();
             	 		}
             	  
               
               }, function errorCallback(response) {
                     //return $scope.nextTab();
               });
            	   
            	 
               } 
               
               $scope.getIndentsGrid=function()
               {
            	   $http({
                       method: 'GET',
                       url: 'getIndentsGrid',
               }).then(function successCallback(response) {
             	  	console.log("indentGrid:::aftesave");
             	  	console.log(response.data);
             	 
             	  	if(response.data !=null && response.data.length>0)
             	  		{
             	  	console.log("yid:::"+response.data[0].yarnIndentId);
             	  	console.log("yidDetails::::"+response.data[0].hsYarnIndentDetails.length);
             	  $scope.detailesIndent=response.data;
             	/*  $scope.tableParams = new ngTableParams({
            			page: 1,
            			count: 10
            			}, {
            				
            			total: $scope.detailesIndent.length,
            			
            			getData: function ($defer, params) {
            				$scope.data = params.sorting() ? $filter('orderBy')($scope.detailesIndent, params.orderBy()) : $scope.detailesIndent;
            				$scope.data = params.filter() ? $filter('filter')($scope.detailesIndent, params.filter()) : $scope.detailesIndent;
         				$scope.data = $scope.data.slice((params.page() - 1) * params.count(), params.page() * params.count());
         		
            			
            			$defer.resolve($scope.data);
            			}
            			}); */
            			var markup;
                     	for(var i=0;i<response.data.length;i++)
                     		{
        					var date1 = new Date(response.data[i].yarnIndentDate);
                     		markup+="<tr><td ><a onclick='getYarnIndentDetail("+response.data[i].yarnIndentId+")'>INDT00"+response.data[i].yarnIndentId+"</a></td>"
                     		markup+="<td>"+$.format.date(date1, "dd MMM,yyyy")+"</td>"
                     		markup+="<td>"+response.data[i].shName+"("+response.data[i].yarnSHId+")</td>"
                     		markup+="<td>"+response.data[i].totalQuantity+"</td>"
                     		markup+="<td>"+response.data[i].hsYarnIndentDetails.length+"</td>";
                     		markup+="<td>Pending</td></tr>"
                     		}
            			
             	 $("#indentGridTr").html(markup);
             	 
                 $('#grid').DataTable();
             	 
             	 
             	 
             	  		}
                
               }, function errorCallback(response) {
                     //return $scope.nextTab();
               });
            	   
               }
              /*  $scope.getYarnIndentDetail=function(indentId)
               {
            	   
            	   alert(indentId)
            	  $http({
                       method: 'GET',
                       url: 'getYarnIndentDetail',
                       params: {indentId:indentId }
               }).then(function successCallback(response) {
             	  	console.log("YarnIndentDetail:::aftesave");
             	  	console.log(response.data);
             	  $scope.indentYarnDetails=response.data;
             	
             	var markup;
             	
             	
             	for(var i=0;i<response.data.length;i++)
             		{
             		markup+="<tr><td>"+response.data[i].yidId+"</td>"
             		markup+="<td>"+response.data[i].yidLoomBarcode+"</td>"
             		markup+="<td>"+response.data[i].yarnType+"</td>"
             		markup+="<td>"+response.data[i].yidQuantity+"</td>"
             		markup+="<td>"+response.data[i].yidSubsidyEligibilityQty+"</td></tr>"
             		}
             	$("#popupresult").html(markup)
             	$("#indetpop").modal("toggle");
               }, function errorCallback(response) {
               });
            	   
               } */
               
              
               
           });
           
           function getYarnIndentDetail(indentId)
           {
        	   console.log(indentId);
        	   
        	   
        	 /* 
        	   $http({
                   method: 'GET',
                   url: 'getYarnIndentDetail',
                   params: {indentId:indentId }
           }).then(function successCallback(response) {
         	  	console.log("YarnIndentDetail:::aftesave");
         	  	console.log(response.data);
         	  $scope.indentYarnDetails=response.data;
         	
         	var markup;
         	
         	
         	for(var i=0;i<response.data.length;i++)
         		{
         		markup+="<tr><td>"+response.data[i].yidId+"</td>"
         		markup+="<td>"+response.data[i].yidLoomBarcode+"</td>"
         		markup+="<td>"+response.data[i].yarnType+"</td>"
         		markup+="<td>"+response.data[i].yidQuantity+"</td>"
         		markup+="<td>"+response.data[i].yidSubsidyEligibilityQty+"</td></tr>"
         		}
         	$("#popupresult").html(markup)
         	$("#indetpop").modal("toggle");
           }, function errorCallback(response) {
           }); */
        	   
           
           $.ajax({
       		type : "POST",
       		url : "getYarnIndentDetail?indentId=" + indentId,
       		dataType : 'text',
       		success : function(response) {

       			var queryObject = eval('(' + response + ')');
var markup;


	for(var i=0;i<queryObject.length;i++)
		{
		markup+="<tr><td>"+queryObject[i].yidId+"</td>"
		markup+="<td>"+queryObject[i].yidLoomBarcode+"</td>"
		markup+="<td>"+queryObject[i].yarnType+"</td>"
		markup+="<td>"+queryObject[i].yidQuantity+"</td>"
		markup+="<td>"+queryObject[i].yidSubsidyEligibilityQty+"</td></tr>"
		}
	$("#popupresult").html(markup)
	$("#indetpop").modal("toggle"); 
       		}
           });
           }
           
           </script>
         
           

            <div class="content-page"  >
                <div class="content">
                    <div class="container" ng-app="app_Indent" ng-controller="indentController" ng-cloak>
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="pull-left page-title">Welcome to Telangana Handlooms !</h4>
                                <ol class="breadcrumb pull-right">
                                    <!--<li><a href="#">Telangana Handlooms</a></li>-->
                                    <li class="active">Dashboard</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-md-12">
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">Yarn Indent </h4>
                                    </div>
                                    

                                 <div class="alert  alert-danger" id="msgdiv"  ng-show="access=='false'">

										<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
										<strong> Your Application is not yet Approved !!!!!!!!!</strong>
									</div>
                                    <div class="panel-body" ng-init="shDiv=true;formdiv=true;gridDiv=false;getStakeHolderDetails();" ng-show="access=='true'" >
                                         <div class="row">
                                              <div class="col-md-12" ng-hide="shDiv">
                                                 <form class="form-horizontal">
                                                    <fieldset>
                                                      <div class="row">
                                                         <div class="col-md-6">
                                                        <div class="form-group">
                                                              <label class="col-md-4 control-label" for="">Stake Holder</label>
                                                              <div class="col-md-7">
                                                                <label class="form-control">{{stackHolderDetails.stakeHolderType}}</label>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <label class="col-md-4 control-label" for="">Aadhaar Number</label>
                                                              <div class="col-md-7">
                                                               <label class="form-control">{{stackHolderDetails.stakeHolderAadharNo}}</label>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                              <label class="col-md-4 control-label" for="">District</label>
                                                              <div class="col-md-7">
                                                               <label class="form-control">{{stackHolderDetails.shDestrict}}</label>
                                                              </div>
                                                            </div>
                                                           
                                                            
                                                         </div>
                                                         <div class="col-md-6">
                                                          <div class="form-group">
                                                              <label class="col-md-4 control-label" for="">Mandal</label>
                                                              <div class="col-md-7">
                                                               <label class="form-control">{{stackHolderDetails.shMandal}}</label>
                                                              </div>
                                                            </div>
                                                         <div class="form-group">
                                                              <label class="col-md-4 control-label" for="">Village</label>
                                                              <div class="col-md-7">
                                                               <label class="form-control">{{stackHolderDetails.shVillage}}</label>
                                                              </div>
                                                            </div>
                                                           
                                                            <div class="form-group">
                                                              <label class="col-md-4 control-label" for="">Address</label>
                                                              <div class="col-md-7">
                                                               <label class="form-control">{{stackHolderDetails.shAddress}}</label>
                                                              </div>
                                                            </div>
                                                            
                                                            
                                                         </div>
                                                      </div>
                                                    </fieldset>
                                                 </form>
                                              </div>
                                              
                                              <div class="col-md-12" >
                                                 <div  ng-hide="formdiv">
                                                 <form name="indentFormData"  >
                                                 <div class="row">
                                                    <div class="col-md-12">
                                                      <div class="pull-right m-b-5">
                                                       <a href="#" class="btn btn-sm blue m-l-5" ng-click="addIntentRow()"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                                       <a href="#" class="btn btn-sm blue m-l-5" ng-click="shDiv=true;formdiv=true;gridDiv=false"><i class="fa fa-th-large" aria-hidden="true"></i></a>  
 		                                             </div>
                                                    </div>
                                                 </div>
                                                <div class="row">
                                                  <div class="col-md-12">
                                                      <div class="table table-responsive m-b-0">
                                                        <table class="table table-bordered m-b-0" >
                                                        <thead>
                                                          <tr>
                                                            <th>Loom Code</th>
                                                            <th>Type of Yarn</th>
                                                            <th>Indent Quantity</th>
                                                            <th>Subsidy Eligibility Quantity</th>
                                                            <td>Remove</td>
                                                          </tr>
                                                        </thead>
                                                        <tbody>
                                                          <tr ng-repeat="yarnDetails in hsYarnIndentDetails">
                                                            <td>
                                                            
                                                            
                                                           <!--  <select ng-model="hsYarnIndentDetails[$index].yidLoomBarcode"  
                                                            ng-options="loom as loom.loomBarcode disable when loom.disabled for loom in looms" ng-change="getLoomdetails(hsYarnIndentDetails[$index].yidLoomBarcode,$index)"></select>
                                                            --> 
                                                            
                                                           <select ng-model="hsYarnIndentDetails[$index].yidLoomBarcode"  ng-change="getLoomdetails(hsYarnIndentDetails[$index].yidLoomBarcode,$index)" class="form-control dis_select">
                                                            <option value="" ng-disabled="true" selected="selected">Select</option>   
                                                            <option ng-repeat="loom in looms track by loom.loomBarcode" value="{{loom.loomBarcode}}" ng-disabled="{{loom.disabled=='true'}}">{{loom.loomBarcode}}</option>
                                                            </select> 
                                                          <!--  <select class="form-control" ng-model="refDetails.employeeDetailsId"
											ng-options="value.name as value.id for value in looms track by id" ng-change="getLoomdetails({{refDetails.employeeDetailsId}})" required>
											
											</select> -->
                                                            </td>
                                                            <td ng-model="hsYarnIndentDetails[$index].ldYarnType">{{yarnDetails.yarnType}}</td>
                                                            <td><input type="text" class="form-control" ng-model="hsYarnIndentDetails[$index].yidQuantity"/></td>
                                                            <td ng-model="hsYarnIndentDetails[$index].yidSubsidyEligibilityQty">{{yarnDetails.yidSubsidyEligibilityQty}}</td>
                                                           
                                                            <td><button ng-click="removeChoice([$index])" class="btn btn-sm blue" value="Remove" ng-show="$index!=0 && hsYarnIndentDetails[$index].yidQuantity!=null">Remove</button></td>
                                                          </tr>
                                                        </tbody>
                                                      </table>
                                                   </div>
                                                  </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
	                                                  <hr />
	                                                  <div class="pull-right">
	                                                     <button id="button1id" name="button1id" class="btn btn-sm blue" ng-click="submitIndetDeailsForm(hsYarnIndentDetails)">Submit</button>
	                                                     <button id="button2id" name="button2id" class="btn btn-sm blue">Cancel</button>
	                                                  </div>
	                                                </div> 
                                                </div>
                                                </form> 
                                                       </div>
                                              </div>
                                              <div class="col-md-12" ng-hide="gridDiv">
                                                       <a href="#" class="pull-right btn btn-sm blue m-b-5" ng-click="shDiv=false;formdiv=false;gridDiv=true"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                                        <div class="table table-responsive m-b-0">
                                                           <table class="table table-bordered m-b-0" id="grid">
		                                                        <thead>
		                                                          <tr>
		                                                            <th>Indent Number</th>
		                                                            <th>Indent Raised On</th>
		                                                            <th>Indent Raised By</th>
		                                                            <th>Total Quantity</th>
		                                                            <th>No of Looms</th>
		                                                            <th>Status</th>
		                                                          </tr>
		                                                        </thead>
		                                                        <tbody id="indentGridTr">
		                                                        <!-- <tr ng-repeat="indent in detailesIndent track by $index">
		                                                        <td ng-model="indent[index].yarnIndentId">IND00{{indent.yarnIndentId}}</td>
		                                                        <td>{{indent.yarnIndentDate | date : mediumDate}}</td>
		                                                        <td>{{indent.shName}},{{indent.yarnSHId}}</td>
		                                                        <td>{{indent.totalQuantity}}</td>
		                                                        <td><a href="#"  ng-click="getYarnIndentDetail(detailesIndent[$index].yarnIndentId)">{{indent.hsYarnIndentDetails.length}}</a></td>
																<td>Pending</td>
		                                                        </tr> -->
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
        
        
        
                <div class="modal fade" id="indetpop">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Indent Details:</h4>
              </div>
              <div class="modal-body">
                <div class="table table-responsive">
                   <table class="table table-bordered m-b-0">
                                                        <thead>
                                                          <tr>
                                                            <th>Sno</th>
                                                            <th>BarCode</th>
                                                            <th>Type</th>
                                                            <th>Quantity(kg's)</th>
                                                            <th>Subsidy Eligibility(kg's)</th>
                                                          </tr>
                                                        </thead>
                                                        <tbody id="popupresult">
                                                       <!--  <tr ng-repeat="yarnIndent in indentYarnDetails"> -->
                                                        <tr>
                                                        <td></td>
                                                        <td>{{yarnIndent.yidLoomBarcode}}</td>
                                                        <td>Cotton</td>
                                                        <td>{{yarnIndent.yidQuantity}}</td>
                                                        <td>{{yarnIndent.yidSubsidyEligibilityQty}}</td>
                                                        </tr>
                                                        </tbody>
                                                       </table>
                </div>
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-sm blue pull-right m-t-10" data-dismiss="modal">Close</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
       