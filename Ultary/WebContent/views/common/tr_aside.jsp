<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/common/tr_aside.css">
</head>
<body>z
	<aside>
		<ul>
			<li><a href="/Ultary/views/trustMatch/matching01.jsp">위탁검색</a></li>
			<li><a href="/Ultary/views/trustMatch/matching05.jsp">의뢰 관리</a></li>
			<li><a href="<%=request.getContextPath() %>/myreview.tu">내가 남긴 리뷰</a></li>
		</ul>
	</aside>
</body>
</html>