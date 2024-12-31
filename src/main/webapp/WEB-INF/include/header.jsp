<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<header>
	<div class="inner header__inner">
		<ul>
			<li class="header__category-btn"><img
				src="/images/icon/header-icon/category-btn.png" alt="카테고리 버튼" />
				카테고리
				<ul class="header__category-2depth">
					<li><a href="/DetailSearch">PC</a></li>
					<li><a href="/DetailSearch">노트북</a></li>
					<li>주요부품
						<ul class="header__category-3depth">
							<li><a href="/DetailSearch">CPU</a></li>
							<li><a href="/DetailSearch">메인보드</a></li>
							<li><a href="/DetailSearch">메모리</a></li>
						</ul>
					</li>
					<li><a href="/DetailSearch">주변기기</a></li>
				</ul></li>
		</ul>
		<div class="header__content">
			<div class="header__logo-gnb-contaienr">
				<div class="logo-searchbar">
					<h1>
						<a href="/">로고</a>
					</h1>
					<div class="header-nav">
						<div class="search-div">
							<input type="text" name="search" placeholder="검색어를 입력해주세요."
								autocomplete="off" />
							<div class="recent-list">
								<p>
									<span>최근 검색</span>
									<button class="recnet-remove-all" onclick="removeRecentAll()">
										전체삭제</button>
								</p>
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
				<ul class="header__gnb">
					<li><a href="/QuickFinder">간편검색</a></li>
					<li><a href="#">PC견적</a></li>
					<li><a href="#">브랜드관</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<ul class="header__utill">
						<li><a href="/loginForm"><img
								src="images/icon/header-icon/icon-btn.png" alt="관심제품" /> 관심</a></li>
						<li class="header__utill-login-btn"><a href="/loginForm">
								<img src="images/icon/header-icon/icon-btn.png" alt="로그인" />
								로그인
						</a>
							<ul>
								<li><a href="/loginForm">로그인</a></li>
								<li><a href="/registerForm">회원가입</a></li>
								<li><a href="#">마이페이지</a></li>
							</ul></li>
					</ul>
				</c:when>
				<c:when test="${not empty sessionScope.user}">
					<ul class="header__utill">
						<li><a href="#"> <img
								src="images/icon/header-icon/icon-btn.png" alt="관심제품" /> 관심
						</a></li>
						<li class="header__utill-login-btn">
							<a>
								<img src="images/icon/header-icon/icon-btn.png" alt="로그인" />
								${sessionScope.user.user_nickname}
							</a>
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



