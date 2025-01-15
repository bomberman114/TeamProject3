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

<title>커뮤니티 관리</title>
<style>

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
    <%@include file="/WEB-INF/include/sidebar.jsp"%>

    <div style="flex: 1; margin: 30px;">
        <table>
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 25%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
            </colgroup>
            <thead>
                <tr class="title">
                    <td colspan="6">자유게시판</td>
                </tr>
                <tr>
                    <th>추천</th>
                    <th>분류</th>
                    <th>제목</th>
                    <th>닉네임</th>
                    <th>조회수</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <%-- <tbody>
                <c:forEach var="" items="">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </c:forEach>
            </tbody> --%>
        </table>
    </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>
<script>
</script>
</body>
</html>
