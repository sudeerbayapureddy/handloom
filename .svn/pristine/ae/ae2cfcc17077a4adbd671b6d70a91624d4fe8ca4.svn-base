/**
 * 
 */
package com.karvy.handloom.stakeholder.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.karvy.handloom.ad.service.ADApprovalFlowService;
import com.karvy.handloom.admin.bean.ADApprovalBean;
import com.karvy.handloom.admin.bean.RegistrationApprovalBean;
import com.karvy.handloom.common.dto.IndentsDTO;
import com.karvy.handloom.common.dto.LoomDetailsDTO;
import com.karvy.handloom.common.dto.YarnIndentDetailDTO;
import com.karvy.handloom.entity.BankMaster;
import com.karvy.handloom.entity.DistrictsMaster;
import com.karvy.handloom.entity.LoomDetails;
import com.karvy.handloom.entity.MandalsMaster;
import com.karvy.handloom.entity.StakeHolder;
import com.karvy.handloom.entity.VillagesMaster;
import com.karvy.handloom.stakeholder.bean.StakeHolderBean;
import com.karvy.handloom.stakeholder.service.StakeHolderService;


/**
 * @author sateesh.jangam
 *
 */
@Controller
public class StakeHolderController {
	private static final Logger logger = LoggerFactory.getLogger(StakeHolderController.class);

	@Autowired
	private StakeHolderService stakeHolderService;
	
	@Autowired
	ADApprovalFlowService adApprovalFlowService;
	
