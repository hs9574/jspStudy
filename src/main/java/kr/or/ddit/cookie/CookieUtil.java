package kr.or.ddit.cookie;

public class CookieUtil {
	/** 
	 * Method : getCookieValue
	 * 작성자 : PC24-PC
	 * 변경이력 : 
	 * @param cookieStr
	 * @param cookieName
	 * @return 
	 * Method 설명 : cookieStr에서 cookieName에 해당하는 쿠키 값을 조회 
	 */
	
	//cookieStr : userid=brown; rememberme=Y; test=testcookie
	//cookieName : userid, remembermo
	//return : brown, Y
	public static String getCookieValue(String cookieStr, String cookieName) {
		String[] cookies = cookieStr.split("; ");
		/*
		 * Map<String, String> map = new HashMap<>();
		 * 
		 * for(int i=0; i<cookies.length; i++) { map.put(cookies[i].substring(0,
		 * cookies[i].indexOf("=")), cookies[i].substring(cookies[i].indexOf("=")+1)); }
		 * 
		 * return map.get(cookieName);
		 */
		
		for(String cookiestr : cookies) {
			String[] a = cookiestr.split("=");
			
			if(a[0].equals(cookieName)) {
				return a[1];
			}
		}
		
		return "";
	}
}

