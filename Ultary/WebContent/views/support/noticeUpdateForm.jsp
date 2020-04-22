<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sf.format(nowTime);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ULTARY</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
<style>
    #content {
        background: whitesmoke;
        margin-top : 30px;
    }
    #mainWrapper {
        line-height: 2em;
        font-family: "맑은 고딕";
        text-align: center;
        height: 580px;
    }
	.outer{
		width: 600px; height: 500px; background-color: white; 
		border: 3px solid skyblue;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea {width:450px; height:350px; margin-left:auto; margin-right:auto;}
	
	#updateNoBtn, #cancelBtn{
		background: skyblue; 
		color: white; 
		border-radius: 15px; 
		width: 80px; 
		text-align: center; 
		display: inline-block;}
		
	#updateNoBtn:hover, #cancelBtn:hover{
		cursor: pointer;
	}
	#cancelBtn{
		background: black;
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
    <section id ="content">
     <div id ="mainWrapper">
       	
       	<div class="outer">
		<br>
		<h2 align="center">공지사항 수정</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/update.no">
				<table>
					<tr>
						<th>제목</th>
							
						<td colspan="3">
							<input type="hidden" name="no" value="<%= request.getParameter("no") %>">
							<input type="text" name="title" size=50 value="<%= request.getParameter("title") %>">
						</td>				
					</tr>
					<tr>
						<th>작성자</th>
						<td>운영자</td>
						<th>작성일</th>
						<td><%= request.getParameter("date") %></td>
						
						
					</tr>
					<tr>
						<th>내용</th>
						<td></td>
						<th>현재날짜</th>
						<td><%= today%></td>
					</tr>
					
					<tr>
						<td colspan="4">
							<textarea rows="15" cols="60" name="content" style="resize: none;"><%= request.getParameter("content") %></textarea>
						</td>
					</tr>
				</table>
				
				<br>
				<br>
				
				<div align="center">
					<button type="submit" id="updateNoBtn">저장</button>
					<button onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</button>
				</div>
			</form>

		</div>
     </div>
     </div>
     
    </section>
    </div>
   </div>
   </div> 
</body>
	<script>

	</script>
</html>