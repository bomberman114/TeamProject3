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

<title>커뮤니티홈</title>
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
.title {
	font-size: 20px;
    font-weight: bold;
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}
.content {
    display: grid;
    gap: 40px 20px;
    grid-template-columns: repeat(4, 1fr);
}

.box {
    overflow: hidden;
}

.box-img {
    width: 100%;
    height: 180px;
    background: #ccc;
    margin-bottom: 8px;
    position: relative;
    
    img {
    	width:100%;
    	height: 100%;
    	object-fit: cover;
    }
}
.box-title {
    text-overflow: ellipsis;
    overflow: hidden;
    word-break: break-word;
    display: -webkit-box;
    line-clamp: 2;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    font-weight: bold;
    min-height: calc(2 * 1.5em);
}
.select-field {
	width: 80px;
	color: #767676;
	border: 1px solid #ddd;
}

.paging-container {
	margin-bottom: 20px;
} 

.write-btn {
    display: flex;
    position: absolute;
    right:0;
}

.btn-light-gray {
    border: 1px solid #1A3D91;
	padding: 5px 10px;
	text-align: center;
}
.btn-light-gray:hover {
	color: white;
    background-color: #1A3D91;
}
.paging-container {
  margin: 20 auto 20px auto;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 12px;

  & li {
    width: 32px;
    aspect-ratio: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #767676;
  }

  & li.paging-nowpage {
    border: solid 1px #333;
    border-radius: 4px;
    color: #333;
    font-weight: 500;
  }
}
.search-container {
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;

	select {
		height: 30px;
	}
  	input {
  		width: 250px;
	  	height: 30px;
  		border: 1px solid #ddd;
	}
	
	button {
		width: 50px;
		height: 30px;
		border:none;
  		background-color: #1A3D91;
  		color: white;
  		cursor: pointer;
	  	line-height: 1;
	}
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
    <div>
      <div>
        <div class="title">조립앨범
          <select class="select-field" name="sort" id="sort" onchange="sortAlbums()" style="color: #333;">
            <option value="등록순" ${param.sort == '등록순' ? 'selected' : ''}>등록순</option>
            <option value="조회순" ${param.sort == '조회순' ? 'selected' : ''}>조회순</option>
          </select>
        </div>

      </div>
      
      <div>
      	<div class="content">
		  <c:forEach var="album" items="${albumList}" >
		  <div class="box">
			<div class="box-img"><a href="/Community/Albumview?user_idx=${sessionScope.user.user_idx}&community_idx=${album.community_idx}"><img src="/images/${album.community_sfile_name}"></a></div>
			<div class="box-title"><a href="/Community/Albumview?user_idx=${sessionScope.user.user_idx}&community_idx=${album.community_idx}">${album.community_title}</a></div>
			<div class="box-nickname">${album.user_nickname}</div>
			<div style="text-align: right;">👁️‍🗨️ ${album.community_views} | 💬 ${album.total_answers}</div>
		  </div>
		  </c:forEach>
		</div>		
      </div>

      <div style="position: relative;">
        <ul class="paging-container">
          <c:if test="${currentPage > 1}">
            <li><a href="?page=${currentPage - 1}&sort=${param.sort}&search=${param.search}&searchtext=${param.searchtext}">◀</a></li>
          </c:if>
          <c:forEach begin="1" end="${totalPages}" var="page">
            <li class="${page == currentPage ? 'paging-nowpage' : ''}">
                <a href="?page=${page}&sort=${param.sort}&search=${param.search}&searchtext=${param.searchtext}">${page}</a>
            </li>
          </c:forEach>
          <c:if test="${currentPage < totalPages}">
            <li><a href="?page=${currentPage + 1}&sort=${param.sort}&search=${param.search}&searchtext=${param.searchtext}">▶</a></li>
          </c:if>

        <div class="write-btn">
          <a class="btn btn-light-gray" 
             href="/Community/AlbumwriteForm?user_idx=${sessionScope.user.user_idx}">글쓰기
          </a>
        </div>
        
        </ul>
	  </div>

      <div class="search-container">
            <form method="GET" action="/Community/Albumlist?page=${currentPage + 1}&sort=${param.sort}&search=${param.search}&searchtext=${param.searchtext}">
        <div>
            <select class="select-field" name="search" id="search">
                <option value="제목" ${param.search == '제목' ? 'selected' : ''}>제목</option>
                <option value="작성자" ${param.search == '작성자' ? 'selected' : ''}>작성자</option>
            </select>
            <input type="search" name="searchtext" id="searchtext" placeholder="검색어를 입력하세요." value="${param.searchtext}">
            <button type="submit" name="imgclick" id="imgclick">검색</button>
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
function sortAlbums() {
    const sort       = document.getElementById("sort").value;
    const search     = document.getElementById("search").value; 
    const searchtext = document.getElementById("searchtext").value; 
    window.location.href = "/Community/Albumlist?sort=" + sort + "&search=" + search + "&searchtext=" + searchtext;
}

function searchAlbums() {
    const search = document.getElementById("search").value;
    window.location.href = "/Community/Albumlist?search=" + search;
}
</script>
</body>
</html>
