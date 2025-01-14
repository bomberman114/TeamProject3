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
}

tbody tr:hover {
    background-color: #f1f1f1;
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
                <a href="/Manager/ManagerNoticeList">공지사항</a>
                <a href="/Manager/ManagerAsklist" style="background-color: #CCC">자주 묻는 질문</a>
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
        <table>
            <colgroup>
                <col style="width: 20%;">
                <col style="width: 50%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
            </colgroup>
            <thead>
                <tr class="title">
				    <td colspan="4" style="text-align: center; position: relative;">
				    <form method="get" action="/Manager/ManagerAsklist">
				    	<select name="type" onchange="this.form.submit()" style="position: absolute; left: 10px; font-size: 15px; cursor: pointer; padding:10px; border-radius:5px;">
					        <option value="">전체</option>
					        <c:forEach var="typeItem" items="${askType}">
					            <option value="${typeItem}" <c:if test="${typeItem == selectedType}">selected</c:if>>${typeItem}</option>
					        </c:forEach>
					    </select>
					    <input type="hidden" name="page" value="1">
					    <input type="hidden" name="size" value="${size}">
					</form>
				    자주묻는질문
				    <button style="position: absolute; right: 10px; padding: 10px; background-color: #fff; font-size: 15px; cursor: pointer; border-radius:5px;" 
				            onclick="location.href='/Manager/ManagerAskWriteForm'">질문 추가</button>
				    </td>
				</tr>
                <tr>
                    <th>분류</th>
                    <th>질문</th>
                    <th>작성일</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
			    <c:choose>
			        <c:when test="${empty askList}">
			            <tr>
			                <td colspan="4" style="text-align: center; padding: 20px;">
			                    게시물이 없습니다.
			                </td>
			            </tr>
			        </c:when>
			        <c:otherwise>
			            <c:forEach var="ask" items="${askList}">
			                <tr onclick="location.href='/Manager/ManagerAskUpdateForm?customer_service_idx=${ask.customer_service_idx}'" style="cursor: pointer;">
			                    <td>[${ask.customer_service_type}]</td>
			                    <td>${ask.customer_service_title}</td>
			                    <td>${ask.customer_service_regdate}</td>
			                    <td>
			                        <form action="/Manager/ManagerAskDelete" method="POST" onsubmit="return confirm('정말 삭제하시겠습니까?');" style="margin: 0;">
			                            <input type="hidden" name="customer_service_idx" value="${ask.customer_service_idx}" />
			                            <button type="submit" style="border: none; cursor: pointer; background: none;" onclick="event.stopPropagation();">X</button>
			                        </form>
			                    </td>
			                </tr>
			            </c:forEach>
			        </c:otherwise>
			    </c:choose>
			</tbody>

        </table>	      
        
        <%@include file="/WEB-INF/include/pagination.jsp"%>
		
    </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>
<script>
</script>
</body>
</html>
