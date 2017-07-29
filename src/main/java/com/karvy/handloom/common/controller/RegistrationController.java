/**
 * 
 */
package com.karvy.handloom.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.karvy.handloom.ad.service.ADApprovalFlowService;
import com.karvy.handloom.admin.bean.ADApprovalBean;
import com.karvy.handloom.admin.bean.RegistrationApprovalBean;
import com.karvy.handloom.constants.Constants_URLPath;

/**
 * @author ravi.banala
 *
 */

@Controller
public class RegistrationController {
	private static final Logger logger = LoggerFactory.getLogger(RegistrationController.class);
	
	@Autowired
	ADApprovalFlowService adApprovalFlowService;

	@RequestMapping(value=Constants_URLPath.REGAPPROVALGRID,method=RequestMethod.GET) 
	ModelAndView regApprovalGrid(HttpServletRequest request){
		logger.info("regApprovalGrid {}");
		List<ADApprovalBean> approvalGridDetails = adApprovalFlowService.getADGridDetails(request.getSession().getAttribute("uname").toString(),request.getSession().getAttribute("role").toString());
		return new ModelAndView("dashboardLayout/common/RegApprovalGrid","approvalGridDetails",approvalGridDetails);
	}
	@RequestMapping(value=Constants_URLPath.REGVIEWFORM,method=RequestMethod.GET) 
	ModelAndView regViewForm(HttpServletRequest request){
		RegistrationApprovalBean registrationApprovalView = adApprovalFlowService.registrationApprovalView(request.getParameter("shId"));
		return new ModelAndView("dashboardLayout/common/viewRegistrationForm","registrationApprovalView",registrationApprovalView);
	}
	
	@RequestMapping(value=Constants_URLPath.REGAPPROVALREJECTCOMMENTS,method=RequestMethod.POST) 
	ModelAndView regApprovalRejectComments(HttpServletRequest request){
		adApprovalFlowService.registrationApproval(request.getSession().getAttribute("uname").toString(), request.getSession().getAttribute("role").toString(), request.getParameter("stackholderId"), request.getParameter("decision"),request.getParameter("comments"));
		return new ModelAndView("redirect:"+"./regApprovalGrid");
	}
	
	
	
}
