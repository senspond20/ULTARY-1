<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/common/cm_aside.css">
</head>
<body>z
	<aside>
		<ul>
			<li><a href='<%= request.getContextPath() %>/cmnlist.po'>공지사항</a></li>
            <li><a href='<%= request.getContextPath() %>/cmAllList.po'>모아보기</a></li>
            <li><a href='<%= request.getContextPath() %>/cmdlist.po'>펫일상</a></li>
            <li><a href='<%= request.getContextPath() %>/cmklist.po'>펫지식</a></li>
            <li><a href='<%= request.getContextPath() %>/cmrlist.po'>펫리뷰</a></li>
            <li><a href='<%= request.getContextPath() %>/cmrelist.po'>펫분양</a></li>
		</ul>
	</aside>
</body>
</html>