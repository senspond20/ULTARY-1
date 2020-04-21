package member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import member.model.service.MemberService;
import member.model.vo.Member;



/**
 * Servlet implementation class NaverCallback
 */
@WebServlet("/naverlogin.mem")
public class NaverLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 네이버 로그인에서 받아온 정보 처리 컨트롤러
		HttpSession session = request.getSession(); 
		
		// 네이버 로그인 접근 토큰 access_token에 개인정보 들어가 있음.
		String token = (String)session.getAttribute("access_token");
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		System.out.println(token);
		
	   //네이버 제공 코드 시작-------------------------------------------------------------
	  		String apiurl = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiurl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				System.out.println(200);
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				System.out.println(900);
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
		//네이버 제공 코드 끝 ------------------------------------------------------------- 	  
			 			
			JSONParser parsing = new JSONParser();
			try {
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject)obj;
				System.out.println("jsonObj : " + jsonObj);
				JSONObject resObj = (JSONObject)jsonObj.get("response");
				//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
				//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
				// 이름, 아이디, 이메일, 닉네임, 성별, 생일
				String naverName = (String)resObj.get("name");
				String naverEmail = (String)resObj.get("email");
				String naverNickName = (String)resObj.get("nickname");
				String gend = (String)resObj.get("gender");
				char naverGender = gend.charAt(0);
				String naverBirthday = (String)resObj.get("birthday");
				String naverId = (String)resObj.get("id"); 
				
				//받아오는거 한번 뽑아보자..
				System.out.println("네이버에서 받아온 정보 :"+naverId + ", " + naverName + ", " + naverEmail  + ", " + naverNickName + ", " + naverGender+ ", " + naverBirthday); 
				//72074062, 임연화, purrviolet@naver.com, PORPHYRA, F, 06-04
				
				//받아온 정보를 멤버에 담기
				Member NaverUser = new Member(naverId, naverNickName, naverName, naverBirthday, naverGender, naverEmail);
				System.out.println("네이버에서 받아와서 멤버에 담은 정보:"+NaverUser);
				
				String page = "";
				String msg = "";
				//1. 이메일이 우리 사이트에 가입되어 있으면, 메인으로 이동.
				//2. 이메일이 우리 사이트에 가입이 안되어 있으면, 울타리 회원가입으로 이동
				//	  (기존정보 들어와 있는 상태에서) 추가 정보 입력 후에 가입완료. -> 메인으로
				
				//1. 네이버에서 받은 6자리 아이디를 디비에서 검색해서 가입되어 있느지 확인.
				int result =new MemberService().idCheck(naverId);
				
				//2. 가입이되어 있으면 바로 로그인진행
				if(result > 0) {
					//네이버에서 받아온 정보로 DB에 가입정보 가져와서 
					Member loginUser = new MemberService().NaverLoginMember(NaverUser); 
					System.out.println("네이버에서 받아와서 디비찍고온 :"+loginUser);
					
					if(loginUser != null) {
						//세션영역에 회원정보 정보 담음 
						HttpSession session_naver = request.getSession();
						session_naver.setAttribute("loginUser", loginUser);
						session_naver.setMaxInactiveInterval(600); 
						//10분동안 session 유지
						
						//로그인정보 메인으로 보내기
						response.sendRedirect("views/main/main.jsp");
					}else {
						request.setAttribute("msg", "네이버 로그인정보를 디비에서 찾을 수 없어서 로그인 실패");
						RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
						view.forward(request, response);
					}
					
					
				}else{ 
				//3. 가입이 안되어 있으면 울타리 가입페이지로 보내기
					
					request.setAttribute("NaverUser", NaverUser);
					page ="views/main/memberjoinNaverForm.jsp";
					
					
					//위에서 받은 NaverUser 정보를 일단 저장하고,
//					int result2 = new MemberService().insertNaverMember(NaverUser);
					
//					String page = null;
//					if(result2 > 0) { 
//						//가입페이지에서 네이버에서 받아온 멤버 정보 뿌려줘야함
//						request.setAttribute("NaverUser", NaverUser);
//						page ="views/main/memberjoinNaverForm.jsp";
//					}else {
//						page = "views/common/errorPage.jsp";
//						request.setAttribute("msg", "네이버 로그인 정보 가져오기에 실패하였습니다.");
//					}
					RequestDispatcher view = request.getRequestDispatcher(page);
					view.forward(request, response);
					
					
					
					
				}
			
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
