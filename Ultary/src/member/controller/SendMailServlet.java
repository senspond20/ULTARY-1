package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/send.do")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendMailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//보낼 이메일 받아오기
//		String email_1 = request.getParameter("email_1"); //아이디
//		String email_2 = request.getParameter("email_2"); //도메인
//		String receiver = email_1 + "@" + email_2;
//		System.out.println(receiver);
		
		String receiver = request.getParameter("email");
		
		//인증 번호 생성기
        StringBuffer temp =new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println("랜덤키 발송 : "+AuthenticationKey);
        
		// 1. 전달받은 값 인코딩
		// - 전송할 값은 html이 아닌 다른 프로토콜로 전송할 것이기 때문에
		// 현재는 별도 인코딩을 하지 않습니다.
		request.setCharacterEncoding("UTF-8");

		final String sender = "purrviolet@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
		final String password = "KHqlqjs1234"; // 보내는 사람 Password

//		String receiver = request.getParameter("receiver"); // 받는 사용자 (Ex: @naver.com 까지..)
//		String title = request.getParameter("title"); 				// *메일 제목
//		String contents = request.getParameter("contents");			// *메일 내용
		String host = "smtp.naver.com"; // 사용하는 메일

		System.out.println("---------recv Data Check--------");
		System.out.println("recvID : " + receiver);
		System.out.println("title : " + "안녕하세요. ULTARY에서 보내드리는 인증 메일입니다.");
		System.out.println("content : " + temp);
		System.out.println("--------------------------");

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender, "ULTARY"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));

			// sender Email Address
//			message.setFrom("테스트메일 : <" + sender + ">");
			message.setFrom(sender);

			// Subject
			message.setSubject("안녕하세요. ULTARY에서 보내드리는 인증 메일입니다.");

			// Text
			message.setText("인증번호는 " + temp + " 입니다.", "UTF-8", "html");

			// send the message
			Transport.send(message);
			System.out.println("인증메일 전송 완료");
			
			//다시폼으로 돌려보내는 데이터 ->temp에 담긴 랜덤키만!
			PrintWriter out = response.getWriter();
			out.println(temp);
			out.flush();
			out.close();
			

		} catch (MessagingException e) {
			System.out.println("인증메일 전송 실패");
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
