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
    <form action="/Manager/ManagerCsUpdate" method="POST" style="margin-bottom: 20px; ">
        <input type="hidden" name="customer_service_idx" value="${ManagerVo.customer_service_idx}" />
        <input type="hidden" name="customer_service_type" value="${ManagerVo.customer_service_type}" />

        <div style="padding-bottom: 20px; border-bottom: 1px solid black;">
		    
		    <div style="font-size: 20px;
		    font-weight: bold;
		    margin-bottom: 10px;
		    display: block;">[질문 유형]
		    </div>
			
			<div id="customer_service_type" style="font-size: 18px;
		    font-weight: bold;
		    margin-bottom: 10px;
		    display: block;">
		        : ${ManagerVo.customer_service_type}
		    </div>
		    
		</div>

        <div style="padding-bottom: 20px; border-bottom: 1px solid black; margin-top: 20px;">
            <label for="customer_service_title">[Q.]</label>
            <textarea id="customer_service_title" name="customer_service_title">${ManagerVo.customer_service_title}</textarea>

            <label for="customer_service_content" style="margin-top: 20px;">[A.]</label>
            <textarea id="customer_service_content" name="customer_service_content">${ManagerVo.customer_service_content}</textarea>
        </div>

        <div style="display: flex; justify-content: center; gap: 20px; padding-top: 20px;">
            <button type="button" onclick="location.href='/Manager/ManagerCsList'">목록</button>
            <button type="submit">저장</button>
        </div>
    </form>
    
</div>

    
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
