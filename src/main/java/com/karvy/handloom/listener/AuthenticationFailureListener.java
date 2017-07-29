package com.karvy.handloom.listener;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.stereotype.Component;

/**
 * @author sudeer.bayapureddy
 *
 */
@Component
public class AuthenticationFailureListener implements ApplicationListener<AuthenticationFailureBadCredentialsEvent> {

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationFailureListener.class);

	public void onApplicationEvent(AuthenticationFailureBadCredentialsEvent event) {
		InetAddress ip;
		try {
			ip = InetAddress.getLocalHost();
			Object userName = event.getAuthentication().getPrincipal();
			Object credentials = event.getAuthentication().getCredentials();
			logger.info("Failed login using USERNAME {}",userName);
			logger.info("Failed login using PASSWORD {}",credentials);
			logger.info("Failed login using from ipaddress {}",ip.getHostAddress());
		} catch (UnknownHostException e) {
			logger.info("UnknownHostException exception");
			e.printStackTrace();
		}

	}
}
