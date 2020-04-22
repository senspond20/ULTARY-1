<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,java.util.*,trust.model.vo.*"%>
<%
	ArrayList<TrustReview> tr = (ArrayList<TrustReview>)request.getAttribute("tr");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티용</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching07.css">
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/tr_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/tr_aside.jsp" %>
				<section>
					<div id="top-title">
			<div id="top-1"><h2>내가 남긴 리뷰</h2></div>
			<div id="top-2">내가 남긴 위탁 후기를 보여 드립니다.</div>
		</div>
		<hr>
		<div id="page-in" style="padding-top: 10px;padding-bottom:10px;">
			<%if(tr.isEmpty()) {%>
				내가 남긴 후기가 없습니다.
			<%} else{ %>
			  <%for(int i=0; i<tr.size();i++){ %>
				<div class="content" id="content1">
					<div class="content-1">
						<img src="/Ultary/views/trustMatch/photo.jpg" class="ps">
						<h5 class="nick" id="nick1"><%=tr.get(i).getMemberId() %></h5>
						<input type="hidden" name="trnum" id="trnum" value="<%=tr.get(i).getTrNum() %>">
					</div>
					<div class="content-2">
						<h3 style="float:left">
						<%for(int j=0;j <tr.get(i).getTrScore(); j++){ %>
							★
						<%} %>
						</h3>
						<h4 style="float:right"><%=tr.get(i).getTrUploadDate() %></h4>
					</div>
					<div class="content-3">
						<div class="review"><%=tr.get(i).getTrContent() %></div>
					</div>
					<div class="content-4">
						<input type="button" class="btn" id="sBtn" name="sBtn" value="수정하기" onclick="location.href='<%=request.getContextPath()%>/trustcol.tu?trnum=<%=tr.get(i).getTrNum()%>'">
						<input type="button" class="btn" id="cBtn" name="cBtn" value="삭제하기" onclick="location.href='<%=request.getContextPath()%>/trustdelete.tu?trnum=<%=tr.get(i).getTrNum()%>'">
					</div>
				</div>
			 <%} %>
			<%} %>
		</div>
				
				
				
				
				
				
				
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>