	@RequestMapping(value = "{role}/yarnindent", method = RequestMethod.GET)
	public ModelAndView yarnindentPage(HttpServletRequest request) {
		
		logger.info("LoginController Enter into loginSuccessForDO GET");
		
		ModelAndView modelAndView = new ModelAndView("dashboardLayout/stakeholder/yarnindent");
		
		logger.info("LoginController loginSuccessForAll GET authUser {}",
				request.getSession().getAttribute("role").toString());
		
		return modelAndView;
	}
	@RequestMapping(value = "{role}/getLoomdetails", method = RequestMethod.GET)
	public @ResponseBody LoomDetailsDTO loomDetails(@RequestParam("loomId")String loomId,  HttpServletRequest request) throws JsonProcessingException {
	
		BigInteger bloomId=new BigInteger(loomId);
		LoomDetailsDTO ld=stakeHolderService.getLoomDetails(bloomId);
		return ld;
	}
	
	
	@RequestMapping(value = "{role}/getBankDetails", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String getBankDetails(
			HttpServletRequest request, Model model, ModelMap modelMap) throws JsonGenerationException, JsonMappingException, IOException {


		ObjectMapper mapper = new ObjectMapper();
		
		List<BankMaster> bankDetails = stakeHolderService.getBankMasterDetails();
		
		//mapper.writeValueAsString(bankDetails);
		//model.addAttribute("bankDetails",bankDetails);
		
		//mapper.setSerializationInclusion(Include.NON_NULL);
		//return mapper.writerWithDefaultPrettyPrinter().writeValueAsString(bankDetails);
			return mapper.writeValueAsString(bankDetails);
		} 
	
	
	@RequestMapping(value = "{role}/getDistrictDetails", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String getDistrictDetails(
			HttpServletRequest request, Model model, ModelMap modelMap) throws JsonGenerationException, JsonMappingException, IOException {

			ObjectMapper mapper = new ObjectMapper();		
			List<DistrictsMaster> distDetails = stakeHolderService.getDistrictDetails();
			return mapper.writeValueAsString(distDetails);
		} 
	
	
	@RequestMapping(value = "{role}/getMandalDetails", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String getMandalDetails(
			HttpServletRequest request, Model model, ModelMap modelMap, String districtId) throws JsonGenerationException, JsonMappingException, IOException {
			
			int distId = Integer.valueOf(districtId); 
			System.out.println(distId);
			ObjectMapper mapper = new ObjectMapper();		
			List<MandalsMaster> mandalDetails = stakeHolderService.getMandalDetails(distId);
			return mapper.writeValueAsString(mandalDetails);
		} 
	
	@RequestMapping(value = "{role}/getVillageDetails", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String getVillageDetails(
			HttpServletRequest request, Model model, ModelMap modelMap, String mandalId) throws JsonGenerationException, JsonMappingException, IOException {
			
			int manId = Integer.valueOf(mandalId); 
			System.out.println(manId);
			ObjectMapper mapper = new ObjectMapper();		
			List<VillagesMaster> villageDetails = stakeHolderService.getVillageDetails(manId);
			return mapper.writeValueAsString(villageDetails);
		} 
	
	
	@RequestMapping(value = "{role}/getRegisteredDetails", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String getRegisteredDetails(
			HttpServletRequest request, Model model, ModelMap modelMap, String aadharNo) throws JsonGenerationException, JsonMappingException, IOException {
			
			ObjectMapper mapper = new ObjectMapper();			 
			LoomDetailsDTO loomDetailsDTO = null;
			System.out.println(aadharNo);
			StakeHolder stakeHolder = stakeHolderService.checkAlreadyExist(aadharNo);
			if(stakeHolder == null){					
				LoomDetails loomDetails = stakeHolderService.getLoomDetailsByAadhar(aadharNo);				
				if(loomDetails != null) {	
					loomDetailsDTO = new LoomDetailsDTO();
					loomDetailsDTO.setLdWeaverName(loomDetails.getLdWeaverName());
					loomDetailsDTO.setLdWeaverAadharNo(loomDetails.getLdWeaverAadharNo());
					loomDetailsDTO.setAddress1(loomDetails.getHsAddress().getAddress1());
					loomDetailsDTO.setPincode(loomDetails.getHsAddress().getPincode());
					loomDetailsDTO.setDistrictId(loomDetails.getHsAddress().getAddressDistrictId());
					loomDetailsDTO.setMandalId(loomDetails.getHsAddress().getAddressMandalId());
					loomDetailsDTO.setVillageId(loomDetails.getHsAddress().getAddressVillageId());
					loomDetailsDTO.setBankACNo(loomDetails.getHsBankDetails().getBdAccountNo());
					loomDetailsDTO.setBankId(loomDetails.getHsBankDetails().getBdBankId());
					loomDetailsDTO.setIfscCode(loomDetails.getHsBankDetails().getBdIFSCCode());
					loomDetailsDTO.setLdId(loomDetails.getLdId());
					loomDetailsDTO.setLdBarcode(loomDetails.getLdBarcode());
					loomDetailsDTO.setLdLatitude(loomDetails.getLdLatitude());
					loomDetailsDTO.setLdLongitude(loomDetails.getLdLongitude());
					loomDetailsDTO.setLdYarnType(loomDetails.getLdYarnType());
					loomDetailsDTO.setBankName(loomDetails.getHsBankDetails().getBdBranchName());
					
				} 
			} else {
				return mapper.writeValueAsString("AE");
			}
			return mapper.writeValueAsString(loomDetailsDTO);
			
			
			
			/*GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.registerTypeAdapter(LoomDetails.class,new LoomDetailsAdapter()).create();
			String jsonNames = gson.toJson(loomDetails);
			java.lang.reflect.Type listType = new TypeToken<LoomDetails>() {
			}.getType();
			LoomDetails yourClassList = new Gson().fromJson(jsonNames,
					listType);
			return mapper.writeValueAsString(yourClassList);*/
			
		} 
	@RequestMapping(value = "{role}/getStakeHolderDetails", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody RegistrationApprovalBean getStakeHolderDetails(
			HttpServletRequest request, Model model, ModelMap modelMap, String aadharNo) throws JsonGenerationException, JsonMappingException, IOException {
		ADApprovalBean adbean=adApprovalFlowService.getADGridDetails(request.getSession().getAttribute("email").toString(),request.getSession().getAttribute("role").toString()).get(0);
		
		RegistrationApprovalBean registrationApprovalBean = adApprovalFlowService.registrationApprovalView(String.valueOf(adbean.getRequestId()));
		request.getSession().setAttribute("Sh_Id", registrationApprovalBean.getStakeHolderId()+"_"+registrationApprovalBean.getStakeHolderName());
		return registrationApprovalBean;
		
	} 
	@RequestMapping(value = "{role}/saveIndents", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String  saveIndents(@RequestBody List<YarnIndentDetailDTO> indetsList,
			HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		//RegistrationApprovalBean registrationApprovalBean= stakeHolderService.getStakeHolderDetails(26);
		
		String status=stakeHolderService.saveIndentDetails(indetsList,request);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(status);
		
	} 
	@RequestMapping(value = "{role}/getIndentsGrid", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody List<IndentsDTO> getIndentsGrid(
			HttpServletRequest request, Model model, ModelMap modelMap, String aadharNo) throws JsonGenerationException, JsonMappingException, IOException {
		List<IndentsDTO> indentsList=stakeHolderService.getIndentList(1,request);
		System.out.println(indentsList.size());
		return indentsList;
		
	} 
	@RequestMapping(value = "{role}/getYarnIndentDetail", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody List<YarnIndentDetailDTO> getYarnIndentDetail(@RequestParam("indentId") String indentId,
			HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		List<YarnIndentDetailDTO> indentsList=stakeHolderService.getYarnIndentDetail(indentId,request);
		System.out.println(indentsList.size());
		return indentsList;
		
	} 


	@RequestMapping(value = "{role}/submitStakeHolderDetails", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String submitStakeHolderDetails(@RequestBody StakeHolderBean stakeHolderBean,  HttpServletRequest request) throws JsonProcessingException {
		String uname = request.getSession().getAttribute("uname").toString();
		stakeHolderBean.setUname(uname);
		String status=stakeHolderService.submitStakeHolderDetails(stakeHolderBean);
		String statusMsg = status;
		if(status.equals("S")){
			statusMsg = " Application Registered Successfully";
		} else {
			statusMsg = " Error while Registering Application";
		}
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(statusMsg);
	}
	
	@RequestMapping(value = "{role}/checkRegistrationByUserId", method = { RequestMethod.POST,
			RequestMethod.GET },headers = "Accept=application/json")
	public @ResponseBody String checkRegistrationByUserId(HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		String uname = request.getSession().getAttribute("uname").toString();
		String status = stakeHolderService.checkRegistrationByUserId(uname);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(status);
		} 
}
