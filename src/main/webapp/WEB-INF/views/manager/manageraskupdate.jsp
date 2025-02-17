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
    <form action="/Manager/ManagerAskUpdate" method="POST" style="margin-bottom: 20px; ">
        <input type="hidden" name="customer_service_idx" value="${ManagerVo.customer_service_idx}" />

        <div style="padding-bottom: 20px; border-bottom: 1px solid black;">
            <label for="customer_service_type">[질문 유형 선택]</label>
            <div id="customer_service_type" style="display: flex; gap: 10px; font-size: 18px;">
                <label>
                    <input type="radio" name="customer_service_type" value="회원" 
                        <c:if test="${ManagerVo.customer_service_type == '회원'}">checked</c:if> required> 회원
                </label>
                <label>
                    <input type="radio" name="customer_service_type" value="PC견적" 
                        <c:if test="${ManagerVo.customer_service_type == 'PC견적'}">checked</c:if> required> PC견적
                </label>
                <label>
                    <input type="radio" name="customer_service_type" value="브랜드관" 
                        <c:if test="${ManagerVo.customer_service_type == '브랜드관'}">checked</c:if> required> 브랜드관
                </label>
                <label>
                    <input type="radio" name="customer_service_type" value="커뮤니티" 
                        <c:if test="${ManagerVo.customer_service_type == '커뮤니티'}">checked</c:if> required> 커뮤니티
                </label>
                <label>
                    <input type="radio" name="customer_service_type" value="광고" 
                        <c:if test="${ManagerVo.customer_service_type == '광고'}">checked</c:if> required> 광고
                </label>
            </div>
        </div>

        <div style="padding-bottom: 20px; border-bottom: 1px solid black; margin-top: 20px;">
            <label for="customer_service_title">[Q.]</label>
            <textarea id="customer_service_title" name="customer_service_title">${ManagerVo.customer_service_title}</textarea>

            <label for="customer_service_content" style="margin-top: 20px;">[A.]</label>
            <textarea id="customer_service_content" name="customer_service_content">${ManagerVo.customer_service_content}</textarea>
        </div>

        <div style="display: flex; justify-content: center; gap: 20px; padding-top: 20px;">
            <button type="button" onclick="location.href='/Manager/ManagerAsklist'">목록</button>
            <button type="submit">저장</button>
        </div>
    </form>
    
</div>

    
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
