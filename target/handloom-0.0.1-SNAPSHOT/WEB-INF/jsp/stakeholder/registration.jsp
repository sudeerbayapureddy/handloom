          <jsp:include page="../includes/includes.jsp"></jsp:include>   
	<style>
 .next-disabled {
 pointer-events:none;
 cursor:default;
}
</style>
          <script>
var app=angular.module('app_resg', []);
  app.controller('registrationCont', function($scope,$http) { 
	   $scope.stackHolderDetails={
			   shType : '',  
     		  shName : '',
     		  shAadharNo : '',
     			address1 : '',  
				pincode : '',
				addressDistrictId : '',
				addressMandalId : '',
				addressVillageId: '',
				 bdAccountNo :'',
				   bdBankId : '',
				   bdIFSCCode : '',
				   ancillaryBean:''
				  
     		 /*  hsAddress : $scope.address,
     		 hsBankDetails : $scope.bankDetails		 */  
	   }; 
	   
	   $scope.ancillaryList=[];
	   $scope.AncillaryWorkerDetail=[];
	   $scope.address ={
			   	address1 : '',  
				pincode : '',
				addressDistrictId : '',
				addressMandalId : '',
				addressVillageId: ''
	   }
	   
	  $scope.bankDetails ={
			   bdAccountNo :'',
			   bdBankId : '',
			   bdIFSCCode : ''
	  }
	   
	   $scope.loomList=[{
		
	   }];
	   
	  
	   $scope.loomList1=[];
	  console.log($scope.stackHolderDetails);
	  console.log($scope.loomList);
     $scope.myFunc = function(stackHolderDetails) {   
	console.log(stackHolderDetails);
    	/* $scope.AncillaryWorkerDetail.push({
    		awdName:'ABCD',
    		awdDesignation:'Weaver',
    		awdAadharNo:'123434555',
    		hsBankDetails:$scope.hsBankDetails
    		
    		
    	}); */
    	
     // alert($scope.stackHolderDetails.name);
    }; 
    $scope.ancillaryDesignation=['Master Weaver','Weaver','Designer','Worker'];
    $scope.addLoom =function(){
    	 /* $scope.loomList.push({
    		name:'',
    		hsAncillaryWorkersMappings:$scope.AncillaryWorkerDetail
    	});  */
    }
    
    $scope.removeChoice = function(index) {
     /* if($scope.loomList.length!= 1){
     
      $scope.loomList.splice(index,1);
     } */
     
   /*   if($scope.loomList1.length!= 1){ */
         $scope.loomList1.splice(index,1);
       /*  } */
    };
    


    $scope.addLoomTable =function(value){
    	if(angular.isUndefined(value) || value=='')
  			
  			alert("Please enter Loom Details");
    	
    	else
    	{
    	  $http({
              method: 'GET',
              url: 'getLoomdetails',
              params: {loomId:value },
      }).then(function successCallback(response) {
    	  	console.log(response);
    	  	if(response.data==null || response.data==""){
    	  		alert("BAR CODE NOT FOUND !!!!!!");
    	  		
    	  	}
    	  
    	  	else
    	  		{
    	  		if(angular.isUndefined(response.data.ldBarcode) || response.data.ldBarcode=='')
    	  			alert("BAR CODE NOT FOUND !!!!!!");
    	  		else
    	  		{
    	  			 var j=0;
     				var length=$scope.loomList1.length;
         	  		
         	  		if(length>0){
         	  			for(var i=0;i<length;i++){
         	  				if($scope.loomList1[i].ldBarcode==response.data.ldBarcode)
         	  					j=j+1;
         	  			}
         	  		}
         	  		
         	  		if(j==0){
         	  			
         	  			/* $scope.loomList.push({
             	    		name:'',
             	    		hsAncillaryWorkersMappings:$scope.AncillaryWorkerDetail
             	    	}); */
         	  			
         	  			$scope.AncillaryWorkerDetail=[];
             	  		$scope.AncillaryWorkerDetail.push({
             	  				awdName:response.data.ldWeaverName,
             	  	    		awdDesignation:'Weaver',
             	  	    		awdAadharNo:response.data.ldWeaverAadharNo,
             	  	    		bdIFSCCode:response.data.bdIFSCCode,
             	  	    		bdAccountNo:response.data.bdAccountNo,
             	  	    		bdBranchName:response.data.bdBranchName
             	  		});
             	  		
             	  		$scope.loomList1.push({
                 	  		ldBarcode:response.data.ldBarcode,
                 	  		ldYarnType:response.data.ldYarnType,
                 	  		ldWeaverName:response.data.ldWeaverName,
                 	  		ldWeaverAadharNo:response.data.ldWeaverAadharNo,
                 	  		ldLongitude:response.data.ldLongitude,
                 	  		ldLatitude:response.data.ldLatitude,
                 	  		ldId:response.data.ldId,
                 	  		hsAncillaryWorkersMappings:$scope.AncillaryWorkerDetail
                 	  	});
             	  		
             	  		$scope.loom.ldBarcode='';

     	  		}
         	  		
         	  		else
         	  			alert("Loom Details Already Captured");
    	  		}
    	  		   
        	  		    	  			
    	  			
    	  		
    	  		}
    	  		
      
      }, function errorCallback(response) {
            //return $scope.nextTab();
      });
    	
    	
    	}

    }
    
    
/*     $scope.addLoomTable =function(value){
    			
    	
    	  $http({
              method: 'GET',
              url: 'getLoomdetails',
              params: {loomId:value },
      }).then(function successCallback(response) {
    	  	console.log(response);
    	  	if(response.data==null || response.data==""){
    	  		alert("BAR CODE NOT FOUND !!!!!!");
    	  		
    	  	}
    	  
    	  	else
    	  		{
    	  		
    	  		$scope.loomList.push({
    	    		name:'',
    	    		hsAncillaryWorkersMappings:$scope.AncillaryWorkerDetail
    	    	});
    	  		
    	  		$scope.AncillaryWorkerDetail.push({
    	  				awdName:response.data.ldWeaverName,
    	  	    		awdDesignation:'',
    	  	    		awdAadharNo:'',
    	  	    		bdIFSCCode:'',
    	  	    		bdAccountNo:'',
    	  	    		bdBranchName:''
    	  		});
    	  		
    	  		$scope.loomList1.push({
        	  		ldBarcode:response.data.ldBarcode,
        	  		ldYarnType:response.data.ldYarnType,
        	  		ldWeaverName:response.data.ldWeaverName,
        	  		ldWeaverAadharNo:response.data.ldWeaverAadharNo,
        	  		ldLongitude:response.data.ldLongitude,
        	  		ldLatitude:response.data.ldLatitude,
        	  		ldId:response.data.ldId,
        	  		hsAncillaryWorkersMappings:$scope.AncillaryWorkerDetail
        	  	});
    	  			
    	  		
    	  		
    	  		}
      
      }, function errorCallback(response) {
            //return $scope.nextTab();
      });
    	
    	
    	

    } */
    
    $scope.addRow =function(index){	 
    	$scope.workers={
    			awdName:'',
        		awdDesignation:'',
        		awdAadharNo:'',
        		bdIFSCCode:'',
        		bdBranchName:'',
        		bdAccountNo:''
    	}
    	$scope.loomList1[index].hsAncillaryWorkersMappings=$scope.loomList1[index].hsAncillaryWorkersMappings.concat($scope.workers);    
    	  
    }
    
    $scope.removeRow=function(parentindex,index){
    	//$scope.loomList1[parentindex].hsAncillaryWorkersMappings[index]='';
    	if($scope.loomList1[parentindex].hsAncillaryWorkersMappings.length!= 1)
    	$scope.loomList1[parentindex].hsAncillaryWorkersMappings.splice(index,1);
    }
    
    $scope.saveWorkersDetails=function(loomList){
    	console.log(loomList);
    	
    	$scope.stackHolderDetails.ancillaryBean=loomList;
    	console.log($scope.stackHolderDetails);
    	
     	/*  $scope.details={
    			 stackHolderDetails:$scope.stackHolderDetails,
    			 loomDetails:loomList
  	   }; */
    	 console.log($scope.details);    	 
    	 
    	   $http({
               method: 'POST',
               headers: {
                       'Content-Type': 'application/json',
                       'Accept': 'application/json'
               },
               url: 'submitStakeHolderDetails',
               data : $scope.stackHolderDetails,
       }).then(function successCallback(response) {
      	    alert(response.data);
      	 
		}, function errorCallback(response) {
	              console.log("failure");
	       }); 
  }

    
    
    
    $scope.getBankDetails= function()
    {
           $http({
                   method: 'GET',
                   url: 'getBankDetails',
           }).then(function successCallback(response) {
         	  console.log(response.data);
        	  
                  $scope.bankDetailsList = response.data; 
        	 
           
           }, function errorCallback(response) {
                 //return $scope.nextTab();
           });
    
};

$scope.getDistrictDetails= function()
{
       $http({
               method: 'GET',
               url: 'getDistrictDetails',
       }).then(function successCallback(response) {
     	  console.log(response.data);
    	  
              $scope.districtDetails = response.data; 
    	 
       
       }, function errorCallback(response) {
             //return $scope.nextTab();
       });

};

$scope.getMandalDetails= function(districtId)
{
	 $http({
               method: 'GET',
               url: 'getMandalDetails?districtId='+districtId,
       }).then(function successCallback(response) {
     	  //	console.log(response);
    	  
              $scope.mandalDetails = response.data; 
    	 
       
       }, function errorCallback(response) {
             //return $scope.nextTab();
       }); 

};

$scope.getVillageDetails= function(mandalId)
{
	 $http({
               method: 'GET',
               url: 'getVillageDetails?mandalId='+mandalId,
       }).then(function successCallback(response) {
     	  //	console.log(response);
    	  
              $scope.villageDetails = response.data; 
    	 
       
       }, function errorCallback(response) {
             //return $scope.nextTab();
       }); 

};

$scope.getRegisteredDetails= function(aadharNo)
{
	if(aadharNo != null && aadharNo != ""){
	$http({
               method: 'GET',
               url: 'getRegisteredDetails?aadharNo='+aadharNo,
       }).then(function successCallback(response) {
     	  console.log(response.data);
    	  if(response.data == 'AE'){
    		  $("#stake_next").addClass("next-disabled");
    		      	 alert("Already Registered with this Aadhar No : "+aadharNo); 
    	  } else {
    		  if(response.data == null || response.data =='') {
    			  $("#stake_next").removeClass("next-disabled");
        	  } else {
        		  $("#stake_next").removeClass("next-disabled");
        		  //$scope.getDistrictDetails();
        		   $scope.getMandalDetails(response.data.districtId);
	             $scope.getVillageDetails(response.data.mandalId);
	              
	    		  $scope.stackHolderDetails.shName = response.data.ldWeaverName; 
	              $scope.stackHolderDetails.shAadharNo = response.data.ldWeaverAadharNo; 
	              $scope.stackHolderDetails.address1 = response.data.address1;
	              $scope.stackHolderDetails.pincode = response.data.pincode;
	              
	              $scope.stackHolderDetails.addressDistrictId = response.data.districtId;
	              $scope.stackHolderDetails.addressMandalId = response.data.mandalId;
	              $scope.stackHolderDetails.addressVillageId = response.data.villageId;
	              
	             // $scope.stackHolderDetails.hsAddress= $scope.address;
	             
	              
	              $scope.stackHolderDetails.bdAccountNo = response.data.bankACNo;
	              $scope.stackHolderDetails.bdBankId = response.data.bankId;
	              $scope.stackHolderDetails.bdIFSCCode = response.data.ifscCode; 
	              $scope.loomList1=[];
	              $scope.AncillaryWorkerDetail=[];
      	  		$scope.AncillaryWorkerDetail.push({
      	  				awdName:response.data.ldWeaverName,
      	  	    		awdDesignation:'Weaver',
      	  	    		awdAadharNo:response.data.ldWeaverAadharNo,
      	  	    		bdIFSCCode:response.data.ifscCode,
      	  	    		bdAccountNo:response.data.bankACNo,
      	  	    		bdBranchName:response.data.bankName
      	  		});
      	  		
      	  		$scope.loomList1.push({
          	  		ldBarcode:response.data.ldBarcode,
          	  		ldYarnType:response.data.ldYarnType,
          	  		ldWeaverName:response.data.ldWeaverName,
          	  		ldWeaverAadharNo:response.data.ldWeaverAadharNo,
          	  		ldLongitude:response.data.ldLongitude,
          	  		ldLatitude:response.data.ldLatitude,
          	  		ldId:response.data.ldId,
          	  		hsAncillaryWorkersMappings:$scope.AncillaryWorkerDetail
          	  	});
	            
	             
        	  }
    	  } 
       }, function errorCallback(response) {
             //return $scope.nextTab();
       }); 
	}

};


$scope.masterType=function(type){
	$scope.aadharLabel="false";
	$scope.regLabel="false";
	if(type=='MasterWeaver')
		$scope.aadharLabel="true";
	else
	$scope.regLabel="true";
}

$scope.getStackHolderDetails = function(){
	 $http({
         method: 'GET',
         url: 'checkRegistrationByUserId',
 }).then(function successCallback(response) {
	 console.log(response.data);
	 if(response.data=='S')
		 $scope.access="false";
	 else
		 $scope.access="true";
	console.log($scope.access);
 
 }, function errorCallback(response) {
       //return $scope.nextTab();
 }); 
}
    
  });

  </script>
                        
            <div class="content-page">
                <div class="content">
                    <div class="container" ng-controller="registrationCont" ng-app="app_resg" ng-cloak>
                
                    
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="pull-left page-title">Welcome to Telangana Handlooms !</h4>
                                <ol class="breadcrumb pull-right">
                                    <!--<li><a href="#">Telangana Handlooms</a></li>-->
                                    <li class="active">Application Submission</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-md-12">
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">Application Submission</h4>
                                    </div>
                                           
                                    <div class="panel-body">
                                         <div class="row">
                                            <div class="col-md-12">
                                                 <div class="alert  alert-danger" id="msgdiv"   ng-show="access=='false'">
													<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
													<strong> Application Already Submitted </strong>
												 </div> 
                                            </div>
                                         </div>
                                         <div class="row" ng-show="access=='true'">
                                              <div class="col-md-12">
                                                 <ul class="nav nav-tabs cat-tabs">
                                                    <li class="active"><a href="#tab1" data-toggle="tab">Stake Holder</a></li>
                                                    <li><a href="#tab2" data-toggle="tab">Loom Details</a></li>
                                                    <li><a href="#tab3" data-toggle="tab">Ancillary Workers</a></li>
                                                 </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane active form-box" id="tab1">
                                                        <div class="row m-t-20">
                                                              <div class="col-md-12">
                                                                 <form class="form-horizontal" name="basicDetails" ng-init="getStackHolderDetails();getBankDetails();getDistrictDetails();">
                                                                    <fieldset>
                                                                      <div class="row">
                                                                         <div class="col-md-6">
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Stakeholder Type<span class="required">*</span></label>
                                                                              <div class="col-md-7">
                                                                                <select id="selectbasic" name="shType" class="form-control" ng-model="stackHolderDetails.shType" required ng-change="masterType(stackHolderDetails.shType)">
                                                                                   <option value="">Select Type</option>
                                                                                  <option value="MasterWeaver">Master Weaver</option>
                                                                                  <option value="SHG">SHG</option>
                                                                                  <option value="Society">Society</option>
                                                                                  <option value="Tisco">Tisco</option>
                                                                                </select>
                                                                                <span class="red"  ng-show="basicDetails.shType.$error.required && basicDetails.shType.$dirty">Select Stack Holder Type</span>
                                                                             <!--  ng-disabled="!EmppersonaldetailsForm.$valid"--> </div>
                                                                            </div>
                                                                            <div class="form-group" ng-show="aadharLabel=='true'">
                                                                              <label class="col-md-4 control-label" for="" >Aadhaar Number<span class="required">*</span></label>
                                                                              
                                                                              <div class="col-md-7">
                                                                                <input id="textinput" name="aadhar" type="text"  placeholder="234556786543" class="form-control" ng-model="stackHolderDetails.shAadharNo" ng-blur="getRegisteredDetails(stackHolderDetails.shAadharNo);" required>
                                                                                <span class="red" ng-show="basicDetails.aadhar.$error.required && basicDetails.aadhar.$dirty">Enter Aadhar Number</span>
                                                                              </div>
                                                                            </div>
                                                                               <div class="form-group" ng-show="regLabel=='true'">
                                                                              <label class="col-md-4 control-label" for="" >Registration Number<span class="required">*</span></label>
                                                                              
                                                                              <div class="col-md-7">
                                                                                <input id="textinput" name="aadhar" type="text"  placeholder="234556786543" class="form-control" ng-model="stackHolderDetails.shAadharNo" ng-blur="getRegisteredDetails(stackHolderDetails.shAadharNo);" required>
                                                                                <span class="red" ng-show="basicDetails.aadhar.$error.required && basicDetails.aadhar.$dirty">Enter Aadhar Number</span>
                                                                              </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Name<span class="required">*</span></label>
                                                                              <div class="col-md-7">
                                                                                <input id="textinput" name="shname" type="text" placeholder="Rajesh Kumar" class="form-control" ng-model="stackHolderDetails.shName" required>
                                                                                <span class="red" ng-show="basicDetails.shname.$error.required && basicDetails.shname.$dirty">Enter Name</span>
                                                                              </div>
                                                                            </div>                                                                            
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Bank Account Number<span class="required">*</span></label>
                                                                              <div class="col-md-7">
                                                                                <input id="textinput" name="bankac" type="text" placeholder="67895432176" class="form-control" ng-model="stackHolderDetails.bdAccountNo" required>
                                                                              <span class="red" ng-show="basicDetails.bankac.$error.required && basicDetails.bankac.$dirty">Enter Bank A/C</span>
                                                                              
                                                                              </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Bank Name<span class="required">*</span></label>
                                                                             <!--  <div class="col-md-7">
                                                                                <input id="textinput" name="textinput" type="text" placeholder="HDFC Bank" class="form-control" ng-model="stackHolderDetails.bankName">
                                                                              </div> -->
                                                                              
                                                                              <div class="col-md-7">                                                                       
                                                                           
                                                                                 <select  name="" class="form-control" name="bankname" ng-model="stackHolderDetails.bdBankId" required>
                                                                                  <option value="" selected="selected">Select Bank</option>                                                                               
                                                                                  
                                                                                  <option ng-repeat="bank in bankDetailsList" value="{{bank.bankId}}" ng-selected="bank.bankId == stackHolderDetails.bdBankId">{{bank.bankName}}</option>
                                                                                </select> 
                                                                              <span class="red" ng-show="basicDetails.bankname.$error.required && basicDetails.bankname.$dirty">Enter Bank Name</span>
                                                                              </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">IFSC Code<span class="required">*</span></label>
                                                                              <div class="col-md-7">
                                                                                <input id="textinput" name="ifscCode" type="text" placeholder="HDFC0001" class="form-control" ng-model="stackHolderDetails.bdIFSCCode" required>
                                                                             	 <span class="red" ng-show="basicDetails.ifscCode.$error.required && basicDetails.ifscCode.$dirty">Enter IFSC Code</span>
                                                                              </div>
                                                                            </div>
                                                                            
                                                                         </div>
                                                                         <div class="col-md-6">
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Address<span class="required">*</span></label>
                                                                              <div class="col-md-7">
                                                                                <input id="textinput" name="address1" type="text" placeholder="Uppal, Medchal District, Telangana." class="form-control" ng-model="stackHolderDetails.address1" required>
                                                                              	<span class="red" ng-show="basicDetails.address1.$error.required && basicDetails.address1.$dirty">Enter Address</span>
                                                                              </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">District<span class="required">*</span></label>                                                                             
                                                                              
                                                                              <div class="col-md-7">
                                                                               <select id="district" name="district" class="form-control" ng-model="stackHolderDetails.addressDistrictId" 
                                                                                	ng-change="getMandalDetails(stackHolderDetails.addressDistrictId)" required>
                                                                                  <option value="" >Select District</option>                                                                                  
                                                                                  
                                                                                  <option ng-repeat="dist in districtDetails" value="{{dist.districtId}}" ng-selected="dist.districtId == stackHolderDetails.addressDistrictId">{{dist.districtName}}</option>
                                                                                </select> 
                                                                                <span class="red" ng-show="basicDetails.district.$error.required && basicDetails.district.$dirty">Select District</span>
                                                                                
                                                                              <!--   <select class="form-control" name=""
																			ng-model="stackHolderDetails.hsAddress.addressDistrictId"
																	ng-selected="{{value.districtId == stackHolderDetails.hsAddress.addressDistrictId}}"
												ng-options="value.districtId as value.districtName for (key, value) in districtDetails" required ng-change="getMandalDetails(stackHolderDetails.hsAddress.addressDistrictId)">


										</select> -->
                                                                               
                                                                              </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Mandal<span class="required">*</span></label>
                                                                              <!-- <div class="col-md-7">
                                                                                <input id="textinput" name="textinput" type="text" placeholder="Uppal" class="form-control" ng-model="stakeHolder.hsAddress.Address_Mandal_Id">
                                                                              </div> -->
                                                                              
                                                                              <div class="col-md-7">
                                                                              <!-- <select id="mandal" name="mandal" class="form-control" ng-model="stackHolderDetails.addressMandalId" 
                                                                                	ng-change="getVillageDetails(stackHolderDetails.addressMandalId)">
                                                                                  <option value="" disabled>Anywhere</option>
                                                                                	<option ng-repeat="mandal in mandalDetails" value="{{mandal.mandalId}}" ng-selected="mandal.mandalId == stackHolderDetails.addressMandalId">{{mandal.mandalName}}</option>
                                                                                </select>  -->
                                                                                
                                                                                 <select class="form-control" name="mandal"
																			ng-model="stackHolderDetails.addressMandalId"
																			ng-selected="{{value.mandalId == stackHolderDetails.addressMandalId}}"																			
																			ng-options="value.mandalId as value.mandalName for (key, value) in mandalDetails" ng-change="getVillageDetails(stackHolderDetails.addressMandalId)" required>
																			<option value="" disabled>Select Mandal</option>
																			</select>   
                                                                                <span class="red" ng-show="basicDetails.mandal.$error.required && basicDetails.mandal.$dirty">Select Mandal</span>
                                                                                
                                                                              </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Village</label>
                                                                            <!--   <div class="col-md-7">
                                                                                <input id="textinput" name="textinput" type="text" placeholder="Boduppal" class="form-control" ng-model="stakeHolder.hsAddress.addressVillageId">
                                                                              </div> -->
                                                                              
                                                                              <div class="col-md-7">
                                                                               <!--  <select id="village" name="" class="form-control" ng-model="stackHolderDetails.addressVillageId">
                                                                                  <option value="" >Select Village</option>
                                                                                  
                                                                                  <option ng-repeat="village in villageDetails" value="{{village.villageId}}" ng-selected="village.villageId == stackHolderDetails.addressVillageId">{{village.villageName}}</option>
                                                                                  
                                                                                 
                                                                                </select> -->
                                                                                
                                                                                <select class="form-control" name=""
																			ng-model="stackHolderDetails.addressVillageId"
																			ng-selected="{{value.villageId == stackHolderDetails.addressVillageId}}"
																			ng-options="value.villageId as value.villageName for (key, value) in villageDetails">
																			<option value="" disabled>Select Village</option>																			
																			</select> 
                                                                              </div>
                                                                            </div>
                                                                            
                                                                            <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">Pincode<span class="required">*</span></label>
                                                                              <div class="col-md-7">                                                                               
                                                                                <input id="textinput" name="pincode" type="text" placeholder="500039" class="form-control" ng-model="stackHolderDetails.pincode" required>
                                                                                <span class="red" ng-show="basicDetails.pincode.$error.required && basicDetails.pincode.$dirty">Enter PinCode</span>
                                                                              </div>
                                                                            </div>
                                                                            
                                                                            <!-- <div class="form-group">
                                                                              <label class="col-md-4 control-label" for="">No Of Looms</label>
                                                                              <div class="col-md-7">
                                                                                <input id="textinput" name="textinput" type="text" placeholder="2" class="form-control">
                                                                              </div>
                                                                            </div> -->
                                                                           
                                                                            
                                                                         </div>
                                                                      </div>
                                                                      <div class="row">
                                                                       <div class="col-md-12"><hr /></div>
                                                                       <div class="col-md-12">
                                                                         <div class="pull-right">
                                                                            <button class="btn btn-sm blue btnNext" ng-disabled="!basicDetails.$valid" ng-click="myFunc(stackHolderDetails)" id="stake_next">Next</button>
                                                                         </div>
                                                                       </div>
                                                                      </div>
                                                                    </fieldset>
                                                                 </form>
                                                              </div>
                                                         </div>
                                                    </div>
                                                    <div class="tab-pane form-box" id="tab2">
                                                      <div class="row m-t-20">
                                                         <div class="col-md-6 col-md-offset-3">
                                                             <form class="form-horizontal">
                                                             
                                                               <!--  <fieldset data-ng-repeat="loom in loomList"> -->
                                                                   <div class="add_loomcode">
                                                                       <div class="form-group">
                                                                      <label class="col-md-4 control-label" for="">Loom Bar Code</label>
                                                                      
                                                                      <div class="col-md-7">
                                                                        <input type="text" class="form-control" id="" ng-model="loom.ldBarcode"/>
                                                                      </div>                                                                    
                                                                       <div class="col-md-1 p-l-0"><button class="add_field_button btn blue btn-sm btn-small m-t-5" ng-click="addLoomTable(loom.ldBarcode)"><i class="fa fa-plus"></i></button></div>
                                                                   </div>
                                                                   </div>
                                                                  <!--  <div class="form-group">
                                                                      <label class="col-md-4 control-label" for="">Yarn Type</label>
                                                                      <div class="col-md-7">
                                                                        <select id="selectbasic" name="" class="form-control">
                                                                          <option value="0">Select</option>
                                                                          <option value="1">Cotton</option>
                                                                          <option value="2">Silk</option>
                                                                          <option value="3">Polyster</option>
                                                                          <option value="4">Linen</option>
                                                                        </select>
                                                                      </div>
                                                                   </div> -->
                                                                   <!-- <div class="form-group">
                                                                      <label class="col-md-4 control-label" for="">&nbsp;</label>
                                                                      <div class="col-md-7">
                                                                        <button id="button1id" name="button1id" class="btn btn-sm pink">Submit</button>
                                                                        <button id="button2id" name="button2id" class="btn btn-sm pink">Cancel</button>
                                                                      </div>
                                                                   </div> -->
                                                               <!--  </fieldset> -->
                                                             </form>
                                                         </div>
                                                      </div>
                                                      <div class="row m-t-10">
                                                         <div class="col-md-8 col-md-offset-2">
                                                            <div class="table table-responsive">
                                                                <table class="table table-bordered m-b-0">
                                                                    <thead>
                                                                      <tr>
                                                                        <th>Loom Code</th>
                                                                        <th>Yarn Type</th>
                                                                        <th>Weaver Name</th>
                                                                        <th>Weaver AadharNo</th>
                                                                        <th>Longitude</th>
                                                                        <th>Latitude</th>
                                                                        <th></th>
                                                                      </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                      <tr ng-repeat="loom in loomList1">
                                                                        <td>{{loom.ldBarcode}}</td>
                                                                      	<td>{{loom.ldYarnType}}</td>
                                                                      	<td>{{loom.ldWeaverName}}</td>
                                                                      	<td>{{loom.ldWeaverAadharNo}}</td>
                                                                      	<td>{{loom.ldLongitude}}</td>
                                                                      	<td>{{loom.ldLatitude}}</td>
                                                                      	<td><div class="col-md-1 p-l-0"><button class="btn blue btn-sm btn-small remove_field" ng-click="removeChoice($index)"><i class="fa fa-minus"></i></a></div></td>
                                                                      </tr>                                                                     
                                                                    </tbody>
                                                                  </table>
                                                             </div>
                                                         </div>
                                                      </div>
                                                       <div class="row">
                                                          <div class="col-md-12"><hr /></div>
                                                           <div class="col-md-12">
                                                             <div class="pull-right">
                                                                 <a class="btn btn-sm blue btnPrevious">Previous</a>
                                                                 <a class="btn btn-sm blue btnNext">Next</a>
                                                             </div>
                                                           </div>
                                                        </div> 
                                                    </div>
                                                    <div class="tab-pane form-box" id="tab3">
                                                        <div class="row">
                                                          <div class="col-md-12 m-t-10" ng-repeat="loom in loomList1">
                                                               <div class="row">
                                                                 <div class="col-md-8">
                                                                    <h4 class="bar-title">{{loom.ldBarcode}}</h4> 
                                                                    <hr class="colored">
                                                                 </div>
                                                                 <div class="col-md-4">
                                                                    <button class="pull-right add_field_button btn m-t-5 blue btn-sm btn-small" ng-click="addRow($index)"><i class="fa fa-plus" ></i></button>
                                                                 </div>
                                                               </div>
                                                                <div class="row">
                                                                   <div class="col-md-12">
                                                                        <div class="table table-responsive m-t-10">
                                                                  <form>
                                                                  
                                                                        <table class="table table-bordered">
                                                                        <thead>
                                                                          <tr>
                                                                            <!-- <th>S.No.</th> -->
                                                                            <th>Aadhaar Number</th>
                                                                            <th>Designation</th>
                                                                            <th>Name</th>
                                                                            <th>Bank Account Number</th>
                                                                            <th>Bank Name</th>
                                                                            <th>IFSC Code</th>
                                                                            <th>Action</th>
                                                                          <!--   <th>&nbsp;</th> -->
                                                                          </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                          <tr ng-repeat="ancillary in loom.hsAncillaryWorkersMappings track by $index" >
                                                                           <td><input type="text" id="" class="form-control" ng-model="loomList1[$parent.$index].hsAncillaryWorkersMappings[$index].awdAadharNo"/></td>
                       														<td>
                       														
                       														  <select class="form-control" ng-model="loomList1[$parent.$index].hsAncillaryWorkersMappings[$index].awdDesignation" 
							       ng-options="value as value for (key, value) in ancillaryDesignation" ng-selected="loomList1[$parent.$index].hsAncillaryWorkersMappings[$index].awdDesignation==value"></select>
				     
                       														
                       														
                       														
                       														
                       														</td>                   			
                                                                            <td><input type="text" id="" class="form-control" ng-model="loomList1[$parent.$index].hsAncillaryWorkersMappings[$index].awdName"/></td>
                                                                            
                                                                           
                                                                            <td><input type="text" id="" class="form-control" ng-model="loomList1[$parent.$index].hsAncillaryWorkersMappings[$index].bdAccountNo"/></td>
                                                                            <td><input type="text" id="" class="form-control" ng-model="loomList1[$parent.$index].hsAncillaryWorkersMappings[$index].bdBranchName"/></td>
                                                                            <td><input type="text" id="" class="form-control" ng-model="loomList1[$parent.$index].hsAncillaryWorkersMappings[$index].bdIFSCCode"/></td>
                                                                            <!-- <td width="90px"><button  ng-click="addRow($parent.$index)"><i class="fa fa-plus-circle fa-lg"></i></button></td> -->
                                                                             <td  width="40px"><button  class="btn blue btn-sm btn-small m-t-5 remove_field" ng-click="removeRow($parent.$index,$index)" ng-show="{{$index!=0}}"><i class="fa fa-minus"></i></button></td>
                                                                          </tr>
                                                                          
                                                                        </tbody>
                                                                      </table>
                                                            	</form>
                                                               
                                                                 </div>
                                                                   </div>
                                                                </div> 
                                                                 
                                                              </div>
                                                         </div>    
                                                       
                                                           <div class="row">
                                                               <div class="col-md-12"><hr /></div>
                                                               <div class="col-md-12">
                                                                 <div class="pull-right">
                                                                    <a class="btn btn-sm blue btnPrevious">Previous</a>
                                                                    <a class="btn btn-sm blue btnNext" ng-click="saveWorkersDetails(loomList1)">Submit</a>
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
                        </div>
                    </div>    
                </div> 

              
            </div>
      
        
        <script>
            var resizefunc = [];
        </script>      
		<script type="text/javascript">
            $(document).ready(function () {
                $('#example1').datepicker({
                    format: "dd/mm/yyyy"
                });
                $('#example2').datepicker({
                    format: "dd/mm/yyyy"
                }); 
            });
        </script>
        <script type="text/javascript">
            $('.btnNext').click(function(){
              $('.nav-tabs > .active').next('li').find('a').trigger('click');
            });
            $('.btnPrevious').click(function(){
              $('.nav-tabs > .active').prev('li').find('a').trigger('click');
            });
        </script>
        <script>
        /*    $(document).ready(function() {
				var max_fields      = 30; //maximum input boxes allowed
				var wrapper         = $(".add_loomcode"); //Fields wrapper
				var add_button      = $(".add_field_button"); //Add button ID
				
				var x = 1; //initlal text box count
				$(add_button).click(function(e){ //on add input button click
					e.preventDefault();
					if(x < max_fields){ //max input box allowed
						x++; //text box increment
						$(wrapper).append('<div class="form-group" id="div1"><label class="col-md-4 control-label">&nbsp;</label><div class="col-md-7"><input type="text" class="form-control" name="mytext[]"/></div><div class="col-md-1 p-l-0"><a href="#" class="btn btn-danger btn-sm btn-small remove_field"><i class="fa fa-minus-circle fa-lg"></i></a></div></div>'); //add input box
					}
				});
				
				$(wrapper).on("click",".remove_field", function(e){ //user click on remove text
					e.preventDefault(); $("#div1").remove(); x--;
				})
			}); */
        </script>   