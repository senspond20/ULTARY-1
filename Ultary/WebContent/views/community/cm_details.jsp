<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,post.model.vo.*, java.util.ArrayList"%>
<%
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
				  		<div id="cm_detail_all">
				  			<div id="cm_detail_title">
				  				<div id="cdt_title"><%= post.getPostTitle() %></div>
				  				<div id="cdt_wdate"><%= post.getPostDate() %></div>
				  			</div>
				  			<br>
				  			<div id="cdt_border"></div>
				  			<div id="cdt_detail_writer">
				  			<a href="#"><img src="image/s2.jpg" id="cdt_profile"></a>
				  			<a href="#"><label><%= post.getMemberid() %></label></a>
				  			</div>
				  			<div id="cdt_detail_content">
				  				<% for(int i =0; i<fileList.size();i++) { %>
				  			<div class="detailImgArea">
							<img id="detailImg" class="detailImg" width="550" height="500"
							src="<%= request.getContextPath() %>/uploadFiles/<%=fileList.get(i).getWebName()%>">
						</div>			
				  			<% } %>
				  		</div>			
				  				<p>
								<%= post.getPostContent() %>
				  				</p>
				  				<div id="cdt_like_recom_report">
				  				<button id="cdt_like"><img src="<%= request.getContextPath() %>/images/heart.png"><span>관심글 등록</span></button>
				  				<button id="cdt_recom"><img src="<%= request.getContextPath() %>/images/like.png"><span>추천</span></button>
				  				
				  				
				  				<% if(loginUser != null && loginUser.getNickname().equals(post.getMemberid())){ %>
				  				<button id="modify">수정하기</button>
				  				<% } %>
				  				</div>
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
				  	</div>
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>