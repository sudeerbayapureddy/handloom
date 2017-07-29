package com.karvy.handloom.common.util;

import java.util.Properties;

import org.springframework.stereotype.Service;

@Service
public class FileUtil {
	
	public static synchronized  String getInitialNumber(String initialNumebrKey) {
		Properties properties = new Properties();
		String initialNumber = null;
		try {
			properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("database.properties"));
			initialNumber = properties.getProperty(initialNumebrKey);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		properties.clear();
		return initialNumber;

	}

}
