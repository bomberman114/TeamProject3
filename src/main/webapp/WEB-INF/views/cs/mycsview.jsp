<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/images/favicon/favicon.svg"/>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />

<title>나의 문의내역 상세페이지</title>
<style>
.cs-nav {
    max-width: 200px; /* 고정된 너비 */  
    margin-left: 20px; /* 왼쪽 여백 추가 */
}
.mycs-title {
    max-width: 120px; /* 고정된 너비 */  
    margin-right: 18px; /* 오른쪽 여백 추가 */
    font-size: 20px;
    font-weight: bold;
    
    tr {
    	border:none;
    }
    
    td {
    	padding: 0;
    }
}

table {
    width: 100%;
    table-layout: fixed; /* 고정 레이아웃을 적용 */
    border-collapse: collapse;
    text-align: center;
}   
th {
    font-size: 18px;
    font-weight: bold;
    width: 15%;
}
th, td {
    padding: 15px;
    white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
    overflow: hidden; /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
}
tr {
    border: 1px solid black; 
}
.mycs {
	tr {
	    border-top: none; 
    	border-right: none; 
    	border-bottom: none; 
	}
	
	td {
		padding: 25px;
	}
	
	td:first-child {
		width: 2%;
	}
}
.mycs-content {
	border: 1px solid black;
	text-align: left;
}
.subtitle {
    margin-top: 15px;
    margin-bottom: 15px;
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
}
.btn-light-gray:hover {
    background-color: #c0c0c0; /* 호버 시 색상 */
}
.flex {
	display: flex;
	gap: 20px;
	align-items: center; /* 세로 가운데 정렬 */
}
.alphabet {
    font-size: 30px;
    font-weight: bold;
}
.cs-title {
    font-size: 18px;
    font-weight: bold;
}
.logo {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 150px;
	height: 28px;
}
.logo img {
	width: 100%;
	height: 100%;
	object-fit: contain;  /* 이미지 비율을 유지하며 네모에 맞게 잘라냄 */
}
.regdate {
	margin-top: 10px;
	margin-left: 20px;
}
.content {
	margin-top: 10px;
	margin-left: 20px;
	border: 1px solid black;
	height: 250px;
	width: 95%;
	
	div {
		padding: 10px;
	}
}
.bold {
    font-size: 20px;
    font-weight: bold;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>

<div class="inner">
  <div class="subtitle">고객센터 홈 > 나의 문의내역</div>

  <div style="display: flex;">
  
    <div class="mycs-title">
      <table>
        <tr>
          <td>나의 문의내역</td>
        </tr>
      </table>
    </div>
    
    <div class="mycs">
      <table>
        <tr>
         <td></td>
         <td class="mycs-content">
           <div class="flex">
             <div class="alphabet">Q.</div>
             <div class="cs-title">${vo.customer_service_title}</div>
           </div>
           <div class="regdate">${vo.customer_service_regdate}</div>
           <div class="content">
           	 <div>
           	   <pre>${vo.customer_service_content}</pre>
             </div>
           </div><br><br><br>
           
           <div class="flex">
             <div class="alphabet">A.</div>
             <div class="logo"><img src="/images/logo/logo.svg"></div>
               <div>찾았닷컴 고객센터</div>
             </div>
           </div>
           <div class="regdate">${aw.customer_service_answer_regdate}</div>
             <c:choose>
               <c:when test="${aw != null}">
               <div class="content"><div><pre>${aw.customer_service_answer_content}</pre></div></div>
               </c:when>
             <c:otherwise>
               <div class="content"><div>문의해 주셔서 감사합니다.<br><br>현재 검토 중이며, 곧 답변 드리겠습니다.</div></div>
             </c:otherwise>
             </c:choose>
                
           <div class="button" >   
             <a class="btn btn-light-gray" 
                href="/Cs/Mycslist?user_idx=${sessionScope.user.user_idx}">목록</a>
           </div>
         </td>
        </tr>   
      </table>  
    </div> 
  
    <div class="cs-nav">
      <table>
        <tr style="background-color: #ccc;"><td><a href="/Cs/Mycslist?user_idx=${sessionScope.user.user_idx}">문의내역 확인하기</a></td></tr>
        <tr><td><a href="#">아이디/비밀번호찾기</a></td></tr>
        <tr><td><a href="#">마이페이지</a></td></tr>
        <tr><td><a href="/Cs/CswriteForm?user_idx=${sessionScope.user.user_idx}">문의글 작성</a></td></tr>
        <tr><td><a href="/Cs/Noticelist">공지사항</a></td></tr>
        <tr>
          <td>
            <div class="bold">1:1 상담 센터</div>
              0000-0000<br>
              평일 09:00 ~ 18:00
          </td>
        </tr>
      </table>
    </div> 
          
  </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>

<script>
const goMain = document.getElementById('goMain')
	goMain.onclick = function() {
		location.href = '/Cs/Mycslist?user_idx=${sessionScope.user.user_idx}'
};
</script> 
</body>
</html>
