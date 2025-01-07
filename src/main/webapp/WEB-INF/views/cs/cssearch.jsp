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
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />

<title>공지사항홈</title>
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

</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>

<div class="inner">  
  <div class="subtitle">고객센터 홈 > 검색 결과</div> 
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
    <div class="search-title">'${searchtext}' 관련 검색 결과 <span class="highlight">${searchcount}</span>건</div>
    
    <div>
      <c:forEach var="cs" items="${csList}">
      <div class="cslist">
        <a href="/Cs/Csview?customer_service_idx=${cs.customer_service_idx}">
        <div class="bold search-highlight">Q. ${cs.customer_service_title}</div>
        </a>
        <div class="search-highlight" style="margin-left: 10px;">${cs.customer_service_content}</div>
      </div>
      </c:forEach>
    </div>
  </div>
  
  <!-- 구분선 추가 -->
  <hr style="border: 1px solid #ccc; margin: 20px 0;">
  
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
