<!-- 
최초작성자 : 김영광
최초작성일 : 2023/02/16

버전  기록 : 0.1(시작 23/02/16) 
	     0.5(기본작업 23/02/17)
	     0.6(주소복사버튼 23/02/18)
	            
	           0.7(추가 디자인 23/02/18)
	           1.0(1차 완성 23/02/20)
-->

<%@page import="jdbc.LectureDTO"%>
<%@page import="jdbc.LectureDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%
	String lno = request.getParameter("lno");
	int lnoo = Integer.parseInt(lno);
	LectureDTO lecture = LectureDAO.getDetail(lnoo); 
%>
	
	<%=lecture.getLtitle() %><br>
	<%=lecture.getLcontent() %><br>
	<%=lecture.getLname() %><br>
	<%=lecture.getLdate() %><br>

<%	
//나중에 user 받아오고
	//if (UserDAO.login(id, password) == 1) {
		
	//}
	//String adminLoginCheck = session.getAttribute("sid");
	String adminLoginCheck = "a";
	
	if (adminLoginCheck != null){%>
		<button onclick="location.href='/2/lecture/lectureModify.jsp?lno=<%=lecture.getLno()%>'" class="btn btn-primary">수정</button>
		<button onclick ="location.href='/2/lecture/lectureDel.jsp?lno=<%=lecture.getLno()%>'" class="btn btn-primary">삭제</button>
<%	}	%>


<div class="shareBox">
	<a href="#" id="sns_urlCoby" class="btn_share_sns" title="새창" onclick="clip(); return false;">
    <img src="${pageContext.request.contextPath}/resources/img/sub/icon_share_link.png" alt="링크 공유하기"></a>
</div>

<script>
function clip(){

        var url = '';    // <a>태그에서 호출한 함수인 clip 생성
        var textarea = document.createElement("textarea");  
        //url 변수 생성 후, textarea라는 변수에 textarea의 요소를 생성
        
        document.body.appendChild(textarea); //</body> 바로 위에 textarea를 추가(임시 공간이라 위치는 상관 없음)
        url = window.document.location.href;  //url에는 현재 주소값을 넣어줌
        textarea.value = url;  // textarea 값에 url를 넣어줌
        textarea.select();  //textarea를 설정
        document.execCommand("copy");   // 복사
        document.body.removeChild(textarea); //extarea 요소를 없애줌
        
        alert("URL이 복사되었습니다.")  // 알림창
    }
</script>
<%@ include file="/include/footer.jsp" %>
</body>
</html>