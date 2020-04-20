<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member,trust.model.vo.*"%>
<%
	Member m = (Member)request.getAttribute("m");
	TrustReview tp = (TrustReview)request.getAttribute("tp");
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching06.css">
    <style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/tr_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/tr_aside.jsp" %>
				<section>
					<div>
            <form action="<%=request.getContextPath()%>/updatereview.tu">
            <div id="matching">
				<h1 id="title">리뷰수정</h1>
				<p id="title-1"></p>
					<hr style="margin-left:10px;">
				<br clear="all">
				</div>
			<div id="page">
				<div id="page1">
					<div id="page2">
						<div id="page2-1">
							<div id="content1" class="content-profile">
								<img src="/Ultary/views/trustMatch/photo.jpg" id="profile" class="profile-photo">
								<div class="infoDiv">
								<span class="name" id="name1"><%=m.getNickname() %></span><br><br>
								<span class="address" id="class1"><%=m.getAddress() %></span>
								</div>
								<div class="infobutton1">관심등록</div><button id="like">좋아욤</button>
								<div class="infobutton2" ><a href="/Ultary/views/trustMatch/matching03.jsp">상세보기</a></div>
							</div>
						</div>
						</div>
							<div id="review-box">
								<div id="review-box-top">
									<h3 id="review-title">리뷰작성</h3>
									<label id="date"><%=tp.getTrUploadDate() %></label>
									<br>
									<hr>
									</div>
								<textarea id="review" name="review"><%=tp.getTrContent() %></textarea>
								<div id="point">
								<h3 style="float:left; margin-left: 61px;">별점</h3>
								<p id="star_grade">
								        <a href="#" id="1star">★</a>
								        <a href="#" id="2star">★</a>
								        <a href="#" id="3star">★</a>
								        <a href="#" id="4star">★</a>
								        <a href="#" id="5star">★</a>
								</p>
								<input type="hidden" id="score" name="score" value="">
								<input type="hidden" id="trnum" name="trnum" value="<%=tp.getTrNum()%>">
								<button id="button">리뷰등록</button>
								
							</div>
					<script>
					        $('#star_grade a').click(function(){
					            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
					            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
					            return false;
					        });
					        
					        $('#1star').click(function(){
					        	$('#score').val(1);
					        });
					        $('#2star').click(function(){
					        	$('#score').val(2);
					        });
					        $('#3star').click(function(){
					        	$('#score').val(3);
					        });
					        $('#4star').click(function(){
					        	$('#score').val(4);
					        });
					        $('#5star').click(function(){
					        	$('#score').val(5);
					        });
					</script>
					
					
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