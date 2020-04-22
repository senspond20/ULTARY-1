<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/tr_aside.css">
</head>
<body>
	<aside>
		<ul>
			<li><a href='<%=request.getContextPath()%>/slist.no'>공지 사항</a></li>
			<li><a href='<%=request.getContextPath()%>/faq.sv'>자주하는 질문</a></li>
			<li><a href='<%=request.getContextPath()%>/views/support/InquirySend.jsp'>1:1 문의</a></li>
		</ul>
	</aside>
</body>
</html>