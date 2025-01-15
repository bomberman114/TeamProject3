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

<title>커뮤니티 관리</title>
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
table {
    width: 100%;
    table-layout: fixed;
    text-align: center;
    border-collapse: collapse;
}
th {
    font-size: 20px;
    font-weight: bold;
}
th, td {
    padding: 15px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
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
    border-bottom: none;
}
tbody tr:hover {
    background-color: #f1f1f1;
}

.content {
    display: grid;
    gap: 40px 20px;
    grid-template-columns: repeat(4, 1fr);
}

.box {
    overflow: hidden;
}

.box-img {
    width: 100%;
    height: 180px;
    background: #ccc;
    margin-bottom: 8px;
    position: relative;
    
    img {
    	width:100%;
    	height: 100%;
    	object-fit: cover;
    }
}
.box-title {
    text-overflow: ellipsis;
    overflow: hidden;
    word-break: break-word;
    display: -webkit-box;
    line-clamp: 2;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    font-weight: bold;
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
                <div class="dropdown-menu">
                    <a href="/Manager/ManagerCsList">문의내역</a>
                    <a href="/Manager/ManagerNoticeList">공지사항</a>
                    <a href="/Manager/ManagerAsklist">자주 묻는 질문</a>
                </div>
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
            </li>
            <li>
                <a href="/Manager/ManagerBoardList">자유게시판</a>
                <a href="/Manager/ManagerAlbumList" style="background-color: #CCC">조립앨범</a>
                <a href="/Manager/ManagerMarketList">장터</a>
            </li>
        </ul>
    </div>

    <div style="flex: 1; margin: 30px;">
    	<div style="width: 100%;
				    text-align: center;
				    font-size: 26px;
				    font-weight: bold;
				    padding: 20px;
				    border-top: 1px solid black;">
        조립앨범
    	</div>
    	<div class="content">
		  <c:forEach var="album" items="${albumList}" >
		  <div class="box">
			<div class="box-img"><a href="/Community/Albumview?user_idx=${sessionScope.user.user_idx}&community_idx=${album.community_idx}"><img src="/images/${album.community_sfile_name}"></a></div>
			<div class="box-title"><a href="/Community/Albumview?user_idx=${sessionScope.user.user_idx}&community_idx=${album.community_idx}">${album.community_title}</a></div>
			<div class="box-nickname">${album.user_nickname}</div>
			<div style="text-align: right;">👁️‍🗨️ ${album.community_views} | 💬 ${album.total_answers}</div>
		  </div>
		  </c:forEach>
		</div>
    </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>
<script>
</script>
</body>
</html>
