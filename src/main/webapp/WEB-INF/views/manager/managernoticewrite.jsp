<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/images/favicon/favicon.svg"/>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<title>고객센터 관리</title>
<style>
.cs-nav {
    max-width: 200px;
    margin-left: 20px;
}
.sidebar {
    width: 200px;
    border-right: 1px solid #ddd;
    padding: 10px;
    margin-top: 20px;
}
.sidebar li {
    font-size: 15px;
    margin-bottom: 10px;
    border-bottom: 1px solid #ddd;
}
.sidebar a {
    text-decoration: none;
    display: block;
    padding: 10px;
}
.sidebar a:hover {
    background-color: #CCC;
}
.dropdown-menu {
    display: none;
    left: 100%;
    background-color: #fff;
}
.dropdown-menu a {
    padding: 10px;
    width: 150px;
    border-top: 1px solid #ddd;
}
.sidebar li:hover .dropdown-menu {
    display: block;
}
.title {
    font-size: 26px;
    font-weight: bold;
    padding: 20px 0;
    border-left: none;
    border-right: none;
}
form {
    padding: 30px;
    border: 1px solid #ddd;
    border-radius: 10px;
    
}
label {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
    display: block;
}
textarea, input[type="text"] {
    font-size: 18px;
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    resize: none;
}

textarea {
    height: 150px;
}

button {
    margin-top: 10px; 
    padding: 10px 20px;  
    font-size: 15px; 
    cursor: pointer;
    border: none;
    border-radius: 5px;
}
button:hover {
    background-color: #CCC;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>

<div class="inner" style="display: flex;">
    <div class="sidebar">
        <ul>
            <li>
                <a href="/Manager/ManagerCsList" style="font-size: 18px; font-weight: bold;">고객센터 관리</a>
            </li>
            <li>
                <a href="/Manager/ManagerCsList">문의내역</a>
                <a href="/Manager/ManagerNoticeList" style="background-color: #CCC">공지사항</a>
                <a href="/Manager/ManagerAsklist">자주 묻는 질문</a>
            </li>    
            <li>
                <a href="#" style="font-size: 18px; font-weight: bold;">상품 및 카테고리 관리</a>
                <div class="dropdown-menu">
                    <a href="">PC</a>
                    <a href="">노트북</a>
                    <a href="">주요부품</a>
                    <a href="">주변기기</a>
                    <a href="">카테고리 필터</a>
                </div>
            </li>
            <li>
                <a href="/Manager/ManagerBoardList" style="font-size: 18px; font-weight: bold;">커뮤니티 관리</a>
                <div class="dropdown-menu">
                    <a href="/Manager/ManagerBoardList">자유게시판</a>
                    <a href="/Manager/ManagerAlbumList">조립앨범</a>
                    <a href="/Manager/ManagerMarketList">장터</a>
                </div>
            </li>
        </ul>
    </div>
    
    <div style="flex: 1; margin: 30px;">
        <form action="/Manager/ManagerNotieWrite" method="POST">
            
            <div style="padding-bottom: 20px; border-bottom: 1px solid black;">
            <label for="notice_type">[공지 유형 선택]</label>
            <div id="notice_type" style="display: flex; gap: 10px; font-size: 18px;">
                <label>
                    <input type="radio" name="notice_type" value="긴급점검" 
                        <c:if test="${csVo.notice_type == '긴급점검'}">checked</c:if> required> 긴급점검
                </label>
                <label>
                    <input type="radio" name="notice_type" value="수정안내" 
                        <c:if test="${csVo.notice_type == '수정안내'}">checked</c:if> required> 수정안내
                </label>
                <label>
                    <input type="radio" name="notice_type" value="업데이트" 
                        <c:if test="${csVo.notice_type == '업데이트'}">checked</c:if> required> 업데이트
                </label>
                <label>
                    <input type="radio" name="notice_type" value="서비스" 
                        <c:if test="${csVo.notice_type == '서비스'}">checked</c:if> required> 서비스
                </label>
                <label>
                    <input type="radio" name="notice_type" value="이벤트" 
                        <c:if test="${csVo.notice_type == '이벤트'}">checked</c:if> required> 이벤트
                </label>
            </div>
        </div>
		
		<div style="padding-bottom: 20px; border-bottom: 1px solid black; margin-top: 20px;">
            <label for="notice_title">[제목]</label>
            <input type="text" id="notice_title" name="notice_title" value="${csVo.notice_title}" />

            <label for="notice_content" style="margin-top: 20px;">[내용]</label>
            <textarea id="notice_content" name="notice_content">${csVo.notice_content}</textarea>
        </div>

        <div style="display: flex; justify-content: center; gap: 20px; padding-top: 20px;">
            <button type="button" onclick="location.href='/Manager/ManagerNoticeList'">목록</button>
            <button type="submit">저장</button>
        </div>
        
        </form>
    </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
