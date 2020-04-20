<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.*, post.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Media proImg = (Media)session.getAttribute("proImg");
	ArrayList<Post> pList = (ArrayList<Post>)request.getAttribute("pList");
	ArrayList<Media> mList = (ArrayList<Media>)request.getAttribute("mList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내울타리 타임라인</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/ultaryMain.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="chat.jsp" %>
	<div id="all">
		<div id="all-wrap">
	<%@ include file="myUltaryheader.jsp" %>
	<%@ include file="navaside.jsp" %>
			<section>
				<div class="sectiondiv">
				<% if(pList.isEmpty()){ %>
				<h1>조회할 게시물이 없음</h1>
				<% } else{ %>
					<% for(int i = 0; i < pList.size(); i++) { 
						Post p = pList.get(i); %>
					<div class="writer">
						<div class="sectionimg">
							<img class="sectionpic" src="<%= request.getContextPath() %>/uploadFiles/<%= proImg.getWebName() %>">
							<div class="sectionNick"><%= p.getMemberid() %></div>
						</div>
						<div class="contentTitle"><%= p.getPostTitle() %></div>
						<div class="writerR">게시일 | <%= p.getPostDate() %></div>
					</div>
					
					<% ArrayList<Media> imgList = new ArrayList<Media>();
						for(int j=0;j<mList.size();j++) { 
							Media m = mList.get(j); %>
							<% if(m.getPostNum() == p.getPostNum()) {
								imgList.add(m); 
							}
						}
								if(!imgList.isEmpty()) {%>
					<div class="media">
						<div class="slide" id="slide<%= i %>">
					      <div id="back<%= i %>" class="slideBtn"><img src="<%= request.getContextPath() %>/image/왼쪽 화살표.png" alt="" width="50"></div>
					      <ul>
					      <% for(int z=0;z<imgList.size();z++){
					      	Media real = imgList.get(z); %>
					        <li><img src="<%= request.getContextPath() %>/uploadFiles/<%= real.getWebName() %>" alt="" width="550" height="350"></li>
					      <% } %>
					      </ul>
					      <div id="next<%= i %>" class="slideBtn"><img src="<%= request.getContextPath() %>/image/오른쪽 화살표.png" alt="" width="50"></div>
					    </div>
					</div>
							<% } %>
					<div class="content">
						<p><%= p.getPostContent() %></p>
					</div>
					<div class="explain">
						<div id="petlife"><%= p.getCategorynum() %></div>
						<div class="expansionbox">카테고리</div>
						<div class="expansionbox">관심글 등록</div>
						<div id="likeBtn<%= i %>" class="expansionbox"><%= p.getPostLike() %> like</div>
					</div>
					<div class="comment">
						<div class="comment0">댓글</div>
						<hr>
						<div class="comment1">
							<div class="comment2-1"><img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png"></div>
							<div class="comment2-2">댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글</div>
						</div>
						<div class="commentans">답글답글답글답글답글답글답글답글답글답글답글답글답글답글답글</div>
						<div class="commenttextdiv">
							<div class="writercomment"><img class="writercommentimg" src="<%= request.getContextPath() %>/image/프로필.png"></div>
							<input class="commenttext" type="text" placeholder="내용을 입력해주세요">
							<input class="commentsubmit" type="submit" value="댓글달기">
						</div>
					</div>
<script type="text/javascript">
    $(document).ready(function(){
    	var postNum = <%= p.getPostNum() %>;
    	var likeBtn = "#likeBtn"+<%= i %>;
    	$(likeBtn).click(function(){
    		$.ajax({
    			url: 'postlike.up',
    			data: {postNum:postNum},
    			success: function(data){
    				$(likeBtn).text(data+" like");
    			}
    		});
    	});
    		
    	
    	
    	/* -------------이미지 슬라이드-------------------------- */
      var imgs;
      var img_count;
      var img_position = 1;
      var slide = "#slide"+<%= i %>+" ul";
      var backbtn = "#back"+<%= i %>;
      var nextbtn = "#next"+<%= i %>;

      imgs = $(slide);
      $back = $(backbtn);
      $next = $(nextbtn);
      img_count = imgs.children().length;

      //버튼을 클릭했을 때 함수 실행
      $back.click(function () {
        back();
      });
      $next.click(function () {
        next();
      });

      function back() {
        if(1<img_position){
          imgs.animate({
            left:'+=550px'
          });
          img_position--;
        }
      }
      function next() {
        if(img_count>img_position){
          imgs.animate({
            left:'-=550px'
          });
          img_position++;
        }
      }
    });
</script>
					<% } %>
				
				<% } %>
				</div>
			</section>
<script type="text/javascript">
	$(function(){
		$('.slideBtn').hover(function(){
			$('.slideBtn').css("opacity", "1");
		}, function(){
			$('.slideBtn').css("opacity", "0");
		});
	});
</script>
		</div>
		<footer>제작사:hoseong</footer>
	</div>
</body>
</html>