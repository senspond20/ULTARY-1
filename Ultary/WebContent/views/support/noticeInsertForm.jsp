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
    }
    .outer{
		width: 600px; height: 500px; background-color: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea {width:450px; height:350px; margin-left:auto; margin-right:auto;}
	#insertNoBtn, #cancelBtn{background: #B2CCFF; color: white; border-radius: 15px; width: 80px; heigth: 25px; text-align: center; display: inline-block;}
	#insertNoBtn:hover, #cancelBtn:hover{cursor: pointer;}
	#cancelBtn{background: #D1B2FF;}
	
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
		<h2 align="center">공지사항 작성</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/sinsert.no" method="post">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" size="50" name="title"></td>				
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%= loginUser.getMemberId()%>
						</td>
						<th>작성일</th>
						<td>
							<%= today %>
						</td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				
				<br>
				
				<div align="center">
					<button type="submit" id="insertNoBtn">등록</button>
					<div onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</div>
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