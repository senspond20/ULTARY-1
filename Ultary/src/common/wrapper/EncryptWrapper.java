package common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{
	// 기본생성자 필수
	public EncryptWrapper(HttpServletRequest request) {
		super(request); 
	}
	
	@Override
	public String getParameter(String name) {
		
		String value = "";
		
		// 회원가입, 로그인, 비밀번호 변경
		// joinUserPwd, userPwd, newPwd
		if(name != null && (name.equals("joinUserPwd") || name.equals("userPwd") || name.equals("newPwd"))) {
			value = getSha512(super.getParameter(name));
		} else {
			value = super.getParameter(name);
		}
		
		return value;
	}
	
	public static String getSha512(String userPwd) {
		// SHA-512 암호화 방식   ==>	Bcrypt보다 보안이 떨어짐
		String encPwd = null;
		
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes = userPwd.getBytes(Charset.forName("UTF-8"));
		md.update(bytes);
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		
		return encPwd;
	}

}
