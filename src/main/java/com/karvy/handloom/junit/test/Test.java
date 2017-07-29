/**
 * 
 */
package com.karvy.handloom.junit.test;

/**
 * @author sudeer.bayapureddy
 *
 */
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("test class");

		ToStringExample toStringExample = new ToStringExample();
		toStringExample.setId(1);
		toStringExample.setName("sudeer");
		toStringExample.setAddress("hyderabad");

		Parent parent = new Parent();
		parent.setParentCode("ParentCODE000001");
		parent.setParentId("ParentID123");
		parent.setToStringExample(toStringExample);

		System.out.println(parent.toString());

	}

}
