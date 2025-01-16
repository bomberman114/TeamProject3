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

<title>조립앨범 게시글 상세페이지</title>
<style>
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
    	background: #1A3D91;
    	text-align: center;
    	padding: 10px;
    	margin-top: 10px;
    	margin-bottom: 10px;
    	
    	a {
    		color: white;
    	}
    }
}
.div1 {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    
    a {
    border: 1px solid #ccc;
    padding: 5px 10px;
    }
}
.title {
	font-size: 20px;
    font-weight: bold;
}
.div2 {
    display: flex;
    justify-content: space-between;
}
.content {
	min-height: 200px; /* 최소 높이 설정 */
    padding: 10px; /* 내부 여백 추가 (선택 사항) */
    box-sizing: border-box; /* 패딩과 테두리를 포함한 전체 크기 계산 */
}
.img {
	position: relative;
    width: 100%;
    max-width: 790px;
    height: auto;
    display: block;
    margin-bottom: 30px;
    
    img {
    	width: 100%;
    	height: auto;
	    max-height: 300px;
	    object-fit: contain;    	
    }
}
.box {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
}
.table {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 400px;
    border: 1px solid #ccc;
	
	.title {
		font-size: 20px;
		font-weight: bold;
	}
	table {
		width: 90%;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	th {
		width: 20%;
		text-align: left;
		padding: 2px;
	}
	
	td {
		width: 80%;
		text-align: left;
	}
	
	tr td:last-child {
		
		a {
		display: inline-block;
		text-align: center;		
		border: 1px solid;
    	padding: 5px 10px;
    	font-weight: bold;
		}
	}
}
textarea {
	width: 100%;
	min-height: 100px;
}
.answerbtn {
	border: 1px solid; 
	padding: 5px 10px; 
	background-color: white;
}
.bold {
	margin-top: 10px;
    font-size: 20px;
    font-weight: bold;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp"%>

<div class="inner">  
    <div style="display: flex; margin-top:40px; ">      
    <div style="width: 790px;">

      <div class="div1">
          <div class="title">${vo.community_title}</div>
          <div>
            <c:if test="${sessionScope.user.user_idx eq vo.user_idx}">
              <a href="/Community/AlbumupdateForm?community_idx=${vo.community_idx}">수정</a>
              <a href="/Community/Albumdelete?community_idx=${vo.community_idx}">삭제</a>
            </c:if>
         </div>          
      </div>
        
      <!-- 구분선 추가 -->
      <div><hr style="border: 1px solid #ddd;"></div>
      <div class="div2">
          <div>${vo.user_nickname} | 👁️‍🗨️ ${vo.community_views} | 💬 ${vo.total_answers} </div>
          <div>${vo.community_regdate}</div>          
      </div>
      <!-- 구분선 추가 -->
      <div><hr style="border: 1px solid #ddd; margin-bottom:20px;"></div> 
      
      <div class="content">
        <div>${vo.community_content}</div>
      </div>
      
      <!-- 구분선 추가 -->
      <div><hr style="border: 1px solid #ddd; margin-bottom:20px;"></div> 
      
      <div class="img">
        <div><img src="/images/${vo.community_sfile_name}"></div>
      </div>   
      
      <div class="box">
      <div class="table">
        <table>
          <tr>
            <td colspan="2" class="title">시스템 사양</td>
          </tr>
          <tr><td colspan="2"><hr style="border: 1px solid;"></td></tr>         
          <tr>
            <th>CPU</th>
            <td>: ${spec.community_spec_cpu}</td>
          </tr>
          <tr>
            <th>메인보드</th>
            <td>: ${spec.community_spec_mainboard}</td>
          </tr>
          <tr>
            <th>메모리</th>
            <td>: ${spec.community_spec_memory}</td>
          </tr>
          <tr>
            <th>그래픽카드</th>
            <td>: ${spec.community_spec_gpu}</td>
          </tr>
          <tr>
            <th>SSD</th>
            <td>: ${spec.community_spec_ssd}</td>
          </tr>
          <tr>
            <th>HDD</th>
            <td>: ${spec.community_spec_hdd}</td>
          </tr>
          <tr>
            <th>CPU 쿨러</th>
            <td>: ${spec.community_spec_cooler}</td>
          </tr>
          <tr>
            <th>케이스</th>
            <td>: ${spec.community_spec_case}</td>
          </tr>
          <tr>
            <th>파워</th>
            <td>: ${spec.community_spec_power}</td>
          </tr>
          <tr><td colspan="2"><hr style="border: 1px solid white;"></td></tr>
          <tr>
            <td colspan="2" style="text-align: center;"><a href="/DeskTopEstimate/DeskTopEstimateForm?community_idx=${community_idx}">견적보기</a></td>
          </tr>
        </table>
      </div>  
      </div>  
      
      <!-- 구분선 추가 -->
      <div><hr style="border: 1px solid #ddd;"></div>
      
      <div>
        <div style="font-weight: bold; margin-bottom: 10px;" >댓글: ${vo.total_answers}개</div>
        <div>
          <c:forEach var="answer" items="${answerList}">
            <div style="display: flex; align-items: flex-start; padding-top: 5px; padding-bottom: 5px; border-bottom: 1px solid #ddd;">
              <img src="/images/icon/header-icon/icon-btn.png" alt="프로필" style="width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
              <div>  
                <span style="font-weight: bold;">${answer.user_nickname}</span>
                <span style="font-size: x-small;">${answer.community_answer_regdate}</span><br>
            	<span>${answer.community_answer_content}</span>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
      
      <div>
      <form action="/Community/Answerwrite?user_idx=${sessionScope.user.user_idx}&community_idx=${vo.community_idx}">
      	<div>
      	  <input type="hidden" name="user_idx" value="${sessionScope.user.user_idx}">
      	  <input type="hidden" name="community_idx" value="${vo.community_idx}">
      	  <textarea name="community_answer_content" id="community_answer_content"></textarea>
      	</div>
      	<div style="text-align: right;">
      	  <input type="submit" class="answerbtn" value="댓글작성" >
      	</div>
      </form>
      </div>

    </div>
    
    <div class="cm-nav">
    <c:if test="${empty sessionScope.user}">
      <div class="border">
        <div class="border-in">
          <div class="login"><a href="/loginForm">로그인</a></div>
          <div style="text-align: right;"><a href="/registerForm">회원가입</a></div>
        </div>
      </div>
    </c:if>
      
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
//유효성 검사
const formEl = document.querySelector('form');
formEl.onsubmit = function(event) {
	const community_answer_contentEl   = document.querySelector('#community_answer_content');
	
	if(community_answer_contentEl.value.trim() == '') {
		alert('댓글을 입력하세요.')
		community_answer_contentEl.focus();
		event.preventDefault();
		return false;
	}
	return true;
};
</script>

</body>
</html>
