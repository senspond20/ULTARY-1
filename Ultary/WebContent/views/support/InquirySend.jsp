<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #inputText{
       width: 650px;
       height: 300px;
       text-align: left;
    }
    #submit{
       background-color: rgba(0, 0, 0, 0.658);
       color: white;
       font-size: 22px;
       border-radius: 15px;
       float: right;
       transform: translateX(-90px);
    }
    #content-box{
       background-color: rgb(214, 241, 252);
       width: 800px;
       height: 450px;
       border-radius: 20px;
       margin-left: 50px;
       margin-bottom: 50px;
    }
    #title{
    	width: 400px;
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
        <br>
     	 <h2 align="center">
			<img src ="<%= request.getContextPath() %>/image/support/dog11.png">
        </h2>
        
        <form action ="<%= request.getContextPath() %>/insert.inq" method ="post" onsubmit="return submitcheck();">
        <p style="color: gray;">궁금하신 사항을 입력해 주세요</p>
    	 <hr>
        <div id = "content-box">
       
       	   <br>
           <label>제목 : </label><input type ="text" name ="title" id ="title">
           <br>
           <textarea id ="inputText" name="content"></textarea><br>
           
           <button type="submit" id ="submit">문의하기</button>
           
           <br><br><br><br>
        </div>
        <br>
        </form>
        
       
        <form action ="<%= request.getContextPath() %>/list.inq">
         <% if (loginUser != null && loginUser.getMemberId().equals("admin")) { %>
			<button id="reply">문의글 답변하기(관리자용)</button>
				<% } %>
		 </form>
	
        
     </div>
    </section>
    </div>
   </div>
   </div> 
</body>
	<script>

	function submitcheck() {
		
		alert('성공적으로 전송되었습니다.');
		return true;	
	}
	</script>
</html>