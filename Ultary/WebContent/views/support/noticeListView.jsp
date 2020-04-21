<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="admin.model.vo.*, java.util.ArrayList"%>
<%
	ArrayList<Notice> list = (ArrayList) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	String option = (String) request.getAttribute("option");
	String search = (String) request.getAttribute("search");
	int listCount = (int) request.getAttribute("listCount");

	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터틀</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
li {
	list-style: none;
}

#type11 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	background: white;
}

#type11 th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: skyblue;
}

#type11 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: none;
}

#divPaging {
	clear: both;
	margin: 0 auto;
	width: 220px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
}

#liSearchOption {
	clear: both;
	text-align: center;
}

#liSearchOption>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
}

/* */
#mainWrapper {
	width: 900px;
	text-align: center;
}

.pagingArea button {
	border-radius: 10px;
	background: beige;
	height: 25px;
	width: 50px
}

.searchArea {
	margin-right: 50px;
}

.searchArea button {
	background: whitesmoke;
	border-radius: 5px;
	color: white;
	text-align: center;
}


button:hover {
	cursor: pointer;
}

#numBtn {
	background: skyblue;
}

#choosen {
	background: #FFD8D8;
}

#listArea {
	margin: auto;
}

.admin {
	display: inline;
}
</style>
</head>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/sp_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/sp_aside.jsp" %>

				<!-- 내용 들어갈 영역 -->
				<section id="content">

					<div id="mainWrapper">

						<br> <br>
						<ul>

							<div class="outer">
								<img src="image/support/notice4.png">
								<p style="color: gray;">울타리 이용자 분들께 안내드립니다.</p>
								검색 결과 : <%=listCount%>개가 검색되었습니다.
								<hr>
								
								<table id="type11">
									<thead>
										<tr>
											<th scope="cols" width="50px">글번호</th>
											<th scope="cols" width="400px">글제목</th>
											<th scope="cols" width="100px">작성일</th>
											<th scope="cols" width="100px">작성자</th>
											<th scope="cols" width="50px">조회수</th>
										</tr>
									</thead>
									<tbody>
										<!-- 게시물이 출력될 영역 -->
										<%
											if (list.isEmpty()) {
										%>
										<tr>
											<td colspan="5">존재하는 공지사항이 없습니다.</td>
										</tr>
										<%
											} else {
												for (Notice n : list) {
										%>
										<tr>
											<td><%=n.getN_num()%></td>
											<td><%=n.getN_title()%></td>
											<td><%=n.getN_date()%></td>
											<td><%=n.getMemberid()%></td>
											<td><%=n.getN_clicks()%></td>
										</tr>
										<%
											}
											}
										%>
									</tbody>
								</table>
								<script>
							  $(function(){
							        $('#type11 td').mouseenter(function(){
							           $(this).parent().css({'background' : 'beige', 'cursor' : 'pointer'})
							        }).mouseout(function(){
							           $(this).parent().css({'background' : 'white'})
							        }).click(function(){
							           var num = $(this).parent().children().eq(0).text();
							           location.href="<%=request.getContextPath()%>/sdetail.no?no="+ num;
														})
									});
								</script>
							</div>


							<br>
							<br>
							<!-- 페이징 -->
							<div class="pagingArea" align="center">
								<%
									if (!list.isEmpty()) {
								%>
								<!-- 맨 처음으로 -->
								<button
									onclick="location.href='<%=request.getContextPath()%>/slist.no?currentPage=1&option=<%=option%>&search=<%=search%>'">&lt;&lt;</button>

								<!-- 이전 페이지로 -->
								<button
									onclick="location.href='<%=request.getContextPath()%>/slist.no?currentPage=<%=currentPage - 1%>&option=<%=option%>&search=<%=search%>'"
									id="beforeBtn">&lt;</button>
								<script>
									if (
								<%=currentPage%>
									<= 1) {
										$('#beforeBtn')
												.attr('disabled', 'true');
									}
								</script>

								<!-- 10개 페이지 목록 -->
								<%
									for (int p = startPage; p <= endPage; p++) {
								%>
								<%
									if (p == currentPage) {
								%>
								<button id="choosen" disabled><%=p%></button>
								<%
									} else {
								%>
								<button id="numBtn"
									onclick="location.href='<%=request.getContextPath()%>/slist.no?currentPage=<%=p%>&option=<%=option%>&search=<%=search%>'"><%=p%></button>
								<%
									}
								%>
								<%
									}
								%>

								<!-- 다음 페이지로 -->
								<button id="afterBtn"
									onclick="location.href='<%=request.getContextPath()%>/slist.no?currentPage=<%=currentPage + 1%>&option=<%=option%>&search=<%=search%>'">&gt;</button>
								<script>
									if (
								<%=currentPage%>
									>=
								<%=maxPage%>
									) {
										$('#afterBtn').attr('disabled', 'true');
									}
								</script>

								<!-- 맨 끝으로 -->
								<button
									onclick="location.href='<%=request.getContextPath()%>/slist.no?currentPage=<%=maxPage%>&option=<%=option%>&search=<%=search%>'
									
									">&gt;&gt;</button>
								<%
									}
								%>
							</div>


							<br>
			

							<!-- 검색 폼 영역 -->
							<li id='liSearchOption'>
								<form action='<%=request.getContextPath()%>/slist.no'>
									<select id='selSearchOption' name="option">
										<option value='A'>제목+내용</option>
										<option value='T'>제목</option>
										<option value='C'>내용</option>
									</select> <input id='txtKeyWord' name="search" /> <input type="submit"
										value='검색' />
									
									<div class="admin" align="center">

										<%
											if (loginUser != null && loginUser.getMemberId().equals("admin")) {
										%>
										<button onclick="location.href='views/support/noticeInsertForm.jsp'"
											id="writeNoBtn">글쓰기(관리자용)</button>
										<%
											} else {
										%>
						
										<%
											}
										%>
									</div>
								</form>


							</li>
						</ul>
					</div>
				</section>
			</div>

		</div>


		<footer>from.hoseong</footer>
	</div>

	<script>
		$(function() {
			$('#fifth').mouseenter(function() {
				$('#semicategory').slideDown();
			});
			$('#fifth').mouseleave(function() {
				$('#semicategory').mouseleave(function() {
					$('#semicategory').slideUp();
				});
			});
		});
	</script>
</body>
</html>