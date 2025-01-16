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

.title {
    font-size: 26px;
    font-weight: bold;
    padding: 20px 0;
    border-left: none;
    border-right: none;
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
    <%@include file="/WEB-INF/include/sidebar.jsp"%>
    
    <div style="flex: 1; margin: 30px; padding: 30px; border: 1px solid #ddd; border-radius: 10px;">
    <form action="/Manager/ManagerNoticeUpdate" method="POST" style="margin-bottom: 20px; ">
        <input type="hidden" name="notice_idx" value="${ManagerVo.notice_idx}" />
		
		<div style="padding-bottom: 20px; border-bottom: 1px solid black;">
            <label for="notice_type">[공지 유형 선택]</label>
            <div id="notice_type" style="display: flex; gap: 10px; font-size: 18px;">
                <label>
                    <input type="radio" name="notice_type" value="긴급점검" 
                        <c:if test="${ManagerVo.notice_type == '긴급점검'}">checked</c:if> required> 긴급점검
                </label>
                <label>
                    <input type="radio" name="notice_type" value="수정안내" 
                        <c:if test="${ManagerVo.notice_type == '수정안내'}">checked</c:if> required> 수정안내
                </label>
                <label>
                    <input type="radio" name="notice_type" value="업데이트" 
                        <c:if test="${ManagerVo.notice_type == '업데이트'}">checked</c:if> required> 업데이트
                </label>
                <label>
                    <input type="radio" name="notice_type" value="서비스" 
                        <c:if test="${ManagerVo.notice_type == '서비스'}">checked</c:if> required> 서비스
                </label>
                <label>
                    <input type="radio" name="notice_type" value="이벤트" 
                        <c:if test="${ManagerVo.notice_type == '이벤트'}">checked</c:if> required> 이벤트
                </label>
            </div>
        </div>

        <div style="padding-bottom: 20px; border-bottom: 1px solid black; margin-top: 20px;">
            <label for="notice_title">[제목]</label>
            <input type="text" id="notice_title" name="notice_title" value="${ManagerVo.notice_title}" />

            <label for="notice_content" style="margin-top: 20px;">[내용]</label>
            <textarea id="notice_content" name="notice_content">${ManagerVo.notice_content}</textarea>
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
