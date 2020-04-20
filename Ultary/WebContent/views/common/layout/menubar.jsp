<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>

/* --카테고리 바------------------------------------------------ */

#category{
	min-width: 1200px;
	border-bottom: 3px solid #5CD1E5;
}

@import url(http://fonts.googleapis.com/css?family=Raleway);
#cssmenu,
#cssmenu>ul,
#cssmenu>ul>li,
#cssmenu>ul>li>a {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  line-height: 1;
  display: block;
  position: relative;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;

}
#cssmenu:after,
#cssmenu>ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
#cssmenu {
  font-family: Raleway, sans-serif;
  line-height: 1;
  width: 1060px;
  margin: 0 auto;
}
#cssmenu>ul {
	background: #ffffff;
 	margin-left: 151.7px;
	width: 770px;
}
#cssmenu > ul > li {
  float: left;
  width: 150px;
  text-align: center;
}
#cssmenu.align-center > ul {
  font-size: 0;
  text-align: center;
}
#cssmenu.align-center > ul > li {
  display: inline-block;
  float: none;
}
#cssmenu.align-right > ul > li {
  float: right;
}
#cssmenu.align-right > ul > li > a {
  margin-right: 0;
  margin-left: -4px;
}
#cssmenu > ul > li > a {
  z-index: 2;
  padding: 18px 25px 12px 25px;
  font-size: 15px;
  font-weight: 400;
  text-decoration: none;
  color: #444444;
  -webkit-transition: all .2s ease;
  -moz-transition: all .2s ease;
  -ms-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  margin-right: -4px;
}
#cssmenu > ul > li.active > a,
#cssmenu > ul > li:hover > a,
#cssmenu > ul > li > a:hover {
  color: #ffffff;
}
#cssmenu > ul > li > a:after {
  position: absolute;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: -1;
  width: 100%;
  height: 120%;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
  content: "";
  -webkit-transition: all .2s ease;
  -o-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-transform: perspective(5px) rotateX(2deg);
  -webkit-transform-origin: bottom;
  -moz-transform: perspective(5px) rotateX(2deg);
  -moz-transform-origin: bottom;
  transform: perspective(5px) rotateX(2deg);
  transform-origin: bottom;
}
#cssmenu > ul > li.active > a:after,
#cssmenu > ul > li:hover > a:after,
#cssmenu > ul > li > a:hover:after {
  background: #5CD1E5;
}

#menu1{
	margin: 0;
    padding: 0;
    border: 0;
    width: 154.9px;
    height: 220px;
    position: absolute;
    list-style: none;
    border-radius: 10px;
    top: 41.9px;
    background: #5CD1E5;
    display:none;
}
#menu1 li{
	background: #5CD1E5;
    font-size: 15px;
    font-weight: 400;
    color: white;
    margin-top: 24.4px;
}
#menu1 a{
	text-decoration: none;
	color:white;
}
#cssmenu>ul>li:hover #menu1{
	display:block;
}
#menu2{
	margin: 0;
    padding: 0;
    border: 0;
    width: 154.9px;
    height: 260px;
    position: absolute;
    list-style: none;
    border-radius: 10px;
    top: 41.9px;
    background: #5CD1E5;
    display:none;
}
#menu2 li{
	background: #5CD1E5;
    font-size: 15px;
    font-weight: 400;
    color: white;
    margin-top: 24.4px;
}
#menu2 a{
	text-decoration: none;
	color:white;
}
#cssmenu>ul>li:hover #menu2{
	display:block;
}
#menu3{
	margin: 0;
    padding: 0;
    border: 0;
    width: 154.9px;
    height: 150px;
    position: absolute;
    list-style: none;
    border-radius: 10px;
    top: 41.9px;
    background: #5CD1E5;
    display:none;
}
#menu3 li{
	background: #5CD1E5;
    font-size: 15px;
    font-weight: 400;
    color: white;
    margin-top: 24.4px;
}
#menu3 a{
	text-decoration: none;
	color:white;
}
#cssmenu>ul>li:hover #menu3{
	display:block;
}
#menu4{
	margin: 0;
    padding: 0;
    border: 0;
    width: 154.9px;
    height: 150px;
    position: absolute;
    list-style: none;
    border-radius: 10px;
    top: 41.9px;
    background: #5CD1E5;
    display:none;
}
#menu4 li{
	background: #5CD1E5;
    font-size: 15px;
    font-weight: 400;
    color: white;
    margin-top: 24.4px;
}
#menu4 a{
	text-decoration: none;
	color:white;
}
#cssmenu>ul>li:hover #menu4{
	display:block;
}
#menu5{
	margin: 0;
    padding: 0;
    border: 0;
    width: 154.9px;
    height: 150px;
    position: absolute;
    list-style: none;
    border-radius: 10px;
    top: 41.9px;
    background: #5CD1E5;
    display:none;
}
#menu5 li{
	background: #5CD1E5;
    font-size: 15px;
    font-weight: 400;
    color: white;
    margin-top: 24.4px;
}
#menu5 a{
	text-decoration: none;
	color:white;
}
#cssmenu>ul>li:hover #menu5{
	display:block;
}
#cssmenu>ul>li>ul{
	z-index:400;
}
#cssmenu a{
	cursor:pointer;
}

</style>
</head>
<body>
   
    

    <div id="category">
        <div id='cssmenu'>
                <ul>
                    <li>
                        <a href="#">내울타리</a>
                        <ul id="menu1">
                            <li><a href='#'>타임라인</a></li>
                            <li><a href='#'>게시글작성</a></li>
                            <li><a href='#'>관심회원</a></li>
                            <li><a href='#'>게시글 즐겨찾기</a></li>
                            <li><a href='#'>내 위탁환경</a></li>
                        </ul>
                    </li>       
                    <li>
                        <a href='#'>커뮤니티</a>
                        <ul id="menu2">
                            <li><a href='#'>공지사항</a></li>
                            <li><a href='#'>모아보기</a></li>
                            <li><a href='#'>펫일상</a></li>
                            <li><a href='#'>펫지식</a></li>
                            <li><a href='#'>펫리뷰</a></li>
                            <li><a href='#'>펫분양</a></li>
                        </ul>
                    </li>
                    <li><a href='#'>위탁매칭</a>
                        <ul id="menu3">
                            <li><a href='#'>위탁검색</a></li>
                            <li><a href='#'>의뢰 관리</a></li>
                            <li><a href='#'>내가 남긴 리뷰</a></li>
                        </ul>
                    </li>
                    <li><a href='#'>마이페이지</a>
                        <ul id="menu4">
                            <li><a href='#'>내 정보 관리</a></li>
                            <li><a href='#'>비밀번호변경</a></li>
                            <li><a href='#'>회원 탈퇴</a></li>
                        </ul>
                    </li>
                    <li><a href='#'>고객센터</a>
                        <ul id="menu5">
                            <li><a href='<%= request.getContextPath() %>/slist.no'>공지 사항</a></li>
                            <li><a href='<%= request.getContextPath() %>/faq.sv'>자주하는 질문</a></li>
                            <li><a
							href='<%=request.getContextPath()%>/views/support/InquirySend.jsp'>1:1
								문의</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
    </div>
    
    
</body>
</html>
