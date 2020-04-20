<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member m = (Member)request.getAttribute("m");
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=024c2d3762ad20e2c073d3d106f1b34c"></script>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching04.css">
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/tr_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/tr_aside.jsp" %>
				<section>
					 <div>
            <form action="<%= request.getContextPath() %>/DetailMatch.tu">
            <div id="matching">
			<h1 id="title">의뢰관리</h1>
			<p id="title-1">위탁 내용 상세보기와 진행사항을 보여드립니다.</p>
				<hr style="margin-left:10px;">
			<br clear="all">
	</div>
	<div id="page">
		<div id="page1">
			<img src="/Ultary/views/trustMatch/photo.jpg" id="profile" class="profile-photo">
			<div id="page2">
			<span id="name"><p><b><%=m.getNickname() %></b></p></span>
			<div class="infobutton1">관심등록</div><button id="like">좋아욤</button>
			<span id="address"><p><b><%=m.getAddress() %></b><p></span>
			</div>
		<hr>
		<h5 style="text-align:center;">상세내용</h5>
		<div id="detail" class="detail">가정집이고요 현재는 펫시팅으로 여행이나 이사가실때 멸절기간(설날,추석 가능)이나 장기보육한 시간이 된지 15년 이상 경력이 되었네요</div>
		
		<h5 style="text-align:center;">돌봄환경</h5>
		<hr>
		<div class=detail>
			<p><%=m.getTrustfield() %></p>
		</div>
		<h5 style="text-align:center;">거주지역</h5>
		<hr>
		<div id="area">
			<div id="map" style="width: 803px; height: 167px;"></div>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(33.450701,126.570667),
						levle: 3
					};
					var map = new kakao.maps.Map(container,option);
				</script>
			<label><%=m.getAddress() %></label>
		</div>
		<h5 style="text-align:center;">유의사항</h5>
		<hr>
		<div id="area1">
		<% if(m.getTrustAdd() == null) {%>
			유의 사항이 없습니다.
		<% } else{ %>
			<br>
			<h5 style="text-align:center"><%=m.getTrustAdd() %></h5>
		<% } %>
		</div>
		<h5 style="text-align:center;">위탁후기</h5>
		<hr>
		<div id="area2">
			<div class="review">
				<img src="/Ultary/views/trustMatch/photo.jpg" id="profile" class="review-photo">
				<span class="point">☆☆☆☆☆</span>
				<br>
				<p class="review1">
				필요한물품들은 직접 가져와주시기도하는 등 여러부분에서 도움을 많이 받았습니다! 다음번에도 펫시터님께 아가를 부탁드려도되겠다고 생각할만큼 신뢰도
				</p>			
			</div>
			<div class="review">
				<img src="/Ultary/views/trustMatch/photo.jpg" id="profile" class="review-photo">
				<span class="point">☆☆☆☆☆</span>
				<br>
				<p class="review1">
				필요한물품들은 직접 가져와주시기도하는 등 여러부분에서 도움을 많이 받았습니다! 다음번에도 펫시터님께 아가를 부탁드려도되겠다고 생각할만큼 신뢰도
				</p>
			</div>
			<h5 style="text-align:center;cursor: pointer;">더보기</h5>
			<input type="hidden" id="memberid" name="memberid" value=<%=m.getMemberId() %>>
		</div>
		<button id="submit">위탁요청하기</button>
		</div>
	</div>
            </form>
         </div>
				
				
				
				
				
				
				
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>