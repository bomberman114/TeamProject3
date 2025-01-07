<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="/css/reset.css" />
<link rel="stylesheet"  href="/css/common.css" />
<title>고객센터홈</title>
<style>
.circle-button {
	width: 150px;
	height: 150px;
	border-radius: 50%; /* 동그라미 형태 */
	overflow: hidden; /* 내용이 동그라미 밖으로 나가지 않도록 */
	display: flex;
	justify-content: center;
	align-items:center;
	border: 1px solid black; /* 테두리 색상 */
	cursor: pointer; /* 마우스 커서 변경 */
}
.circle-button img {
	display: block;
	width: 75%; 
    height: auto; /* 비율 유지 */	
}
.circle-box {
	width: 50px;
	height: 50px;
	border-radius: 50%; /* 동그라미 형태 */
	overflow: hidden; /* 내용이 동그라미 밖으로 나가지 않도록 */
	display: flex;
	justify-content: center;
	align-items:center;
	border: 1px solid black; /* 테두리 색상 */
	cursor: pointer; /* 마우스 커서 변경 */
}
.circle-box img {
	display: block;
	width: 75%; 
    height: auto; /* 비율 유지 */	
}
.square-box {
	width: 250px;
	height: 250px;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items:center;
	border: 1px solid black; /* 테두리 색상 */
}
</style>
</head>
<body>
<div class="inner">
  <div>
    <h2>무엇을 도와 드릴까요?</h2>
  </div>
  
  <div>
    <input class="form-control me-2" style="color: #1A3D91;" type="search" name="searchtext" id="searchtext" placeholder="자주하는 질문을 검색해주세요." aria-label="Search">
    <button class="btn" type="submit" name="imgclick" id="imgclick">검색</button>
  </div>
     
  <div style="display: flex;">
    <div>    
      <div class="circle-button" onclick="11">
       <img src="/images/person.png" alt="회원">      
      </div>
      <div style="text-align: center;">회원</div>
    </div>  
    <div>    
      <div class="circle-button" onclick="11">
       <img src="/images/computer.png" alt="PC견적">     
      </div>
      <div style="text-align: center;">PC견적</div>
    </div>  
    <div>    
      <div class="circle-button" onclick="11">
       <img src="/images/brand.png" alt="브랜드관">      
      </div>
      <div style="text-align: center;">브랜드관</div>
    </div>  
    <div>    
      <div class="circle-button" onclick="11">
       <img src="/images/community.png" alt="커뮤니티">      
      </div>
      <div style="text-align: center;">커뮤니티</div>
    </div>  
    <div>    
      <div class="circle-button" onclick="11">
       <img src="/images/ad.png" alt="광고">      
      </div>
      <div style="text-align: center;">광고</div>
    </div>  
  </div>    
     
  <!-- ''안에 달러중괄호로 변경 -->
  <div>   
      '회원'관련 가장 자주 묻는 질문입니다 
  </div>   

  <div style="display: flex;">
    <div class="circle-box" onclick="11">
     <img src="/images/back.png" alt="광고">   
    </div>    
    <div class="square-box" onclick="11">
    </div>
    <div class="circle-box" onclick="11">
     <img src="/images/next.png" alt="광고">   
    </div>  
  </div>  
</div>
</body>
</html>