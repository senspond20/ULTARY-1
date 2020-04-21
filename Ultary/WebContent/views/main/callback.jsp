<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.parser.JSONParser" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "I5f2j4CStj0Q0BPbHYAM";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "HI1ukhWTvt";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8866/ULTARY/views/main/callback.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    
    try {
   //네이버 제공 코드 시작-------------------------------------------------------------
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
    
      BufferedReader br;
      //System.out.println("responseCode="+responseCode);
      
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      
      if(responseCode==200) { // 정상호출로 받아왔다면!
    	  out.println(res.toString());
      //System.out.println(res.toString());
   //네이버 제공 코드 끝 ------------------------------------------------------------- 	  
   // 네이버에서 받아온정보를 네이버 로그인으로 보낼것임.	     
		
        JSONParser parsing = new JSONParser();
   		Object obj = parsing.parse(res.toString());
   		JSONObject jsonObj = (JSONObject)obj;
   		
   		access_token =(String)jsonObj.get("access_token");
   		refresh_token = (String)jsonObj.get("refresh_token");
        
     	// 세션에 access_token(로그인시 개인정보)를 넣어준다.
        session.setAttribute("access_token", access_token);
        
        //그정보를 네이버로그인 서블릿으로 보내줌
        response.sendRedirect("/ULTARY/naverlogin.mem");
 
        
  //네이버 제공 코드 이하 ------------------------------------------------------------- 	  
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>
</html>