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

<title>고객센터홈</title>
<style>
h2 {
    text-align: center;
    margin-top: 80px;
    margin-bottom: 40px;
    font-weight: bold;
    font-size: 36px;
}
input[type="search"] {
    width: 720px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box;
    margin-bottom: 40px;
}
button {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #1A3D91;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}
button:hover {
    background-color: #1554b5;
}
a {
	color: #333;
	text-decoration: none;
}
table {
	width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    border: 1px solid #ddd;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
}
table td {
    border: 1px solid #ddd;
    width: 300px;
    padding: 10px;
    text-align: center;
}
table td[colspan="2"] {
    background-color: #f9f9f9;
    font-weight: bold;
}
tbody {
	vertical-align: middle !important;
}
.circle-button {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 2px solid #ddd;
    margin: auto;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-bottom:10px;
}
.circle-button:hover {
    border-color: #1A3D91;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.circle-button img {
    width: 60%;
    height: auto;
}
.circle-box {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid #ddd;
    cursor: pointer;
    transition: all 0.3s ease;
    margin: auto;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
}
.circle-box:hover {
    border-color: #1A3D91;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.circle-box img {
    width: 70%;
    height: auto;
}
#previous {
	left: -100px;
}
#next {
	right: -100px;
}
.square {
    display: flex;
    gap:15px;
    margin: 20px auto;
    transition: transform 0.3s ease;
}
.box {
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 10px;
    background-color: white;
    width: calc((100% - 45px) / 4);
    height: 260px;
    box-sizing: border-box;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    display: block;
    flex-shrink: 0;
}
.box:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}
.box div:first-child {
	font-size:19px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #1A3D91;
    min-height: calc(3 * 1.5em);
}
.box div:last-child {
    overflow: hidden; /* 넘치는 내용 숨기기 */
    display: -webkit-box; /* 웹킷 기반 브라우저에서 박스 모델 사용 */
    -webkit-box-orient: vertical; /* 세로 방향으로 정렬 */
    -webkit-line-clamp: 6; /* 최대 6줄로 제한 */
}
#question-header, #notice-header {
    margin-top: 48px;
    font-size: 18px;
    font-weight: bold;
}
.notice {
	margin-top: 7px; /* 각 공지사항 항목 사이의 간격 */
}
.bold {
    font-size: 28px;
    font-weight: bold;    
    margin-bottom: 10px;
}
.bold2 {
    font-size: 18px;
}
.table1 {
	display: flex; 
	justify-content: center; 
	flex-wrap: wrap;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>
<div class="inner">
  <h2>무엇을 도와 드릴까요?</h2>

  <div style="text-align: center;">
    <input class="form-control me-2" type="search" name="searchtext" id="searchtext" placeholder="자주하는 질문을 검색해주세요." aria-label="Search">
    <button type="submit" name="imgclick" id="imgclick">검색</button>
  </div>
  
  <div style="display: flex; justify-content: space-between; width: 1000px; margin: 0 auto; flex-wrap: wrap;">
    <div>
      <div class="circle-button" onclick="filterQuestions('회원')">
        <img src="/images/cs/person.png" alt="회원">
      </div>
      <div style="text-align: center;">회원</div>
    </div>
    <div>
      <div class="circle-button" onclick="filterQuestions('PC견적')">
        <img src="/images/cs/computer.png" alt="PC견적">
      </div>
      <div style="text-align: center;">PC견적</div>
    </div>
    <div>
      <div class="circle-button" onclick="filterQuestions('브랜드관')">
        <img src="/images/cs/brand.png" alt="브랜드관">
      </div>
      <div style="text-align: center;">브랜드관</div>
    </div>
    <div>
      <div class="circle-button" onclick="filterQuestions('커뮤니티')">
        <img src="/images/cs/community.png" alt="커뮤니티">
      </div>
      <div style="text-align: center;">커뮤니티</div>
    </div>
    <div>
      <div class="circle-button" onclick="filterQuestions('광고')">
        <img src="/images/cs/ad.png" alt="광고">
      </div>
      <div style="text-align: center;">광고</div>
    </div>
  </div>

  <div id="question-header">'회원' 관련 가장 자주 묻는 질문입니다</div>

  <div style="align-items: center; position: relative; max-width: 1200px; margin: auto; ">
    <div class="circle-box" id="previous">
      <img src="/images/cs/back.png" alt="이전">
    </div>
    <div style="overflow: hidden;">
    <div class="square" id="question-container">
      <c:forEach var="cs" items="${csList}">
        <div class="box" data-type="${cs.customer_service_type}">
          <a href="/Cs/Csview?customer_service_idx=${cs.customer_service_idx}">
            <div>Q.<br> [${cs.customer_service_type}] ${cs.customer_service_title}</div>
            <div>A.<br>${cs.customer_service_content}</div>
          </a>
        </div>
      </c:forEach>
    </div>
    </div>

    <div class="circle-box" id="next">
      <img src="/images/cs/next.png" alt="다음">
    </div>
  </div>

  <div class="table1">
    <table>
      <tr>
        <td colspan="2"><a href="/Cs/Mycslist?user_idx=${sessionScope.user.user_idx}">문의내역 확인하기</a></td>
        <td rowspan="4" style="vertical-align: middle !important;">
          <div class="bold">광고문의</div>
          <div class="bold2">
            <div style="padding: 5px;">0000-0000</div> 
            <div style="padding: 5px;">평일 09:00 ~18:00</div>
          </div>
        </td>
        <td rowspan="4" style="vertical-align: middle !important;">
          <div class="bold">1:1 상담전화</div>
          <div class="bold2">
            <div style="padding: 5px;">0000-0000</div> 
            <div style="padding: 5px;">평일 09:00 ~18:00</div>
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="2"><a href="#">아이디/비밀번호찾기</a></td>
      </tr>
      <tr>
        <td colspan="2"><a href="#">마이페이지</a></td>
      </tr>
      <tr>
        <td colspan="2"><a href="/Cs/CswriteForm?user_idx=${sessionScope.user.user_idx}">문의글 작성</a></td>
      </tr>
    </table>
  </div>

  <div id="notice-header"><a href="/Cs/Noticelist">공지사항</div>

  <div>
    <c:forEach var="nt" items="${ntList}">
      <div class="notice">
        <a href="/Cs/Noticeview?notice_idx=${nt.notice_idx}">[${nt.notice_type}] ${nt.notice_title}</a>
        <span style="font-size: smaller; margin-left:20px;">
          <c:set var="dateFormat" value="${fn:substring(nt.notice_regdate, 0, 10)}" />
          <c:set var="formattedDate" value="${dateFormat.replace('-', '.')}"/>
          ${formattedDate}
        </span>
      </div>  
    </c:forEach>
  </div>

</div>
<%@include file="/WEB-INF/include/footer.jsp"%>
<script>
document.addEventListener("DOMContentLoaded", function() {
    filterQuestions('회원');
});
const visibleBoxes = 4; // 한 번에 보이는 박스의 수
const boxWidth = 303.5; // 박스의 너비

function filterQuestions(type) {
    const header = document.getElementById('question-header');
    if (header) {
        header.innerText = "'" + type + "' "+ "관련 가장 자주 묻는 질문입니다" ;
    }

    const questionContainer = document.getElementById("question-container");
    const boxes = questionContainer.querySelectorAll('.box');
    questionContainer.style.transform = "translateX(0px)"; // 필터 변경 시 초기화
    currentTranslateX = 0;
    currentIndex = 0; // 인덱스 초기화

    boxes.forEach(box => {
        if (box.getAttribute('data-type') === type) {
            box.style.display = 'block';
        } else {
            box.style.display = 'none';
        }
    });

    // 필터링된 박스의 개수를 세어 최대 이동 가능 범위를 설정
    const visibleBoxesCount = Array.from(boxes).filter(box => box.style.display === 'block').length;
    const maxTranslateX = Math.max(0, (visibleBoxesCount - visibleBoxes) * boxWidth);

    // 이전 및 다음 버튼의 이동 범위 조정
    const previousBtn = document.getElementById('previous');
    const nextBtn = document.getElementById('next');

    previousBtn.addEventListener("click", function() {
        if (currentIndex > 0) {
            currentIndex--; // 인덱스 감소
            currentTranslateX += boxWidth; // 왼쪽으로 이동
            questionContainer.style.transform = "translateX(" + currentTranslateX + "px)";
        }
    });

    nextBtn.addEventListener("click", function() {
        if (currentIndex < visibleBoxesCount - visibleBoxes) {
            currentIndex++; // 인덱스 증가
            currentTranslateX -= boxWidth; // 오른쪽으로 이동
            questionContainer.style.transform = "translateX(" + currentTranslateX + "px)";
        }
    });
}

document.getElementById('imgclick').addEventListener('click', function() {
	const searchtext = document.getElementById('searchtext').value;
	if (searchtext) {
		window.location.href = '/Cs/Cssearch?searchtext=' + encodeURIComponent(searchtext);
	} else {
		alert('검색어를 입력해주세요.');
	}
});
</script>
</body>
</html>
