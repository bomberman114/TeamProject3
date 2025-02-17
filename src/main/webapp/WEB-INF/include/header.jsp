<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<script src="/js/searchHistory.js" defer></script>
<header>
  <div class="inner header__inner">
    <ul>
      <li class="header__category-btn"><img src="/images/icon/header-icon/category-btn.png" alt="카테고리 버튼" />카테고리
	    <ul class="header__category-2depth">
	      <li><a href="/DetailSearch?category=2">PC</a></li>
			  <li><a href="/DetailSearch?category=3">노트북</a></li>
			  <li><a href="/DetailSearch?category=4">주요부품</a>
		    <ul class="header__category-3depth">
		      <li><a href="/DetailSearch?category=5">CPU</a></li>
				  <li><a href="/DetailSearch?category=6">메인보드</a></li>
				  <li><a href="/DetailSearch?category=7">메모리</a></li>
				  <li><a href="/DetailSearch?category=8">그래픽카드</a></li>
				  <li><a href="/DetailSearch?category=9">SSD</a></li>
				  <li><a href="/DetailSearch?category=10">HDD</a></li>
				  <li><a href="/DetailSearch?category=11">CPU 쿨러</a></li>
				  <li><a href="/DetailSearch?category=12">케이스</a></li>
				  <li><a href="/DetailSearch?category=13">파워</a></li>
		    </ul>
		  </li>
	    </ul>
      </li>
    </ul>
    <div class="header__content">
      <div class="header__logo-gnb-contaienr">
	    <div class="logo-searchbar">
		  <h1><a href="/"><img src="/images/logo/logo.svg" alt="찾았닷컴 로고"></a></h1>
		  <div class="header-nav">
		    <div class="search-div">
              <input type="text" name="search" placeholder="검색어를 입력해주세요." autocomplete="off" />
			  <div class="recent-list">
			    <p>
				  <span>최근 검색</span>
				  <button class="recnet-remove-all">전체삭제</button>
				</p>
				<ul></ul>
		      </div>
			</div>
		  </div>
	    </div>
		<ul class="header__gnb">
		  <li><a href="/QuickFinder">간편검색</a></li>
		  <li><a href="/DeskTopEstimate/DeskTopEstimateForm"">PC견적</a></li>
		  <li><a href="/LaptopBrand/Brand">브랜드관</a></li>
		  <li><a href="/Community/Albumlist">커뮤니티</a></li>
		  <li><a href="/Cs/Cslist">고객센터</a></li>
		  <c:if test="${not empty sessionScope.user and sessionScope.user.user_role eq 'ROLE_ADMIN'}">
	      <li><a href="/Manager/ManagerCsList">관리자</a></li>
		  </c:if>
		</ul>
	  </div>
	  <c:choose>
	    <c:when test="${empty sessionScope.user}">
		  <ul class="header__utill">
		    <li><a href="/loginForm"><img src="/images/icon/header-icon/heart.png" alt="관심제품">관심</a></li>
		    <li class="header__utill-login-btn">
		      <a href="/loginForm"><img src="/images/icon/header-icon/user.png" alt="로그인" />로그인</a>
			    <ul>
				  <li><a href="/loginForm">로그인</a></li>
				  <li><a href="/registerForm">회원가입</a></li>
				  <li><a href="#">마이페이지</a></li>
			    </ul>
		      </li>
		    </ul>
	      </c:when>
	      <c:when test="${not empty sessionScope.user}">
		    <ul class="header__utill">
			  <li><a href="#"><img src="/images/icon/header-icon/heart.png" alt="관심제품">관심</a></li>
			  <li class="header__utill-login-btn">
				<a><img src="/images/icon/header-icon/user.png" alt="유저메뉴" />${sessionScope.user.user_nickname}</a>
				<ul>
				  <li><a href="#">마이페이지</a></li>
				  <li><a href="#">회원정보수정</a></li>
				  <li><a href="/logout">로그아웃</a></li>
				</ul>
			  </li>
		    </ul>
		  </c:when>
	   </c:choose>
    </div>
  </div>
</header>




