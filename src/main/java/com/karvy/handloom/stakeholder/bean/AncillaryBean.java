package com.karvy.handloom.stakeholder.bean;

import java.util.List;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class AncillaryBean {
	private Integer ldBarcode;
	private Integer ldId;
	private List<AncillaryWorkerDetailsBean> hsAncillaryWorkersMappings;
}
