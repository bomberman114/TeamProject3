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

<title>나의 문의내역</title>
<style>
.cs-nav {
    max-width: 200px; /* 고정된 너비 */  
    margin-left: 20px; /* 왼쪽 여백 추가 */
}
table {
    width: 100%;
    table-layout: fixed; /* 고정 레이아웃을 적용 */
    text-align: center;
    border-collapse: collapse;
    flex-basis: 1;
}   
th {
    font-size: 20px;
    font-weight: bold;
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
.subtitle {
    margin-top: 15px;
    margin-bottom: 15px;
}
.title {
    font-size: 26px; 
    font-weight: bold; 
    padding: 20px 0;
    border-left: none; 
    border-right: none; 
}
tbody tr:hover {
    background-color: #f1f1f1;
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
   <div>     
    <table class="11">
      <colgroup>
        <col style="width: 15%;">
        <col style="width: 40%;">
        <col style="width: 20%;">
        <col style="width: 25%;">
      </colgroup>
      <thead>
        <tr class="title">
          <td colspan="4">나의 문의내역</td>
        </tr>
        <tr>
          <th>답변 상태</th>
          <th>제목</th>
          <th>문의 종류</th>
          <th>문의일</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="mycs" items="${mycsList}">
          <tr>
            <td>#${mycs.customer_service_answer_status}</td>
            <td>
              <a href="/Cs/Mycsview?customer_service_idx=${mycs.customer_service_idx}">
                ${mycs.customer_service_title}
              </a>
            </td>
            <td>${mycs.customer_service_type}</td>
            <td>${mycs.customer_service_regdate}</td>
          </tr>
        </c:forEach>
      </tbody>
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

</script>
</body>
</html>
