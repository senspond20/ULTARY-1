<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, admin.model.vo.*"%>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>) request.getAttribute("list");

	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	String option = (String) request.getAttribute("option");
	String search = (String) request.getAttribute("search");
    String check = (String) request.getAttribute("check");
	//int listCount = (int) request.getAttribute("listCount");
	
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/support.css">
<style>
li {
	list-style: none;
}
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: skyblue;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

.tp {
	margin: 0px;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
}

#mainWrapper p {
	text-align: center;
	font-size: 20px;
}

#searchArea {
	text-align: center;
}

#type12 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	background: white;
}

#type12 th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: skyblue;
}

#type12 td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: none;
}

#type12 tcon {
	
}

.tcon {
	display: none;
}

.tcon2 {
	display: none;
}

#incont {
	text-align: left;
	border: 3px solid whitesmoke;
	height: 120px;
}
.pagingArea{
	margin-top: 20px;
}
.pagingArea button {
	border-radius: 10px;
	background: beige;
	height: 25px;
	width: 50px
}

#numBtn {
	background: skyblue;
}

#choosen {
	background: #FFD8D8;
}

button:hover {
	cursor: pointer;
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
						<br>
						<p>문의 게시판(관리자용)</p>
						<hr>

						<!-- 검색영역 -->
						<div id="searchArea">
							<form action = "<%=request.getContextPath()%>/list.inq">
								<select id='selSearchOption' name="option">
									<option value='A'>제목+내용</option>
									<option value='U'>아이디</option>
								</select> <input id='txtKeyWord' name="search" /> <input type="submit"
									value='검색' /> <label class="switch"> <input
									type="checkbox" name="check"> <span
									class="slider round"></span>
								</label> 답변여부
								<p class="tp">N</p>
								<p class="tp" style="display: none;">Y</p>
							</form>
						</div>



						<table id="type12">
							<thead>
								<tr>
									<th scope="cols" width="50px">번호</th>
									<th scope="cols" width="300px">제목</th>
									<th scope="cols" width="100px">문의날짜</th>
									<th scope="cols" width="80px">답변여부</th>
									<th scope="cols" width="100px">답변날짜</th>
									<th scope="cols" width="80px">아이디</th>
								</tr>
							</thead>
							<tbody>
								<!-- 게시물이 출력될 영역 -->
								<%
									if (list.isEmpty()) {
								%>
								<tr>
									<td colspan="5">존재하는 문의글이 없습니다.</td>
								</tr>
								<%
									} else {
										for (Inquiry n : list) {
								%>
								<tr class="mcon">
									<td><%=n.getInquirynum()%></td>
									<td><%=n.getInquirytitle()%></td>
									<td><%=n.getInquirydate()%></td>
									<td><%=n.getAnswer()%></td>
									<td><%=n.getAnswerdate() %></td>
									<td><%=n.getMemeberid()%></td>
								</tr>

								<tr class="tcon">
									<td></td>
									<td colspan="4">
										<div id="incont">
											Q : <%=n.getInquirycontent()%>
										</div>
										<div id="incont">
											A : <%=n.getAns_content() %>
										</div>
									</td>
									<td></td>
								</tr>

								<tr class="tcon2">
									
									<form action="<%=request.getContextPath()%>/answer.inq">
										
										<td colspan="5">
										<input type= "hidden" name = "no" value ="<%=n.getInquirynum()%>">
										<textarea rows="15px" cols="80px" name="answer"></textarea>
										</td>
										<td> 
											<input type="submit" value="답변" />
											<button onclick="cancel();">취소</button>
										</td>
									</form>
								</tr>

								<%
									}
									}
								%>
							</tbody>
						</table>
					</div>
					
					<!-- 페이징 -->
					<div class="pagingArea" align="center">
						<%
							if (!list.isEmpty()) {
						%>
						<!-- 맨 처음으로 -->
						<button onclick="location.href='<%=request.getContextPath()%>/list.inq?currentPage=1&option=<%=option%>&search=<%=search%>&check=<%=check%>'">&lt;&lt;</button>
	
						<!-- 이전 페이지로 -->
						<button
							onclick="location.href='<%=request.getContextPath()%>/list.inq?currentPage=<%=currentPage - 1%>&option=<%=option%>&search=<%=search%>&check=<%=check%>'"
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
							onclick="location.href='<%=request.getContextPath()%>/list.inq?currentPage=<%=p%>&option=<%=option%>&search=<%=search%>&check=<%=check%>'"><%=p%></button>
						<%
							}
						%>
						<%
							}
						%>
	
						<!-- 다음 페이지로 -->
						<button id="afterBtn"
							onclick="location.href='<%=request.getContextPath()%>/list.inq?currentPage=<%=currentPage + 1%>&option=<%=option%>&search=<%=search%>&check=<%=check%>'">&gt;</button>
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
						<button onclick="location.href='<%=request.getContextPath()%>/list.inq?currentPage=<%=maxPage%>&option=<%=option%>&search=<%=search%>&check=<%=check%>'
							
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
			$('.mcon td').mouseenter(function() {
				$(this).parent().css({
					'background' : 'beige',
					'cursor' : 'pointer'
				})
			}).mouseout(function() {
				$(this).parent().css({
					'background' : 'white'
				})
			}).click(function() {
				$(this).parent().css({
					'color' : 'red'
				})
			});
			
			$('.mcon').click(function() {
				$(this).next().slideToggle();
				$(this).next().next().slideToggle();
			});
		});
		$(function() {
			var check = $("input[type='checkbox']");
			check.click(function() {
				$(".tp").toggle();
			});			
		});
	</script>


</body>
</html>