package com.karvy.handloom.admin.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ADApprovalBean {

	String requestNo;
	Integer requestId;
	String stakeholderType;
	String stakeholderName;
	String status;
	Date submitted;
	Date approved;
	String submittedBy;
	String approvedBy;
	String submittedDate;
	String approvedDate;
}
