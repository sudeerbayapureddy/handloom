package com.karvy.handloom.spring.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

// TODO: Auto-generated Javadoc
/**
 * The Class InwardAspect.
 */
@Aspect
@Component
public class ControllerLayerLoggingAspect {

	/** The Constant logger. */
	private static final Logger logger = LoggerFactory.getLogger(ControllerLayerLoggingAspect.class);
	
	/**
	 * Before enter method.
	 *
	 * @param joinPoint the join point
	 */
	@Before(value="execution(* com.karvy.handloom.*.controller.*.*(..))")
	public void beforeEnterMethod(JoinPoint joinPoint){
		logger.info("Before start controller layer of method {}",joinPoint.getSignature().getName());
	}
	
	/**
	 * After exit method.
	 *
	 * @param joinPoint the join point
	 */
	@After(value="execution(* com.karvy.handloom.*.controller.*.*(..))")
	public void afterExitMethod(JoinPoint joinPoint){
		logger.info("After exit controller layer of method {}",joinPoint.getSignature().getName());
	}
	
}
