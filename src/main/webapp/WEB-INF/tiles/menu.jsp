<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> 
 
 <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">
                    <div id="sidebar-menu">
                        <ul>
                            <li>
                                <a href="loginSuccess" class="waves-effect"><i class="fa fa-tachometer"></i><span> Dashboard </span></a>
                            </li>
							<sec:authorize access="hasRole('Stakeholder')">
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-pencil-square-o"></i><span> Application Registration </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="registration"><i class="fa fa-caret-right"></i>&nbsp;Application Submission</a></li>
<!--                                     <li><a href="#"><i class="fa fa-caret-right"></i>&nbsp;Application Approval</a></li> -->
                                    <li><a href="./regApprovalGrid"><i class="fa fa-caret-right"></i>&#160;Status</a></li>
                                 
                                </ul>
                            </li>
                            
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-snowflake-o"></i> Material Request </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="yarnindent"><i class="fa fa-caret-right"></i>&#160;Yarn Indent</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Yarn Receipt</a></li>
                                    <li><a href="product-info.html"><i class="fa fa-caret-right"></i>&#160;Product Information</a></li>
                                    <li><a href="subsidy-distribution.html"><i class="fa fa-caret-right"></i>&#160;Payment</a></li>
                                </ul>
                            </li>
                            </sec:authorize>
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-cog"></i><span> Setup &amp; Configuration </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Subsidy Slab</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Thrift Society</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Material Wastage</a></li>
                                </ul>
                            </li>
                              <sec:authorize access="hasRole('Admin')">
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-users"></i><span> Masters </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Applicants</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;AD's</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Bank Details</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Stake Holders</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Ancillary Details</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Bar Codes</a></li>
                                </ul>
                            </li>
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-wrench"></i><span> Utilities </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Role Creation</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;User Creation</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Manage Roles</a></li>
                                    <li><a href="#"><i class="fa fa-caret-right"></i>&#160;Log Details</a></li>
                                </ul>
                            </li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('AD')">
                             <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="fa fa-tasks" aria-hidden="true"></i><span>My Tasks </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="./regApprovalGrid"><i class="fa fa-caret-right"></i>&#160;Applications</a></li>
                                  <!--  <li><a href="#"></a></li>
                                    <li><a href="#"></a></li> -->
                                </ul>
                            </li>
                            </sec:authorize>
                           <!-- <li>
                                <a href="#" class="waves-effect"><i class="md md-event"></i><span> Calendar </span></a>
                            </li>-->
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>