/**
 * 
 */
package com.karvy.handloom.common.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.StringTokenizer;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Service;

// TODO: Auto-generated Javadoc
/**
 * The Class StringUtil.
 *
 * @author sudeer.bayapureddy
 */
@Service
public final class StringUtil {

	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(StringUtil.class);

	/**
	 * Instantiates a new string util.
	 */
	private StringUtil() {

	}

	/**
	 * Gets the string length.
	 *
	 * @param string
	 *            the string
	 * @return the string length
	 */
	public static int getStringLength(String string) {
		logger.info("StringUtil getStringLength " + string);
		return string.length();
	}

	/**
	 * Gets the reverse of string.
	 *
	 * @param string
	 *            the string
	 * @return the reverse of string
	 */
	public static String getReverseOfString(String string) {
		logger.info("StringUtil getReverseOfString " + string);
		return (new StringBuffer(string)).reverse().toString();
	}

	/**
	 * Convert string to integer.
	 *
	 * @param string
	 *            the string
	 * @return the int
	 */
	public static int convertStringToInteger(String string) {
		logger.info("StringUtil convertStringToInteger " + string);
		return Integer.parseInt(string);
	}

	/**
	 * Check null value.
	 *
	 * @param object
	 *            the object
	 * @return true, if successful
	 */
	public static boolean checkNullValue(Object object) {
		logger.info("StringUtil checkNullValue " + object);
		boolean isnull = false;

		if (object != null) {
			isnull = true;
		}
		logger.info("StringUtil checkNullValue isnull " + isnull);
		return isnull;
	}

	/**
	 * removes NonAlphaCharacters.
	 *
	 * @param str
	 *            the str
	 * @return the string
	 */
	private static String removeNonAlphaCharacters(String str) {
		char[] chars = str.toCharArray();
		for (int i = 0; i < chars.length; i++) {
			char oldChar = chars[i];
			char newChar = oldChar;

			if ((oldChar == '-') || (oldChar == '/') || (oldChar == '\\') || (oldChar == '&') || (oldChar == '_')
					|| (oldChar == '+') || (oldChar == '=') || (oldChar == ':') || (oldChar == '.') || (oldChar == ',')
					|| (oldChar == '\'') || (oldChar == '*') || (oldChar == '|') || (oldChar == '(')
					|| (oldChar == ')')) {
				newChar = ' ';
			}
			chars[i] = newChar;
		}
		return new String(chars);
	}

	/**
	 * checks for null or null string.
	 *
	 * @param str
	 *            the str
	 * @return true, if is null or empty string
	 */
	public static boolean isNullOrEmptyString(String str) {
		return (null == str) || "".equals(str.trim());
	}

	/**
	 * Gets the not null string.
	 *
	 * @param str
	 *            the str
	 * @return the not null string
	 */
	public static String getNotNullString(String str) {
		return ((null == str) || "".equals(str.trim()) ? "" : str);
	}

	/**
	 * Checks if is not empty.
	 *
	 * @param string
	 *            the string
	 * @return true, if is not empty
	 */
	public static boolean isNotEmpty(String string) {
		return string != null && string.length() > 0;
	}

	/**
	 * Checks if is empty.
	 *
	 * @param string
	 *            the string
	 * @return true, if is empty
	 */
	public static boolean isEmpty(String string) {
		return string == null || string.length() == 0;
	}

	/**
	 * checks for string array contains all null in it.
	 *
	 * @param str
	 *            the str
	 * @return true, if is string array contains all null
	 */
	public static boolean isStringArrayContainsAllNull(String[] str) {
		int flag = 0;
		if (null != str) {
			for (int i = 0; i < str.length; i++) {
				if (str[i] != null) {
					flag = 1;
				}
			}
			return !(flag == 1);
		}
		return true;
	}

