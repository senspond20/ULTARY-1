<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.ArrayList, admin.model.vo.*"%>

<%
	ArrayList<OftenQuery> list = (ArrayList<OftenQuery>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	String option = (String) request.getAttribute("option");
	String search = (String) request.getAttribute("search");

	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ULTARY</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
<style>
li {
	list-style: none;
}

section {
	background: whitesmoke;
	margin-top: 30px;
	width: 900px;
}

#mainWrapper {
	text-align: center;
}

#liSearchOption {
	clear: both;
}

#liSearchOption>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
}

#selSearchOption {
	width: 50px;
}

#txtKeyWord {
	width: 140px;
}

.left {
	text-align: left;
}

#ftable {
	background-color: rgb(214, 241, 252);
	margin-top: 5px;
	border: 10px solid rgb(214, 241, 252);
	margin-left: auto;
	margin-right: auto;
}

#ftable td {
	border: 5px solid rgb(214, 241, 252);
	border-radius: 20px;
}
.ftr {
	background-color: white;
	
}

#f1e {
	width: 100px;
	background-color: rgb(63, 63, 187);
	color: white;
	font-size: 25px;
	border-radius: 20px;
}

#f2e {
	width: 700px;
	font-size: 20px;
	float: left;
}

.fNum {
	font-size: 40px;
	background-color: black;
	color: white;
	border-radius: 20px;
	border: 5px 5px 5px 5px;
}

.titlef:hover {
	background: beige;
	cursor: pointer;
}

.content-area {
	display: none;
}

.contentD {
	background: whitesmoke;
	height: 100px;
}

#selSearchOption {
	width: 100px;
}

.pagingArea {
	margin-left: 100px;
	
}
.pagingArea button {
	border-radius: 20px;
	background: beige;
	height: 25px;
	width: 40px
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
	background: black;
	color:white;
}

#choosen {
	background: skyblue;
}

#listArea {
	margin: auto;
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

							<div>
								<li id="title"><img src="image/support/FAQ.png"></li>

								<p style="color: gray;">궁금하신 사항을 선택해 주세요</p>
								<hr>
								<!-- 검색 폼 영역 -->
								<li id='liSearchOption'>

									<form action='<%=request.getContextPath()%>/faq.sv'>
										<select id='selSearchOption' name="option">
											<option value='A'>제목+내용</option>
											<option value='T'>제목</option>
											<option value='C'>내용</option>
										</select> <input id='txtKeyWord' name="search" /> <input type='button'
											value='검색' />
									</form>
								</li>
							</div>

							<!-- 페이징 -->

							<table id="ftable">
								<tr>
									<td id="f1e"><b>Q&A</b></td>
									<td id="f2e"><b>자주묻는 질문</b></td>
								</tr>

								<%
									if (list.isEmpty()) {
								%>
								<tr>
									<td colspan="2">존재하는 질문이 없습니다.</td>
								</tr>
								<%
									} else {

										for (OftenQuery n : list) {
								%>
								<tr class="ftr">
									<td class="fNum"><%=n.getqNum()%></td>
									<td class="titlef"><%=n.getqTitle()%></td>
								</tr>

								<tr class="content-area">
									<td></td>
									<td class="contentD"><%=n.getqContent()%></td>
								</tr>


								<%
									}
								%>
								<%
									}
								%>
							</table>
					</div>

					<div class="pagingArea" align="center">
						<%
							if (!list.isEmpty()) {
						%>
						<!-- 맨 처음으로 -->
						<button
							onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=1&option=<%=option%>&search=<%=search%>'">&lt;&lt;</button>

						<!-- 이전 페이지로 -->
						<button
							onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=currentPage - 1%>&option=<%=option%>&search=<%=search%>'"
							id="beforeBtn">&lt;</button>
						<script>
							if (
						<%=currentPage%>
							<= 1) {
								$('#beforeBtn').attr('disabled', 'true');
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
							onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=p%>&option=<%=option%>&search=<%=search%>'"><%=p%></button>
						<%
							}
						%>
						<%
							}
						%>

						<!-- 다음 페이지로 -->
						<button id="afterBtn"
							onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=currentPage + 1%>&option=<%=option%>&search=<%=search%>'">&gt;</button>
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
							onclick="location.href='<%=request.getContextPath()%>/faq.sv?currentPage=<%=maxPage%>&option=<%=option%>&search=<%=search%>'
									
									">&gt;&gt;</button>
						<%
							}
						%>
					</div>

				</section>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('.ftr').click(function() {
				$(this).next().slideToggle()
			});
		});
	</script>


</body>
</html>