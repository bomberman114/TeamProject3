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

<title>고객센터 관리</title>
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
    background-color: #CCC;
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
                <col style="width: 35%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
            </colgroup>
            <thead>
                <tr class="title">
                    <td colspan="5" style="text-align: center; position: relative;">
				    <form method="get" action="/Manager/ManagerCsList">
					    <select name="type" onchange="this.form.submit()" style="position: absolute; left: 10px; font-size: 15px; cursor: pointer; padding:10px; border-radius:5px;">
					        <option value="">전체</option>
					        <c:forEach var="typeItem" items="${askType}">
					            <option value="${typeItem}" <c:if test="${typeItem == selectedType}">selected</c:if>>${typeItem}</option>
					        </c:forEach>
					    </select>
					    <input type="hidden" name="page" value="1">
					    <input type="hidden" name="size" value="${size}">
					</form>
				    문의내역
				    </td>
                </tr>
                <tr>
                    <th>분류</th>
                    <th>제목</th>
                    <th>답변상태</th>
                    <th>문의일</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
			    <c:choose>
			        <c:when test="${empty macsList}">
			            <tr>
			                <td colspan="5" style="text-align: center; padding: 20px;">
			                    게시물이 없습니다.
			                </td>
			            </tr>
			        </c:when>
			        <c:otherwise>
			            <c:forEach var="macsList" items="${macsList}">
			                <tr onclick="location.href='/Manager/ManagerCsUpdateForm?customer_service_idx=${macsList.customer_service_idx}'" style="cursor: pointer;">
			                    <td>[${macsList.customer_service_type}]</td>
			                    <td>${macsList.customer_service_title}</td>
			                    <td>
			                        <c:choose>
			                            <c:when test="${fn:length(macsList.customer_service_content) > 0}">
			                                답변완료
			                            </c:when>
			                            <c:otherwise>
			                                답변대기중
			                            </c:otherwise>
			                        </c:choose>
			                    </td>                       
			                    <td>${macsList.customer_service_regdate}</td>
			                    <td>
			                        <form action="/Manager/ManagerCsDelete" method="POST" onsubmit="return confirm('정말 삭제하시겠습니까?');" style="margin: 0;">
			                            <input type="hidden" name="customer_service_idx" value="${macsList.customer_service_idx}" />
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
