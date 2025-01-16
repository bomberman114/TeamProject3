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
                <col style="width: 10%;">
                <col style="width: 50%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
            </colgroup>
            <thead>
                <tr class="title">
				    <td colspan="5" style="text-align: center; position: relative;">
					    <select name="type" onchange="location.href='?type=' + this.value" 
				                style="position: absolute; left: 10px; font-size: 15px; cursor: pointer; padding: 10px; border-radius: 5px;">
				            <option value="latest" ${selectedType == null || selectedType == 'latest' ? 'selected' : ''}>최신순</option>
				            <option value="views" ${selectedType == 'views' ? 'selected' : ''}>조회순</option>
				        </select>
				    조립앨범	
				    </td>
				</tr>
                <tr>
                    <th>NO</th>
                    <th>내용</th>
                    <th>👁️‍🗨️ | 💬</th>
                    <th>닉네임</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
			    <c:choose>
			        <c:when test="${empty albumList}">
			            <tr>
			                <td colspan="5" style="text-align: center; padding: 20px;">
			                    게시물이 없습니다.
			                </td>
			            </tr>
			        </c:when>
			        <c:otherwise>
			            <c:forEach var="album" items="${albumList}">
			                <tr onclick="location.href='/Community/AlbumupdateForm?community_idx=${album.community_idx}'" style="cursor: pointer;">
			                    <td>${album.community_idx}</td>
			                    <td><c:out value="${album.community_content}" /></td>
			                    <td>👁️‍🗨️ ${album.community_views} | 💬 ${album.total_answers}</td>
			                    <td>${album.user_nickname}</td>
			                    <td>
								    <form action="/Manager/ManagerCommunityDelete" method="POST" onsubmit="return confirm('정말 삭제하시겠습니까?');" style="margin: 0;">
								    <input type="hidden" name="community_idx" value="${album.community_idx}" />
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
