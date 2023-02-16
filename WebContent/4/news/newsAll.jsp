<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행전우리교회</title>
<%@ include file="/include/header.jsp" %>
</head>
<body>
<%@ include file="/include/navbar.jsp" %>

<%@ include file="/include/footer.jsp" %>

<script>

$(function(){
	const urlParams = new URL(location.href).searchParams;
	const msg = urlParams.get('msg');

	if (msg == "insertSuccess") {
		popModal("등록 성공", "등록에 성공하였습니다.")
	}
});

</script>
</body>
</html>