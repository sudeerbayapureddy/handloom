/**
 * 
 */
package com.karvy.handloom.common.util;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author sudeer.bayapureddy
 *
 */
public class PseudoColumnsUtil {

	/** The Constant logger. */
	private static final Logger logger = LoggerFactory.getLogger(PseudoColumnsUtil.class);

	private PseudoColumnsUtil() {

	}

	public static void setPseudoColumnsValuesAtCreation(Object dynamicClassObject, String userName) {
		Class ftClass = dynamicClassObject.getClass();

		try {
			logger.info("setPseudoColumnsValuesAtCreation userName {}", userName);

			Field f1 = ftClass.getField("created_By");
			f1.set(dynamicClassObject, userName);

			Field f3 = ftClass.getField("created_Date");
			f3.set(dynamicClassObject, new java.util.Date());

			logger.info("setPseudoColumnsValuesAtCreation f1 f3 {} {}", f1, f3);
		} catch (Exception e) {
			logger.info("exception {}", e.getMessage());
			e.printStackTrace();
		}
	}

	public static void setPseudoColumnsValuesAtModification(Object dynamicClassObject, String userName) {
		Class ftClass = dynamicClassObject.getClass();

		try {
			logger.info("setPseudoColumnsValuesAtModification userName {}", userName);

			Field f2 = ftClass.getDeclaredField("modified_By");
			f2.set(dynamicClassObject, userName);

			Field f4 = ftClass.getDeclaredField("modified_Date");
			f4.set(dynamicClassObject, new java.util.Date());

			logger.info("setPseudoColumnsValuesAtModification f2 f4 {} {}", f2, f4);
		} catch (Exception e) {
			logger.info("exception {}", e.getMessage());
			e.printStackTrace();
		}
	}

}