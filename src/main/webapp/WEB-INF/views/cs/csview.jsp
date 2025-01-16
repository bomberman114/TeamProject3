<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/images/favicon/favicon.svg"/>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />

<title>고객센터 상세페이지</title>
<style>
.title {
    text-align: center;
    margin-top: 80px;
    margin-bottom: 40px;
    font-weight: bold;
    font-size: 36px;
}
input[type="search"] {
    width: 720px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box;
    margin-bottom: 40px;
}
button {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #1A3D91;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}
button:hover {
    background-color: #1554b5;
}
.subtitle {
    margin-top: 15px;
    margin-bottom: 15px;
}
.search-title {
	margin-left: 10px;
	margin-bottom: 20px;
}
.cslist {
width: 98%;
	padding: 10px;
	border-top: 1px solid #ccc;
	margin: 0 auto; /* 중앙 정렬 */
}
.cslist:last-child {
    border-bottom: 1px solid #ccc;
}
.bold {
    font-size: 20px;
    font-weight: bold;
    padding: 10px;
}
.highlight {
	color: #1554b5;
	font-weight: bold;
}
.button {
	display: flex;
	justify-content: center; 
	margin-top: 40px;
}
.btn-light-gray {
    background-color: #ccc;
    border: none;
    padding: 15px 30px;
    font-size:large;
    border-radius: 5px;
    margin: 0 2px;
    color: black;
}
.btn-light-gray:hover {
    background-color: #c0c0c0; /* 호버 시 색상 */
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>

<div class="inner">  
  <div class="subtitle">고객센터 홈 > 자주하는질문</div> 
  <div>   
    <div class="title">   
      <h2>무엇을 도와 드릴까요?</h2>
    </div>

    <div style="text-align: center;">
      <input class="form-control me-2" type="search" name="searchtext" id="searchtext" placeholder="자주하는 질문을 검색해주세요." aria-label="Search">
      <button type="submit" name="imgclick" id="imgclick">검색</button>
    </div>
  </div>
  
  <!-- 구분선 추가 -->
  <hr style="border: 1px solid #ccc; margin: 20px 0;">
  
  <div>
    <div class="bold">Q. ${vo.customer_service_title}</div>
    <div></div>
    <div style="margin-left:10px;"><pre>${vo.customer_service_content}</pre></div>
  </div>
  
  <!-- 구분선 추가 -->
  <hr style="border: 1px solid #ccc; margin: 20px 0;">
  
  <div class="button" >   
    <a class="btn btn-light-gray" 
       href="/Cs/CswriteForm?user_idx=${sessionScope.user.user_idx}">문의글 작성</a>
    <a class="btn btn-light-gray" 
       href="/Cs/Cslist">목록</a>
  </div>
  
</div>   
 

<%@include file="/WEB-INF/include/footer.jsp"%>
<script>
document.getElementById('imgclick').addEventListener('click', function() {
	const searchtext = document.getElementById('searchtext').value;
	if (searchtext) {
		window.location.href = '/Cs/Cssearch?searchtext=' + encodeURIComponent(searchtext);
	} else {
		alert('검색어를 입력해주세요.');
	}
});

const searchtext = "${searchtext}";
if (searchtext) {
    document.querySelectorAll('.search-highlight').forEach(el => {
    const regex = new RegExp(`(${searchtext})`, 'gi');
    el.innerHTML = el.textContent.replace(regex, `<span class="highlight">$1</span>`);
  });
}
</script>
</body>
</html>