	/**
	 * compares 2 String Arrays.
	 *
	 * @param str1
	 *            the str 1
	 * @param str2
	 *            the str 2
	 * @return true, if successful
	 */
	public static boolean compareTwoStringArrays(String str1[], String str2[]) {
		int j = 0;
		Collections.sort(Arrays.asList(str1));
		Collections.sort(Arrays.asList(str2));

		if (str1.length == str2.length) {
			for (int i = 0; i < str1.length; i++) {
				if (!str1[i].equals(str2[j])) {
					j = 1;
					break;
				}
				j++;
			}
			return !(j == 1);
		}
		return false;
	}

	/**
	 * Split.
	 *
	 * @param str
	 *            the str
	 * @param delimiter
	 *            the delimiter
	 * @param considerSpaceAsToken
	 *            - StringTokenizer by default doesnot consider empty string as
	 *            a token. pass considerSpaceAsToken = true for empty string to
	 *            be considered as a token
	 * @return the string[]
	 */
	public static String[] split(String str, String delimiter, boolean considerSpaceAsToken) {
		if (null != str) {
			if (considerSpaceAsToken) {
				if (str.startsWith(delimiter)) {
					str = ' ' + delimiter;
				}

				if (str.endsWith(delimiter)) {
					str = str + ' ';
				}
				str = replaceAll(str, delimiter + delimiter, delimiter + ' ' + delimiter);
			}
			return split(str, delimiter);
		}

		return null;
	}

	/**
	 * splits the string with passed delimeter.
	 *
	 * @param str
	 *            the str
	 * @param delimiter
	 *            the delimiter
	 * @return String[]
	 */
	public static String[] split(String str, String delimiter) {
		if (str != null) {
			StringTokenizer tokenizer = new StringTokenizer(str, delimiter);
			String[] tokens = new String[tokenizer.countTokens()];
			int i = 0;
			while (tokenizer.hasMoreElements()) {
				tokens[i++] = tokenizer.nextToken();
			}
			return tokens;
		}
		return null;
	}

	/**
	 * Formats the number.
	 *
	 * @param zeroPadded
	 *            the zero padded
	 * @param width
	 *            the width
	 * @param value
	 *            the value
	 * @return the string
	 */
	final public static String format(boolean zeroPadded, int width, int value) {
		return format(zeroPadded, width, String.valueOf(value), true);
	}

	/**
	 * Formats the string.
	 *
	 * @param zeroPadded
	 *            the zero padded
	 * @param width
	 *            the width
	 * @param str
	 *            the str
	 * @return the string
	 */
	final public static String format(boolean zeroPadded, int width, String str) {
		return format(zeroPadded, width, str, false);
	}

	/**
	 * Formats.
	 *
	 * @param zeroPadded
	 *            the zero padded
	 * @param width
	 *            the width
	 * @param str
	 *            the str
	 * @param paddingInTheFront
	 *            the padding in the front
	 * @return the string
	 */
	final public static String format(boolean zeroPadded, int width, String str, boolean paddingInTheFront) {

		StringBuffer buffer = new StringBuffer(100);
		if (null != str && !"".equals(str)) {
			char paddingString = (zeroPadded ? '0' : ' ');

			if (!paddingInTheFront) {
				buffer.append(str.substring(Math.max(0, str.length() - width)));
			}

			for (int i = str.length(); i < width; i++) {
				buffer.append(paddingString);
			}

			if (paddingInTheFront) {
				buffer.append(str.substring(Math.max(0, str.length() - width)));
			}
		}
		return buffer.toString();
	}

	/**
	 * formats to float.
	 *
	 * @param width
	 *            the width
	 * @param value
	 *            the value
	 * @return the string
	 */
	final public static String formatToFloat(int width, int value) {
		return format(true, width, value) + ".00";
	}

	/**
	 * formats to float with zero padding.
	 *
	 * @param width
	 *            the width
	 * @param value
	 *            the value
	 * @return the string
	 */
	final public static String formatToFloatWithZeroPadding(int width, int value) {
		return format(true, width, value) + ".00";
	}

