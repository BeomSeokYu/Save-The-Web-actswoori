<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp"%>

</head>
<body>
	<%@ include file="/include/navbar.jsp"%>
		<div class = container>
			<table class="table">
  				<thead class="table-light">
  				
  				<img src = "/resources/img/moimTime.png" alt = "모임표지">
  				
    				<tr>
    					<th>예배</th>
    					<th>시간</th>
    				</tr>
  				</thead>
  				<tbody class = "table-gruop-divider">
  					예배및기도회
  					<tr>
  					<th>주일 1부 예배</th>
  					<th>오전 9:00</th>
  					</tr>
  					
  					<tr>
  					<th>주일 2부 예배</th>
  					<th>오전 11:00</th>
  					</tr>
  					
  					<tr>
  					<th>주일 오후 예배</th>
  					<th>오전 9:00</th>
  					</tr>
  					
  					<tr>
  					<th>수요예배</th>
  					<th>오후 7:00</th>
  					</tr>
  					
  					<tr>
  					<th>금요기도회</th>
  					<th>오후 8:30</th>
  					</tr>    
  					
  					<tr>
  					<th>새벽기도회</th>
  					<th>월~금 5시</th>
  					</tr>
  				</tbody>
			</table>
			
			<table class="table">
  				<thead class="table-light">
  				부서예배
    				<tr>
    					<th>예배</th>
    					<th>시간</th>
    				</tr>
  				</thead>
  				<tbody class = "table-gruop-divider">
  					<tr>
  					<th>유치부</th>
  					<th>오전 11:00</th>
  					</tr>
  					
  					<tr>
  					<th>유초등부</th>
  					<th>오전 9:00</th>
  					</tr>
  					
  					<tr>
  					<th>중고등부</th>
  					<th>오전 9:00</th>
  					</tr>
  					
  					<tr>
  					<th>청년대학부</th>
  					<th>오후 1:30</th>
  					</tr>
  					
  					<tr>
  					<th>구역예배</th>
  					<th>구역별 별도공지</th>
  					</tr>
  					
  					<tr>
  					<th>새가족/학습세례</th>
  					<th>비정규 모임</th>
  					</tr>    
  					
  				</tbody>
			</table>
		</div>
		
	<%@ include file="/include/footer.jsp"%>
</body>
</html>