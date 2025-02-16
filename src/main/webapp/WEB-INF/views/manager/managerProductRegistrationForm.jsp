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
    <%@include file="/WEB-INF/include/sidebar.jsp"%>
    
    <div style="flex: 1; margin: 30px;">
        <form action="/Manager/ProductRegistration" method="POST" enctype ="multipart/form-data">
            
            <div style="padding-bottom: 20px; border-bottom: 1px solid black;">
                <label for="notice_type">[저장할 상품 유형선택]</label>
                <div id="notice_type" style="display: flex; gap: 20px; font-size: 10px;">
                <c:forEach items="${categoryList}" var="categoryList" >
                    <label><input type="radio" name="categoryIdx" value="${categoryList.CATEGORY_IDX}" >
                    ${categoryList.CATEGORY_NAME}</label>
                </c:forEach>
                  
                </div>
            </div>
		
		<div style="padding-bottom: 20px; border-bottom: 1px solid black; margin-top: 20px;">
            <label for="notice_title">이름</label>
            <input type="text" id="notice_title" name="productName" value="" />
             
             <label for="notice_title">가격</label>
            <input type="number" id="notice_title" name="price" value="" />
             
             <label for="notice_title">사진</label>
            <input type="file" id="upfile" name="profileImge" aria-label="upfile" accept=".jpg,.jpeg,.png">

            <label for="notice_content" style="margin-top: 20px;">[상품정보]</label>
            <textarea id="notice_content" name="productDescription"></textarea>
        </div>

        <div style="display: flex; justify-content: center; gap: 20px; padding-top: 20px;">
            <button type="submit">저장</button>
        </div>
        
        </form>
    </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
