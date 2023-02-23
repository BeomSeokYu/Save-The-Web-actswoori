package email;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Result;

import email.NaverSMTP;
import jdbc.UserDAO;

@WebServlet("/sendMail.do")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String randNumber = "";
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String type = request.getParameter("type");
		System.out.println(type);

		
		// 인증 메일 발송 처리
		if(type.equals("send")) {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			if (UserDAO.existPw(email, name)) {
				randNumber = randNum();
				String result = sendMail(email, randNumber);
				System.out.println(randNumber);
				response.getWriter().write(result);
			} else {
				response.getWriter().write("fail");
			}
		}
		
		
		// 인증 메일 확인 처리
		if(type.equals("check")) {
			String checkNum = request.getParameter("checkNum");
			if (checkNum != null) {
				String result = checkNum.equals(randNumber)? "true" : "false";
				response.getWriter().write(result);
			} else {
				response.getWriter().write("false");
			}
		}
	}
	
	// 인증 메일 발송
	public String sendMail(String userEmail, String randNum) throws IOException {
		String result = "success";
		Map<String, String> emailInfo = new HashMap<>();
		
		emailInfo.put("format", "text/html;charset=UTF-8");		// 메일의 형식을 설정
		
		// 내용을 담을 템플릿html 경로
		String templetePath = getServletContext().getRealPath("auth.html");
		BufferedReader br = new BufferedReader(new FileReader(templetePath));
		
		String htmlContent = "";
		String line;
		while((line = br.readLine()) != null) {
			htmlContent += line;
		}
		br.close();
		
		htmlContent = htmlContent.replace("__NUMBER__", randNum);	
		
		emailInfo.put("content", htmlContent);	// 내용
		emailInfo.put("from", "austiny@naver.com");		// 보내는 사람, 변동 불가, 반드시 본인의 네이버 메일 주소
		emailInfo.put("to", userEmail);			// 받는 사람
		emailInfo.put("subject", "행전우리교회 회원 인증 메일");	// 제목
		
		try {
			NaverSMTP smtpServer = new NaverSMTP();
			smtpServer.emailSending(emailInfo);
		} catch(Exception e) {
			result = "fail";
			e.printStackTrace();
		}
		return result;
	}
	
	// 인증 번호 생성
	public String randNum() {
		Random random = new Random();		//랜덤 함수 선언
		int createNum = 0;  			//1자리 난수
		String ranNum = ""; 			//1자리 난수 형변환 변수
        	int letter    = 6;			//난수 자릿수:6
		String resultNum = "";  		//결과 난수
		
		for (int i=0; i<letter; i++) { 
            		
			createNum = random.nextInt(9);		//0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum =  Integer.toString(createNum);  //1자리 난수를 String으로 형변환
			resultNum += ranNum;			//생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
		}
		return resultNum;
	}
}