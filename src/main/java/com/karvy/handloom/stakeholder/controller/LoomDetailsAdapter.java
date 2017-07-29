package com.karvy.handloom.stakeholder.controller;

import java.lang.reflect.Type;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.karvy.handloom.entity.LoomDetails;

public class LoomDetailsAdapter implements JsonSerializer<LoomDetails> {
	@Override
	public JsonElement serialize(LoomDetails loomDetails, Type type,
			JsonSerializationContext jsc) {
		// TODO Auto-generated method stub
		JsonObject jsonObject=new JsonObject();
		jsonObject.addProperty("name", loomDetails.getLdWeaverName());
		jsonObject.addProperty("aadharNo", loomDetails.getLdWeaverAadharNo());
		jsonObject.addProperty("address1", loomDetails.getHsAddress().getAddress1());
		jsonObject.addProperty("pincode", loomDetails.getHsAddress().getPincode());
		jsonObject.addProperty("districtId", loomDetails.getHsAddress().getAddressDistrictId());
		jsonObject.addProperty("mandalId", loomDetails.getHsAddress().getAddressMandalId());
		jsonObject.addProperty("villageId", loomDetails.getHsAddress().getAddressVillageId());
		jsonObject.addProperty("bankACNo", loomDetails.getHsBankDetails().getBdAccountNo());
		jsonObject.addProperty("bankId", loomDetails.getHsBankDetails().getBdBankId());
		jsonObject.addProperty("ifscCode", loomDetails.getHsBankDetails().getBdIFSCCode());
		return jsonObject;
	}

}
