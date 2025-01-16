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

<title>공지사항 상세페이지</title>
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
.others tr {
    border-left: none; 
    border-right: none; 
}
.subtitle {
    margin-top: 15px;
    margin-bottom: 15px;
}
.title {
    font-size: 26px; 
    font-weight: bold; 
    text-align: center;
}
.notice-title {
    font-size: 20px; 
    font-weight: bold;
    margin-bottom: 20px; 
}
.notice_content {
	margin-bottom: 40px;
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
.logo {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 150px;
	height: 50px;
}
.logo img {
	width: 100%;
	height: 100%;
	object-fit: contain;  /* 이미지 비율을 유지하며 네모에 맞게 잘라냄 */
}
.cs-impormation {
	display: flex;
	gap: 20px;
}
.impormation-detail {
	margin-top: 5px;
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
      <div class="title">공지사항</div>
      <!-- 구분선 추가 -->
      <hr style="border: 1px solid #ccc; margin: 20px 0;">
  
      <div class="notice-title">${vo.notice_title}</div>
      <div class="cs-impormation">
        <div class="logo"><img src="/images/logo/logo.svg"></div>
        <div class="impormation-detail">찾았닷컴 고객센터<br>${vo.notice_regdate}</div>
      </div>
      <!-- 구분선 추가 -->
      <hr style="border: 1px solid #ccc; margin: 20px 0;">
  
      <div class="notice_content"><pre>${vo.notice_content}</pre></div>
  
      <div class="others">
        <table>
          <colgroup>
            <col style="width: 15%;">
            <col style="width: 20%;">
            <col style="width: 40%;">
            <col style="width: 25%;">
          </colgroup>
          <tbody>
            <tr>
              <td>이전</td>
              <c:choose>
                <c:when test="${pv != null}">
                <td>${pv.notice_title}</td>
                <td style="font-weight: bold;"><a href="/Cs/Noticeview?notice_idx=${pv.notice_idx}">${pv.notice_content}</td>
                <td>${pv.notice_regdate}</td>
                </c:when>
              <c:otherwise>         
                <td colspan="3" style="text-align: center;">이전 글이 없습니다.</td>
              </c:otherwise>
              </c:choose>
            </tr>
            <tr>
              <td>다음</td>
              <c:choose>
                <c:when test="${nt != null}">
                <td>${nt.notice_title}</td>
                <td style="font-weight: bold;"><a href="/Cs/Noticeview?notice_idx=${nt.notice_idx}">${nt.notice_content}</td>
                <td>${nt.notice_regdate}</td>
                </c:when>
              <c:otherwise>
                <td colspan="3" style="text-align: center;">다음 글이 없습니다.</td>
              </c:otherwise>
              </c:choose>
            </tr>
          </tbody>
        </table>
      </div>
  
      <div class="button" >   
        <a class="btn btn-light-gray" 
           href="/Cs/Noticelist">목록</a>
      </div>  
    </div> 
  
    <div class="cs-nav">
      <table>
        <tr><td><a href="/Cs/Mycslist?user_idx=${sessionScope.user.user_idx}">문의내역 확인하기</a></td></tr>
        <tr><td><a href="#">아이디/비밀번호찾기</a></td></tr>
        <tr><td><a href="#">마이페이지</a></td></tr>
        <tr><td><a href="/Cs/CswriteForm?user_idx=${sessionScope.user.user_idx}">문의글 작성</a></td></tr>
        <tr style="background-color: #ccc;"><td><a href="/Cs/Noticelist">공지사항</a></td></tr>
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

</body>
</html>
