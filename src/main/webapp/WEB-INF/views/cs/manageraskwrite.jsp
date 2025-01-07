<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
textarea {
    font-size: 18px;
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    resize: none;
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
                <a href="/Cs/ManagerCsList" style="font-size: 18px; font-weight: bold;">고객센터 관리</a>
            </li>
            <li>
                <a href="/Cs/ManagerCsList">문의내역</a>
                <a href="/Cs/ManagerNoticeList">공지사항</a>
                <a href="/Cs/ManagerAsklist">자주 묻는 질문</a>
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
                <a href="/Cs/ManagerBoardList" style="font-size: 18px; font-weight: bold;">커뮤니티 관리</a>
                <div class="dropdown-menu">
                    <a href="/Cs/ManagerBoardList">자유게시판</a>
                    <a href="/Cs/ManagerAlbumList">조립앨범</a>
                    <a href="/Cs/ManagerMarketList">장터</a>
                </div>
            </li>
        </ul>
    </div>
    
    <div style="flex: 1; margin: 30px;">
        <form action="/Cs/ManagerAskWrite" method="POST">
            
            <div style="padding-bottom: 20px; border-bottom: 1px solid black;">
                <label for="customer_service_type">질문 유형 선택</label>
                <div id="customer_service_type" style="display: flex; gap: 10px; font-size: 18px;">
                    <label><input type="radio" name="customer_service_type" value="회원" required> 회원</label>
                    <label><input type="radio" name="customer_service_type" value="PC견적"> PC견적</label>
                    <label><input type="radio" name="customer_service_type" value="브랜드관"> 브랜드관</label>
                    <label><input type="radio" name="customer_service_type" value="커뮤니티"> 커뮤니티</label>
                    <label><input type="radio" name="customer_service_type" value="공지"> 공지</label>
                </div>
            </div>

            
            <div style="padding-bottom: 20px; border-bottom: 1px solid black; margin-top: 20px;">
                
                <label for="customer_service_title">Q.</label>
                <textarea id="customer_service_title" name="customer_service_title" required /></textarea>
                
                <label for="customer_service_content" style="margin-top: 20px;">A.</label>
                <textarea id="customer_service_content" name="customer_service_content" required></textarea>
                
            </div>

            
            <div style="display: flex; justify-content: center; gap: 20px; padding-top: 20px;">
                <button type="button" onclick="location.href='/Cs/ManagerAsklist'">목록</button>
                <button type="submit">저장</button>
            </div>
        </form>
    </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
