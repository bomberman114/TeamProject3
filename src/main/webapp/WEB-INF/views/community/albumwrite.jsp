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

<title>조립앨범 게시글 작성</title>
<style>
.inner {
	margin-top: 40px; 
}
.cm-nav {
    min-width: 390px; /* 고정된 너비 */  
    margin-left: 20px;
    
    .border {
    	width: 100%;
    	border: 1px solid #ddd;
    	border-radius: 5px;
    	margin-bottom: 20px;
    }    
    .border-in {
		margin: 0 auto;
    	width: 95%;
    	padding: 10px;
    }
    
    a {
    	text-decoration: none;
    	color: #333;
    }
    
    .login {
    	border-radius: 5px;
    	background: #ccc;
    	text-align: center;
    	padding: 10px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    }
}
input[type="text"] {
	padding: 10px;
}

table {
	width: 100%;
	
	th {
		width: 100px;
		text-align: left;
		font-weight: bold;
	}
	
	td input[type="text"], select {
		width: 100%;
	}
	
	td {
		padding: 5px;
	}
}
.title {
	border: none;
	width: 100%;
}
.btn-light-gray {
    background-color: #ccc;
    border: none;
    padding: 15px 30px;
    font-size:large;
    border-radius: 0.375rem;
}
.btn-light-gray:hover {
    background-color: #c0c0c0; /* 호버 시 색상 */
}
.bold {
    font-size: 20px;
    font-weight: bold;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>

<div class="inner">  
  <div style="display: flex; ">     
    <div style="width: 790px;">
      <div class="bold" style="margin-bottom: 10px;">조립앨범 게시글 작성</div>

      <div class="writeform">
      <form action="/Community/Albumwrite?user_idx=${sessionScope.user.user_idx}"  method="POST" enctype="multipart/form-data">
        <div><input class="title" type="text" name="community_title" id="community_title" placeholder="제목을 입력해주세요."/></div>
        <input type="hidden" name="community_menu"  value="조립앨범"/>
        <!-- 구분선 추가 -->
        <div><hr style="border: 1px solid #ddd; margin-bottom:20px;"></div>
        
        <div>
        <textarea name="community_content" id="editor"></textarea>
        </div>
      
        <div style="margin-top:10px;">
          <span class="bold" style="margin-right:10px;">대표 이미지</span>
		  <input type="file" name="community_image_name" id="community_image_name" accept="image/jpg, image/png" id="upfile">
		  <div>*대표 이미지는 10MB 이하 JPG, PNG 형태의 이미지 확장자 파일만 가능합니다.</div>
        </div>
        
        <div style="margin-top: 30px;">
        <div class="bold">시스템 사양</div>
        <div>
          <table>
            <tr>
              <th>CPU</th>
              <td>
                <input type="text" name="community_spec_cpu" id="cpuSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${cpuList}">
    			    <input type="hidden" class="cpu-item" value="${item}" />
				  </c:forEach>
                <select id="cpuSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>메인보드</th>
              <td>
                <input type="text" name="community_spec_mainboard" id="mainboardSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${mainboardList}">
    				<input type="hidden" class="mainboard-item" value="${item}" />
				  </c:forEach>
                <select id="mainboardSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>메모리</th>
              <td>
                <input type="text" name="community_spec_memory" id="memorySearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${memoryList}">
    				<input type="hidden" class="memory-item" value="${item}" />
				  </c:forEach>
                <select id="memorySuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>그래픽카드</th>
              <td>
                <input type="text" name="community_spec_gpu" id="gpuSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${gpuList}">
    				<input type="hidden" class="gpu-item" value="${item}" />
				  </c:forEach>
                <select id="gpuSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>SSD</th>
              <td>
                <input type="text" name="community_spec_ssd" id="ssdSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${ssdList}">
    				<input type="hidden" class="ssd-item" value="${item}" />
				  </c:forEach>
                <select id="ssdSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>HDD</th>
              <td>
                <input type="text" name="community_spec_hdd" id="hddSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${hddList}">
    				<input type="hidden" class="hdd-item" value="${item}" />
				  </c:forEach>
                <select id="hddSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>CPU 쿨러</th>
              <td>
                <input type="text" name="community_spec_cooler" id="coolerSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${coolerList}">
    				<input type="hidden" class="cooler-item" value="${item}" />
				  </c:forEach>
                <select id="coolerSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>케이스</th>
              <td>
                <input type="text" name="community_spec_case" id="caseSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${caseList}">
    				<input type="hidden" class="case-item" value="${item}" />
				  </c:forEach>
                <select id="caseSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr>
              <th>파워</th>
              <td>
                <input type="text" name="community_spec_power" id="powerSearch" placeholder="검색어를 입력하세요">
                  <c:forEach var="item" items="${powerList}">
    				<input type="hidden" class="power-item" value="${item}" />
				  </c:forEach>
                <select id="powerSuggestions" size="4" style="display: none;"></select>
              </td>              
            </tr>
            <tr><td colspan="2"  style="padding:15px;"></td></tr>
			<tr style="border: none; text-align: center; margin-top:30px;">
              <td colspan="2" >
      	        <input type="submit" value="작성완료" class="btn btn-light-gray" />
                <input type="button" value="취소" id="goMain" class="btn btn-light-gray" />
              </td>
            </tr>

          </table>
        </div>
        </div>

      </form>
      </div> 
    </div>  
    
    
    <div class="cm-nav">
      <div class="border">
        <div class="border-in">
          <div class="login"><a href="/loginForm">로그인</a></div>
          <div style="text-align: right;"><a href="/registerForm">회원가입</a></div>
        </div>
      </div>
      
      <div class="border">
        <div class="border-in">
          <div class="bold">조립앨범 BEST</div>
          <!-- 구분선 추가 -->
          <div><hr style="border: 1px solid;"></div>
            <c:forEach var="albumbest" items="${albumbestList}" varStatus="status">
          	  <div style="margin-bottom: 7px;">
          	    <a href="/Community/Albumview?user_idx=${sessionScope.user.user_idx}&community_idx=${albumbest.community_idx}">
          	      ${status.index + 1}. ${albumbest.community_title} (🗨️${albumbest.total_answers})
          	    </a>
          	  </div>
            </c:forEach>
        </div>    
      </div>  
    </div> 
              
  </div> 
</div> 

<%@include file="/WEB-INF/include/footer.jsp"%>
<script>
//시스템 사양 검색 기능

//CPU와 메인보드 아이템을 각각 읽어 배열로 변환
const cpuItems = Array.from(document.querySelectorAll('.cpu-item')).map(input => input.value);
const mainboardItems = Array.from(document.querySelectorAll('.mainboard-item')).map(input => input.value);
const memoryItems = Array.from(document.querySelectorAll('.memory-item')).map(input => input.value);
const gpuItems = Array.from(document.querySelectorAll('.gpu-item')).map(input => input.value);
const ssdItems = Array.from(document.querySelectorAll('.ssd-item')).map(input => input.value);
const hddItems = Array.from(document.querySelectorAll('.hdd-item')).map(input => input.value);
const coolerItems = Array.from(document.querySelectorAll('.cooler-item')).map(input => input.value);
const caseItems = Array.from(document.querySelectorAll('.case-item')).map(input => input.value);
const powerItems = Array.from(document.querySelectorAll('.power-item')).map(input => input.value);

//CPU 검색 기능
const cpuSearchInput = document.getElementById('cpuSearch');
const cpuSuggestionsSelect = document.getElementById('cpuSuggestions');

cpuSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 cpuSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = cpuItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         cpuSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             cpuSuggestionsSelect.appendChild(option);
         });
     } else {
         cpuSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     cpuSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

cpuSuggestionsSelect.addEventListener('change', function() {
 cpuSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 cpuSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//메인보드 검색 기능
const mainboardSearchInput = document.getElementById('mainboardSearch');
const mainboardSuggestionsSelect = document.getElementById('mainboardSuggestions');

mainboardSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 mainboardSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = mainboardItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         mainboardSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             mainboardSuggestionsSelect.appendChild(option);
         });
     } else {
         mainboardSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     mainboardSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

mainboardSuggestionsSelect.addEventListener('change', function() {
 mainboardSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 mainboardSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//메모리 검색 기능
const memorySearchInput = document.getElementById('memorySearch');
const memorySuggestionsSelect = document.getElementById('memorySuggestions');

memorySearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 memorySuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = memoryItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         memorySuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             memorySuggestionsSelect.appendChild(option);
         });
     } else {
         memorySuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     memorySuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

memorySuggestionsSelect.addEventListener('change', function() {
 memorySearchInput.value = this.value; // 선택된 값을 입력란에 설정
 memorySuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//그래픽카드 검색 기능
const gpuSearchInput = document.getElementById('gpuSearch');
const gpuSuggestionsSelect = document.getElementById('gpuSuggestions');

gpuSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 gpuSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = gpuItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         gpuSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             gpuSuggestionsSelect.appendChild(option);
         });
     } else {
         gpuSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     gpuSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

gpuSuggestionsSelect.addEventListener('change', function() {
 gpuSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 gpuSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//SSD 검색 기능
const ssdSearchInput = document.getElementById('ssdSearch');
const ssdSuggestionsSelect = document.getElementById('ssdSuggestions');

ssdSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 ssdSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = ssdItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         ssdSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             ssdSuggestionsSelect.appendChild(option);
         });
     } else {
         ssdSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     ssdSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

ssdSuggestionsSelect.addEventListener('change', function() {
 ssdSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 ssdSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//HDD 검색 기능
const hddSearchInput = document.getElementById('hddSearch');
const hddSuggestionsSelect = document.getElementById('hddSuggestions');

hddSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 hddSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = hddItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         hddSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             hddSuggestionsSelect.appendChild(option);
         });
     } else {
         hddSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     hddSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

hddSuggestionsSelect.addEventListener('change', function() {
 hddSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 hddSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//CPU 쿨러 검색 기능
const coolerSearchInput = document.getElementById('coolerSearch');
const coolerSuggestionsSelect = document.getElementById('coolerSuggestions');

coolerSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 coolerSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = coolerItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         coolerSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             coolerSuggestionsSelect.appendChild(option);
         });
     } else {
         coolerSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     coolerSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

coolerSuggestionsSelect.addEventListener('change', function() {
 coolerSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 coolerSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//케이스 검색 기능
const caseSearchInput = document.getElementById('caseSearch');
const caseSuggestionsSelect = document.getElementById('caseSuggestions');

caseSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 caseSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = caseItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         caseSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             caseSuggestionsSelect.appendChild(option);
         });
     } else {
         caseSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     caseSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

caseSuggestionsSelect.addEventListener('change', function() {
 caseSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 caseSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//파워 검색 기능
const powerSearchInput = document.getElementById('powerSearch');
const powerSuggestionsSelect = document.getElementById('powerSuggestions');

powerSearchInput.addEventListener('input', function() {
 const query = this.value.toLowerCase();
 powerSuggestionsSelect.innerHTML = ''; // 이전 제안 초기화
 if (query) {
     const filteredItems = powerItems.filter(item => item.toLowerCase().includes(query));
     if (filteredItems.length > 0) {
         powerSuggestionsSelect.style.display = 'block'; // 제안 표시
         filteredItems.forEach(item => {
             const option = document.createElement('option');
             option.value = item;
             option.textContent = item;
             powerSuggestionsSelect.appendChild(option);
         });
     } else {
         powerSuggestionsSelect.style.display = 'none'; // 제안 숨김
     }
 } else {
     powerSuggestionsSelect.style.display = 'none'; // 제안 숨김
 }
});

powerSuggestionsSelect.addEventListener('change', function() {
 powerSearchInput.value = this.value; // 선택된 값을 입력란에 설정
 powerSuggestionsSelect.style.display = 'none'; // 제안 숨김
});

//입력란 외부 클릭 시 제안 숨김
document.addEventListener('click', function(event) {
 if (!cpuSearchInput.contains(event.target) && !cpuSuggestionsSelect.contains(event.target)) {
     cpuSuggestionsSelect.style.display = 'none';
 }
 if (!mainboardSearchInput.contains(event.target) && !mainboardSuggestionsSelect.contains(event.target)) {
     mainboardSuggestionsSelect.style.display = 'none';
 }
 if (!memorySearchInput.contains(event.target) && !memorySuggestionsSelect.contains(event.target)) {
     memorySuggestionsSelect.style.display = 'none';
 }
 if (!gpuSearchInput.contains(event.target) && !gpuSuggestionsSelect.contains(event.target)) {
     gpuSuggestionsSelect.style.display = 'none';
 }
 if (!ssdSearchInput.contains(event.target) && !ssdSuggestionsSelect.contains(event.target)) {
     ssdSuggestionsSelect.style.display = 'none';
 }
 if (!hddSearchInput.contains(event.target) && !hddSuggestionsSelect.contains(event.target)) {
     hddSuggestionsSelect.style.display = 'none';
 }
 if (!coolerSearchInput.contains(event.target) && !coolerSuggestionsSelect.contains(event.target)) {
     coolerSuggestionsSelect.style.display = 'none';
 }
 if (!caseSearchInput.contains(event.target) && !caseSuggestionsSelect.contains(event.target)) {
     caseSuggestionsSelect.style.display = 'none';
 }
 if (!powerSearchInput.contains(event.target) && !powerSuggestionsSelect.contains(event.target)) {
     powerSuggestionsSelect.style.display = 'none';
 }
});
</script>

<script src="https://cdn.ckeditor.com/4.20.2/full/ckeditor.js"></script>
<script>
    CKEDITOR.replace('editor', {
        // 옵션 설정
        toolbar: [
        { name: 'styles', items: ['Font', 'FontSize'] },
        { name: 'colors', items: ['TextColor', 'BGColor'] },
        { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat'] },
        { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] }
    ],
        height: 300 // 에디터 높이 설정
    });
</script>


<script>
const goMain = document.getElementById('goMain')
goMain.onclick = function() {
	location.href = '/Community/Albumlist'
};

// 유효성 검사
const formEl = document.querySelector('form');
formEl.onsubmit = function(event) {
	const community_titleEl      = document.querySelector('#community_title');
	const community_contentEl    = CKEDITOR.instances.editor.getData(); // CKEditor에서 데이터 가져오기
	const community_image_nameEl = document.querySelector('#community_image_name');
	
	if(community_titleEl.value.trim() == '') {
		alert('제목을 입력하세요.')
		community_titleEl.focus();
		event.preventDefault();
		return false;
	}
	if (community_contentEl.trim() == '') {
        alert('내용을 입력하세요.');
        // CKEditor의 포커스를 설정
        CKEDITOR.instances.editor.focus();
        event.preventDefault();
        return false;
    }
	if(community_image_nameEl.value.trim() == '') {
		alert('사진을 선택하세요.')
		community_image_nameEl.focus();
		event.preventDefault();
		return false;
	}
	return true;
};
</script> 
</body>
</html>
