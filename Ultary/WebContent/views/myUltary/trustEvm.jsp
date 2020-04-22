<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Media proImg = (Media)session.getAttribute("proImg");
	String[] trustlist = null;
	if(loginUser.getTrustfield() != null){
	trustlist = loginUser.getTrustfield().split(",");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위탁 환경</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/trustEvm.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="chat.jsp" %>
	<div id="all">
		<div id="all-wrap">
	<%@ include file="myUltaryheader.jsp" %>
	<%@ include file="navaside.jsp" %>
			<section>
				<form action="<%= request.getContextPath() %>/update.trust" method="post">
					<div id="sDiv">
						<div id="trustdiv">
							<label>위탁여부</label><br><label>('Yes'를 하셔야 위탁요청을 받을 수 있습니다.)</label>
							<hr>
							<input type="radio" id="trust1" name="trust" value="Y"><label>Yes</label>
							<input type="radio" id="trust2" name="trust" value="N"><label>No</label>
						</div>
						<div id="trustmeansdiv">
							<label>위탁방식</label>
							<hr>
							<input type="radio" id="trustmeans1" name="trustmeans" value="1"><label>산책</label>
							<input type="radio" id="trustmeans2" name="trustmeans" value="2"><label>방문</label>
							<input type="radio" id="trustmeans3" name="trustmeans" value="3"><label>위탁</label>
							<input type="radio" id="trustmeans4" name="trustmeans" value="4"><label>전체</label>
						</div>
						<div id="sEnvir">
							<label>돌봄환경</label>
							<hr>
							<label>픽업여부</label><input type="checkbox" id="tEnvir1" name="trustfield" value="픽업여부">
							<label>마당여부</label><input type="checkbox" id="tEnvir2" name="trustfield" value="마당여부">
							<label>산책가능</label><input type="checkbox" id="tEnvir3" name="trustfield" value="산책">
							<label>목욕가능</label><input type="checkbox" id="tEnvir4" name="trustfield" value="목욕">
							<label>온도조절</label><input type="checkbox" id="tEnvir5" name="trustfield" value="온도">
							<label>대형동물</label><input type="checkbox" id="tEnvir6" name="trustfield" value="대형동물">
						</div>
						<div id="sArea">
							<label>거주지역</label>
							<hr>
							<div id="mapApi">
								<%@ include file="map.jsp" %>
							</div>
						</div>
						<div id="sDetail">
							<label>세부사항</label>
							<hr>
							<% if(loginUser.getTrustAdd() != null){ %>
							<textarea name="trustadd"><%= loginUser.getTrustAdd() %></textarea>
							<% }else{ %>
							<textarea name="trustadd"></textarea>
							<% } %>
						</div>
						<div id="sModify">
							<input type="submit" value="Modify">
						</div>
					</div>
				</form>
			</section>
<script>
	$(function(){
		<% if(loginUser.getTrust() == 'Y'){ %>
		$('#trust1').prop('checked', true);
		<% } else{ %>
		$('#trust2').prop('checked', true);
		<% } %>
		<% if(loginUser.getTrustmeans() == 1){ %>
		$('#trustmeans1').prop('checked', true);
		<% } else if(loginUser.getTrustmeans() == 2){ %>
		$('#trustmeans2').prop('checked', true);
		<% } else if(loginUser.getTrustmeans() == 3){ %>
		$('#trustmeans3').prop('checked', true);
		<% } else{ %>
		$('#trustmeans4').prop('checked', true);
		<% } %>
		<% if(trustlist != null){ %>
			<% for(String trustfield:trustlist){ %>
				<% if(trustfield.equals("픽업여부")){ %>
		$('#tEnvir1').prop('checked', true);
				<% } %>
				<% if(trustfield.equals("마당여부")){ %>
		$('#tEnvir2').prop('checked', true);
				<% } %>
				<% if(trustfield.equals("산책")){ %>
		$('#tEnvir3').prop('checked', true);
				<% } %>
				<% if(trustfield.equals("목욕")){ %>
		$('#tEnvir4').prop('checked', true);
				<% } %>
				<% if(trustfield.equals("온도")){ %>
		$('#tEnvir5').prop('checked', true);
				<% } %>
				<% if(trustfield.equals("대형동물")){ %>
		$('#tEnvir6').prop('checked', true);
				<% } %>
			<% } %>
		<% } %>
	});
</script>
		</div>
		<footer>제작사:hoseong</footer>
	</div>
</body>
</html>