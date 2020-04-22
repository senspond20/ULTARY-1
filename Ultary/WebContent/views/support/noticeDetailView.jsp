<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="admin.model.vo.Notice"%>
<%
	Notice notice = (Notice) request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ULTARY</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
<style type="text/css">
#content {
	background: whitesmoke;
	height: 750px;
}

.tableArea {
	width: 500px;
	height: 350px;
	margin-left: auto;
	margin-right: auto;
}

#updateNoBtn, #cancelBtn, #deleteNoBtn {
	background: #B2CCFF;
	color: white;
	border-radius: 15px;
	width: 80px;
	heigth: 25px;
	text-align: center;
	display: inline-block;
}

#updateNoBtn:hover, #cancelBtn:hover, #deleteNoBtn:hover {
	cursor: pointer;
}

#cancelBtn {
	background: #D1B2FF;
}

#deleteNoBtn {
	background: #D5D5D5;
}

#dTable {
	border: 3px solid skyblue;
}

#head {
	font-size: 20px;
	color: blue;
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
					<div class="outer">
						<br>
						<h2 align="center">
							<img src="image/support/notice3.png">
						</h2>
						<div class="tableArea">
							<form action="views/support/noticeUpdateForm.jsp" id="detailForm"
								name="detailForm">
								<table id="dTable">
									<tr id="head">
										<th>제목</th>
										<td colspan="3"><input type="hidden" size="50"
											name="title" value="<%=notice.getN_title()%>"> <input
											type="hidden" size="50" name="no"
											value="<%=notice.getN_num()%>"> <!-- noticeUpdateForm으로 보낼 때 공지사항 번호를 같이 보내야 다시 servlet으로 공지사항 번호를 보낼 수 있으므로 
								 hidden에 같이 넣어둠 --> <%=notice.getN_title()%></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>운영자</td>
										<th>작성일</th>
										<td><input type="hidden" name="date"
											value="<%=notice.getN_date()%>"> <%=notice.getN_date()%>
										</td>
									</tr>
									<tr>
										<th>내용</th>
									</tr>
									<tr>
										<td colspan="4"><textarea name="content" cols="70"
												rows="25" style="resize: none;" readonly><%=notice.getN_content()%></textarea>
										</td>
									</tr>
								</table>

								<br>

								<div align="center">

									<% if (loginUser != null && loginUser.getMemberId().equals("admin")) { %>
									관리자로 접속시 :
									<button type="submit" id="updateNoBtn">수정</button>
									<button type="button" id="deleteNoBtn" onclick="deleteNo();">삭제</button>

									<% } %>
									<div onclick="cancel();" id="cancelBtn">취소</div>
								</div>
							</form>
						</div>
					</div>


				</section>
			</div>
	</div>
	</div>
			<script>
		function deleteNo(){
				var bool = confirm('정말 삭제하시겠습니까?');
				if(bool){
					location.href="<%=request.getContextPath()%>/sdelete.no?no="+<%=notice.getN_num()%>;
					}
			
		}
		
		// 취소하면서 공지사항 페이지로 돌아가고 조회수가 갱신되어야하므로 
		function cancel(){
			location.href = "<%=request.getContextPath()%>/slist.no";
				}
			</script>
</body>
</html>