package com.karvy.handloom.common.util;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.karvy.handloom.constants.Constants_URLPath;

@Service
public class CaptchaUtil {

	private static final Logger logger = LoggerFactory.getLogger(CaptchaUtil.class);

	public Map<String, String> genarateCaptcha(HttpServletRequest request) {
		String CaptchaImage = new String();
		Map map = new HashMap<String, String>();
		try {

			String serverPath = request.getSession().getServletContext()
					.getRealPath(Constants_URLPath.CAPTCHA_IMAGE_PATH);
			final BufferedImage image = ImageIO.read(new File(serverPath));
			Graphics g = image.getGraphics();
			g.setFont(g.getFont().deriveFont(40f));
			g.setColor(Color.BLACK);
			String str = RandomStringUtils.randomAlphanumeric(4);
			request.getSession().setAttribute("Captcha", str);
			map.put("CaptchaString", str);

			g.drawString(str, 10, 30);
			g.dispose();
			logger.info("CaptchaUtil in captcha1 {}", str);

			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			ImageIO.write(image, "PNG", outputStream);
			byte[] imageInByteArray = outputStream.toByteArray();
			CaptchaImage = "data:image/jpg;base64," + DatatypeConverter.printBase64Binary(imageInByteArray);

			map.put("CaptchaImage", CaptchaImage);

			outputStream.close();

		} catch (Exception exception) {
			logger.info("CaptchaUtil in captcha1 exception {}", exception.getMessage());
		}
		return map;

	}

}