	/**
	 * formats to float without zero padding.
	 *
	 * @param width
	 *            the width
	 * @param value
	 *            the value
	 * @return the string
	 */
	final public static String formatToFloatWithoutZeroPadding(int width, int value) {
		return format(false, width, value) + ".00";
	}

	/**
	 * Formats.
	 *
	 * @param width
	 *            the width
	 * @param value
	 *            the value
	 * @return the string
	 */
	final public static String format(int width, int value) {
		return format(false, width, value);
	}

	/**
	 * Converts into upper case.
	 *
	 * @param value
	 *            the value
	 * @return the string
	 */
	public static String toUpperCase(String value) {
		if (value == null) {
			return null;
		}

		return value.toUpperCase();
	}

	/**
	 * Remove all spaces from the string passed as a parameter.
	 *
	 * @param str
	 *            the str
	 * @return the value without any spaces character
	 */
	public static String removeAllSpaces(String str) {
		int i = str.indexOf(' ');
		if (i == -1) {
			return str;
		}
		StringTokenizer tokens = new StringTokenizer(str, " ");

		StringBuffer buffer = new StringBuffer(100);
		while (tokens.hasMoreTokens()) {
			buffer.append(tokens.nextToken());
		}
		return buffer.toString();
	}

	/**
	 * Remove the unnecessary space characters from the string passed as a
	 * parameter.
	 * 
	 * Example: " aa aaa " --> "aa aaa"
	 * 
	 * Returns null if the parameter is null or if the trimed string is empty.
	 * 
	 * @param value
	 *            string to trim
	 * @return the value without any unnecessary space character
	 */
	public static String trimSpaces(String value) {
		int index = 0;
		char current = 0;
		boolean triming = true;
		boolean appending = false;
		StringBuffer buffer = null;
		if (value == null) {
			return null;
		}

		buffer = new StringBuffer(value.length());

		while (index < value.length()) {
			current = value.charAt(index);

			if (current == ' ') {
				triming = true;
			} else {
				if (triming && appending) {
					buffer.append(' ');
				}
				buffer.append(current);
				triming = false;
				appending = true;
			}
			++index;
		}

		if (buffer.length() == 0) {
			return null;
		}

		return buffer.toString();
	}

	/**
	 * removes space, removes NonAlphaCharacters, converts to lowercase.
	 *
	 * @param str
	 *            the str
	 * @return String
	 */
	public static String toSimpleString(String str) {
		String newStr = null;
		if (null == str) {
			return str;
		}
		newStr = str;
		newStr = newStr.toLowerCase();
		newStr = removeNonAlphaCharacters(newStr);
		newStr = newStr.trim();

		return newStr;
	}

	/**
	 * Removes the given suffix from String.
	 *
	 * @param value
	 *            the value
	 * @param suffix
	 *            the suffix
	 * @return String
	 */
	public static String removeSuffix(String value, String suffix) {
		int index = value.indexOf(suffix);
		return index < 0 ? value : value.substring(0, index);
	}

	/**
	 * Removes the given prefix from String.
	 *
	 * @param value
	 *            the value
	 * @param prefix
	 *            the prefix
	 * @return String
	 */
	public static String removePrefix(String value, String prefix) {
		return value.startsWith(prefix) ? value.substring(prefix.length()) : value;
	}

	/**
	 * replaces the string with passed value.
	 *
	 * @param str
	 *            the str
	 * @param replaceWhat
	 *            the replace what
	 * @param withWhat
	 *            the with what
	 * @return the string
	 */
	public static String replaceAll(String str, String replaceWhat, String withWhat) {
		if (null != str) {

			int foundAtIndex = str.indexOf(replaceWhat);

			while (foundAtIndex >= 0) {
				str = str.substring(0, foundAtIndex) + withWhat + str.substring(foundAtIndex + replaceWhat.length());
				foundAtIndex = str.indexOf(replaceWhat);
			}
		}
		return str;
	}

}
