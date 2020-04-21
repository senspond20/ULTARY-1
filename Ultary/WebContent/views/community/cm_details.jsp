<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,post.model.vo.*, java.util.ArrayList"%>
<%
	Media proImg = (Media)session.getAttribute("proImg");
	Post post = (Post)request.getAttribute("post");
	ArrayList<Media> fileList = (ArrayList<Media>)request.getAttribute("fileList");
	
	String categoryname = "";
	switch(post.getCategorynum()){
	case 1 : categoryname ="공지사항";break;
	case 2 : categoryname ="펫일상";break;
	case 3 : categoryname ="펫지식";break;
	case 4 : categoryname="펫리뷰";break;
	case 5 : categoryname ="펫분양";break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/cm_details.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/cm_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/cm_aside.jsp" %>
				<section>
					<div id="cm_detail_head">
				  	<h1><%= categoryname %></h1>
				  	<hr>
				  </div>
				  <div class="cmcontent">
				  	<div class="cm_wrap">
				  	<form action="<%= request.getContextPath() %>/update.po" method="post">
				  		<div id="cm_detail_all">
				  			<div id="cm_detail_title">
				  				<div id="cdt_title"><%= post.getPostTitle() %></div>
				  				
				  				<input type="hidden" name ="title" value="<%= post.getPostTitle() %>"> 
				  				<input type="hidden" name="pno" value="<%= post.getPostNum() %>">
				  				
				  				<div id="cdt_wdate"><%= post.getPostDate() %></div>
				  			</div>
				  			<br>
				  			<div id="cdt_border"></div>
				  			<div id="cdt_detail_writer">
				  			<a href="#"><img src="<%= request.getContextPath() %>/uploadFiles/<%= proImg.getWebName() %>" id="cdt_profile"></a>
				  			<a href="#"><label><%= post.getMemberid() %></label></a>
				  			</div>
				  			<div id="cdt_detail_content">
				  			<% ArrayList<Media> imgList = new ArrayList<Media>(); 
				  				for(int j= 0;j<fileList.size();j++){
				  					Media m = fileList.get(j);
				  					imgList.add(m);
				  				}
								if(!imgList.isEmpty()) { %>
				  				<div class="media">
									<div class="slide" id="slide">
									<div id="back" class="slideBtn"><img src="<%= request.getContextPath() %>/image/왼쪽 화살표.png" alt="" width="50"></div>
									<ul>
									<% for(int i =0; i<fileList.size();i++) { 
										Media real = imgList.get(i);
									%>
										<li><img id="detailImg" class="detailImg" width="550" height="350"
											src="<%= request.getContextPath() %>/uploadFiles/<%=real.getWebName()%>"></li>
											
									<% } %>
									</ul>
									<div id="next" class="slideBtn"><img src="<%= request.getContextPath() %>/image/오른쪽 화살표.png" alt="" width="50"></div>
									</div>  				
				  				</div>		
				  				<% } %>
				  				<div id=cdt_wrap>
				  				<% String contents = (post.getPostContent()).replace("\r\n", "<br>"); %>
								<%= contents %>
								<input type="hidden" name="content" value="<%= post.getPostContent() %>">
								<input type="hidden" name="range" value="<%= post.getPostRange() %>">
				  				</div>
				  				<div id="cdt_like_recom_report">
				  				<button id="cdt_like"><span>관심글 등록</span></button>
				  				<button id="cdt_recom"><span>추천</span></button>
				  				<% if(loginUser != null && loginUser.getNickname().equals(post.getMemberid())){ %>
				  				<input type="submit" id="modify" value="수정">
				  				<input type="button" id="deletebtn" value="삭제">
				  				<% } %>
				  				<div id="menuBtn" >메뉴로</div>
				  				</div>
				  				</div>	
				  				</div>
				  </form>
				  				<!-- 댓글 부분 -->
				  				<div id="cdt_commend_list">
				  					<ul id="ul_clist">
				  					<li style="border-bottom-style:solid;border-bottom-color:lightgray;">댓글쓰기</li>
				  						<li class="cdt_per_com_all">
				  						
				  						</li>
				  						<li>
				  						
				  						</li>						
				  					</ul>
				  				</div>
				  		</div>
				  	</div>
				</section>
			<script>
				$('#menuBtn').click(function(){
					switch(<%= post.getCategorynum() %>){
					case 1: location.href='<%= request.getContextPath()%>/cmnotice.po'; break;
					case 2: location.href='<%= request.getContextPath()%>/cmdlist.po'; break;
					case 3: location.href='<%= request.getContextPath()%>/cmklist.po'; break;
					case 4: location.href='<%= request.getContextPath()%>/cmrlist.po'; break;
					case 5: location.href='<%= request.getContentType()%>/cmrelist.po';break;
					}
				});
				
				$(document).ready(function(){
					  var imgs;
				      var img_count;
				      var img_position = 1;
				      var slide = "#slide ul";
				      var backbtn = "#back";
				      var nextbtn = "#next";

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
			<footer>from.hoseong</footer>
			</div>
		</div>
</body>
</html>