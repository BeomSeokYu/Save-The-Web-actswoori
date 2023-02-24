<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- FOOTER -->
<footer class="bg-light">
  <div class="container py-5">
    <div class="row">
      <div class="col-6 col-md-2 mb-3">
        <h5>교회 소개</h5>
        <ul class="nav flex-column" style="text-align: left; margin-top: 8px;">
          <li class="nav-item mb-2"><a href="/1/vision.jsp" class="nav-link p-0 text-muted">교회 비전</a></li>
          <li class="nav-item mb-2"><a href="/1/moim.jsp" class="nav-link p-0 text-muted">모임 안내</a></li>
          <li class="nav-item mb-2"><a href="/1/peopleAll.jsp" class="nav-link p-0 text-muted">섬기는 사람들</a></li>
          <li class="nav-item mb-2"><a href="/1/directions.jsp" class="nav-link p-0 text-muted">오시는 길</a></li>
        </ul>
      </div>

      <div class="col-6 col-md-2 mb-3">
        <h5>예배와 말씀</h5>
        <ul class="nav flex-column" style="text-align: left; margin-top: 8px;">
          <li class="nav-item mb-2"><a href="/2/worship/wSelectAll.jsp" class="nav-link p-0 text-muted">예배 설교</a></li>
          <li class="nav-item mb-2"><a href="/2/lecture/lectureMain.jsp" class="nav-link p-0 text-muted">주요 특강</a></li>
          <li class="nav-item mb-2"><a href="/2/doctrine/doctrine.jsp" class="nav-link p-0 text-muted">복음과 교리</a></li>
        </ul>
      </div>

      <div class="col-6 col-md-2 mb-3">
        <h5>양육과 교육</h5>
        <ul class="nav flex-column" style="text-align: left; margin-top: 8px;">
          <li class="nav-item mb-2"><a href="/3/edu.jsp" class="nav-link p-0 text-muted">교육부서</a></li>
          <li class="nav-item mb-2"><a href="/3/area.jsp" class="nav-link p-0 text-muted">구역과 전도회</a></li>
          <li class="nav-item mb-2"><a href="/3/vow/vSelectAll.jsp" class="nav-link p-0 text-muted">말씀서원</a></li>
        </ul>
      </div>
      
      <div class="col-6 col-md-2 mb-3">
        <h5>돌봄과 선교</h5>
        <ul class="nav flex-column" style="text-align: left; margin-top: 8px;">
          <li class="nav-item mb-2"><a href="/4/news/newsAll.jsp" class="nav-link p-0 text-muted">교회 소식</a></li>
          <li class="nav-item mb-2"><a href="/4/post/postList.jsp" class="nav-link p-0 text-muted">주보</a></li>
          <li class="nav-item mb-2"><a href="/4/coop/coopList.jsp" class="nav-link p-0 text-muted">협력교회와 기관소식</a></li>
          <li class="nav-item mb-2"><a href="/4/gallery/photoList.jsp" class="nav-link p-0 text-muted">갤러리</a></li>
        </ul>
      </div>

      <div class="col-6 col-md-2 mb-3 text-end">
      </div>
      
      <div class="col-6 col-md-2 mb-3 text-end">
        <% if (session.getAttribute("sid") == null) { %>
			<a href="/user/login.jsp">로그인<i class="bi bi-box-arrow-in-right"></i></a>
		<% } else {%>
			<a class="nav-link dropdown-toggle mb-5" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="namef">
            </a>
			<ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/user/signeditPw.jsp">내 정보 변경</a></li>
	    <% if (admin) { %>
	    		<li><a class="dropdown-item" href="/admin/temp.jsp">가입 승인</a></li>
	    		<li><a class="dropdown-item" href="/admin/userManage.jsp">회원 관리</a></li>
	    <% } %>
	            <li><a class="dropdown-item" href="/user/logoutProc.jsp">로그아웃 <i class="bi bi-box-arrow-right"></i></a></li>
	        </ul>
		<% } %>
      </div>
    </div>

    <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
      <p>&copy; 행전우리교회</p>
    </div>
  </div>
</footer> 


<!-- Start of footer
 <section id="footer">
     <div class="container">
         <div class="row text-center">
             <div class="col-md-6">
                 <div class="copyright">
                     <p>@ 2016 - Design By <span><a href="">&#9798;</a></span></p>
                 </div>
             </div>
             <div class="col-md-6">
                 <div class="designer">
                     <p>A Design By <a href="#">XpeedStudio</a></p>
                 </div>
             </div>
         </div>
         End of row
     </div>
     End of container
 </section>
 End of footer -->


<!-- bootstrap JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>







<!-- Modal -->
<div class="modal fade" id="msgModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="msgModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="msgModalLabel"></h1>
      </div>
      <div class="modal-body" id="msgModalBody">
		
      </div>
      <div class="modal-footer" id="modal-footer">
        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- modal script -->
<script type="text/javascript">
function popModal(head, body) {
    $('#msgModalLabel').text(head);
    $('#msgModalBody').html(body);
    $('#modal-footer').empty()
       .append('<button type="button" class="btn btn-warning" data-bs-dismiss="modal">확인</button>')
    $('#msgModal').modal('show');
 }
 
function popModal2(head, body, url) {
    $('#msgModalLabel').text(head);
    $('#msgModalBody').html(body);
    $('#modal-footer').empty()
       .append('<button type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="location.href=\'' + url + '\'">확인</button>')
    $('#msgModal').modal('show');
 }
 
 
 function popModalRedirect(head, body, url) {
    $('#msgModalLabel').text(head);
    $('#msgModalBody').html(body);
    $('#modal-footer').empty()
       .append('<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>'
             + '<a href="'+url+'" class="btn btn-warning">이동</a>')
    $('#msgModal').modal('show');
 }
 
 $(function showName() {
	 <% if (session.getAttribute("sid") == null) { }
	  else {%>
		 $.ajax({
				type : 'post',
				url : '/user/userInfoProc.jsp',
				data : {
					email : '<%=session.getAttribute("sid")%>'
				},
				dataType : "text",
				async : false,
				success : function(data) {
						var user = JSON.parse(data.trim());
						$('#namef').html('[ ' + user.name +' '+user.job +'님 ]')
				}
			});
		<%}%>
			
	
	})
 
</script>