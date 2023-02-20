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
<%@ include file="/include/header.jsp"%>
</head>
<body>
<%@ include file="/include/navbar.jsp"%>
<%
	String lno = request.getParameter("lno");
	int lnoo = Integer.parseInt(lno);
	LectureDTO lecture = LectureDAO.getDetail(lnoo); 
%>
	<div class = "container">
	<div class="pt-5"></div>
	<h2>특강</h2>
	<div class = "text-center h3" ><%=lecture.getLtitle() %></div>
	<%=lecture.getLcontent() %>
	<div>설교자 : <%=lecture.getLname() %></div>
	<div>날짜 : <%=lecture.getLdate() %></div>
	
	<!-- if 4페이지였으면 목록 클릭했을 때 4페이지로 가게 하기 위해서 -->
	<!-- <a class="btn btn-warning" href='/2/lecture/lectureMain.jsp' role="button">목록</a>  -->
	<input type="button" value="목록" onclick="history.back()" class="btn btn-warning">
	
	
    <!-- <a id="kakao-link-btn" href="javascript:kakaoShare()">
    	<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
    </a> -->

	
	<%-- <div class="shareBox">
	<a href="#" id="sns_urlCoby" class="btn_share_sns" title="새창" onclick="clip(); return false;">
    <img width = "30" height = "30" src="${pageContext.request.contextPath}/resources/img/clip.png"></a>
	</div> --%>
<%	
//나중에 user 받아오고
	//if (UserDAO.login(id, password) == 1) {
		
	//}
	//String adminLoginCheck = session.getAttribute("sid");
	String adminLoginCheck = "a";
	
	if (adminLoginCheck != null){%>
		<div class ="d-grid gap-2 d-md-flex justify-content-md-end"><button onclick="location.href='/2/lecture/lectureModify.jsp?lno=<%=lecture.getLno()%>'" class="btn btn-primary">수정</button>
		<button onclick ="location.href='/2/lecture/lectureDel.jsp?lno=<%=lecture.getLno()%>'" class="btn btn-primary">삭제</button></div>
<%	}	%>



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
        return textarea;
    }
</script>

<!-- 카카오공유 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('a19b1ffba5bdd31227cb7ab1a846dc78');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function kakaoShare() {

	
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: 'a',
        description: 'lecture.getLcontent()',
        imageUrl: '카카오공유하기 시 썸네일 이미지 경로',
        link: {
          mobileWebUrl: '카카오공유하기 시 클릭 후 이동 경로',
          webUrl: 'a'+clip(),
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: '카카오공유하기 시 클릭 후 이동 경로',
            webUrl: 'abc',
          },
        },
      ],
      // 카카오톡 미설치 시 카카오톡 설치 경로이동
      installTalk: true,
    })
  }
</script>

<%@ include file="/include/footer.jsp" %>
</body>
</html>