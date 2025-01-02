<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />

<title>문의글 작성</title>
<style>
.cs-nav {
    max-width: 200px; /* 고정된 너비 */  
    margin-left: 20px; /* 왼쪽 여백 추가 */
}
.cs-write {
    max-width: 120px; /* 고정된 너비 */  
    margin-right: 18px; /* 오른쪽 여백 추가 */
    font-size: 20px;
    font-weight: bold;
    
    tr {
    	border:none;
    }
    
    td {
    	padding: 0;
    }
}

table {
    width: 100%;
    table-layout: fixed; /* 고정 레이아웃을 적용 */
    border-collapse: collapse;
    text-align: center;
}   
th {
    font-size: 18px;
    font-weight: bold;
    width: 15%;
}
th, td {
    padding: 15px;
    white-space: nowrap; /* 텍스트 줄 바꿈 방지 */
    overflow: hidden; /* 넘치는 텍스트 숨기기 */
    text-overflow: ellipsis; /* 넘치는 텍스트에 ... 표시 */
}
tr {
    border: 1px solid black; 
}
.writeform {
	tr {
	    border-top: none; 
    	border-right: none; 
    	text-align: left;
	}
	
	td {
	padding: 25px;
	}
}
.subtitle {
    margin-top: 15px;
    margin-bottom: 15px;
}
.button {
	display: flex;
	justify-content: center; 
	margin-top: 40px;
}
.btn-light-gray {
    background-color: #ccc;
    border: none;
    padding: 15px 30px;
    font-size:large;
}
.btn-light-gray:hover {
    background-color: #c0c0c0; /* 호버 시 색상 */
}
.logo {
	display: flex;
	gap: 20px;
	width: 50px;
	height: 50px;
	line-height: 50px;
	background: #ccc;
	text-align: center;
}
.cs-impormation {
	display: flex;
	gap: 20px;
}
.impormation-detail {
	margin-top: 5px;
}
.bold {
    font-size: 20px;
    font-weight: bold;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>
<div class="inner div1">
  <div class="subtitle">고객센터 홈 > 문의글 작성</div>

  <div style="display: flex;">
  
    <div class="cs-write">
      <table class="cs-write-table">
        <tr>
          <td>문의글 작성</td>
        </tr>
      </table>
    </div>
    
    <div class="writeform">
    <form action="/Cs/Cswrite?user_idx=${sessionScope.user.user_idx}"  method="POST" enctype="multipart/form-data">
      <table>
        <tr>
          <th>문의제목</th>
          <td><input type="text" name="customer_service_title" id="customer_service_title" placeholder="제목을 입력해주세요" style="width:100%;"></td>
        </tr>
        <tr>
          <th>문의유형</th>
          <td>        
            <select class="select-field" name="customer_service_type" id="customer_service_type" style="color: #333;">
              <option value="">선택</option>
              <option value="회원">회원</option>
              <option value="PC견적">PC견적</option>
              <option value="브랜드관">브랜드관</option>
              <option value="커뮤니티">커뮤니티</option>
              <option value="광고">광고</option>
            </select>
          </td>
        </tr>
        <tr>
          <th style="vertical-align: top;">문의내용</th>
          <td><textarea class="textarea" rows="10" cols="50" name="customer_service_content" id="customer_service_content" placeholder="내용을 입력해주세요." style="width:100%;"></textarea></td>
        </tr>
        <tr>
          <th>파일첨부</th>
          <td><input class="image" type="file" name="customer_service_image_name" accept="image/gif, image/jpg, image/jpeg, image/png, application/pdf" multiple style="text-align:center;" id="upfile"><br><br>
            파일 첨부는 최대 4장까지 가능하며,<br>
            5MB이하의 GIF, JPG, JPEG, PNG, PDF 형태로 업로드해주세요.
          </td>
        </tr>
        <tr>
          <th>회원정보</th>
          <td>이메일: ${vo.user_email}
        </tr>      
        <tr style="border: none; text-align: center;">
          <td colspan="2">
            <input type="button" value="이전" id="goMain" class="btn btn-light-gray" />
      	    <input type="submit" value="작성" class="btn btn-light-gray" />
          </td>
        </tr>    
      </table>
    </form>
    </div> 
  
    <div class="cs-nav">
      <table>
        <tr><td><a href="/Cs/Mycslist?user_idx=${sessionScope.user.user_idx}">문의내역 확인하기</a></td></tr>
        <tr><td><a href="#">아이디/비밀번호찾기</a></td></tr>
        <tr><td><a href="#">마이페이지</a></td></tr>
        <tr style="background-color: #ccc;"><td><a href="/Cs/CswriteForm?user_idx=${sessionScope.user.user_idx}">문의글 작성</a></td></tr>
        <tr><td><a href="/Cs/Noticelist">공지사항</a></td></tr>
        <tr>
          <td>
            <div class="bold">1:1 상담 센터</div>
              0000-0000<br>
              평일 09:00 ~ 18:00
          </td>
        </tr>
      </table>
    </div> 
          
  </div>
</div>

<%@include file="/WEB-INF/include/footer.jsp"%>

<script>
const goMain = document.getElementById('goMain')
	goMain.onclick = function() {
		location.href = '/Cs/Cslist'
};

// 유효성 검사
const formEl = document.querySelector('form');
formEl.onsubmit = function(event) {
	const customer_service_titleEl   = document.querySelector('#customer_service_title');
	const customer_service_typeEl    = document.querySelector('#customer_service_type');
	const customer_service_contentEl = document.querySelector('#customer_service_content');
	
	if(customer_service_titleEl.value.trim() == '') {
		alert('제목을 입력하세요.')
		customer_service_titleEl.focus();
		event.preventDefault();
		return false;
	}
	if(customer_service_typeEl.value.trim() == '') {
		alert('유형을 선택하세요.')
		customer_service_typeEl.focus();
		event.preventDefault();
		return false;
	}
	if(customer_service_contentEl.value.trim() == '') {
		alert('내용을 입력하세요.')
		customer_service_contentEl.focus();
		event.preventDefault();
		return false;
	}
	return true;
};
</script> 
</body>
</html>
