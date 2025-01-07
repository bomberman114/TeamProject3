<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="/js/searchHistory.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="detail-search">
		<div class="inner">
			<ul class="dir-list">
				<li>홈</li>
				<li>주요부품</li>
				<li>CPU</li>
			</ul>
			<div class="detail-search-title">상세검색</div>
			<div class="detail-search-container">
				<table>
					<tr>
						<td>필터조건1</td>
						<td>
							<ul>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
							</ul>
							<button class="filter-val-all"># 더보기</button>
						</td>
					</tr>
					<tr>
						<td>필터조건1</td>
						<td>
							<ul>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
								<li><input type="checkbox" name="" id=""><label>값1</label></li>
							</ul>
							<button class="filter-val-all"># 더보기</button>
						</td>
					</tr>
					<tr>
						<td>필터조건1</td>
						<td>
							<ul class="price-filter">
								<li><input type="text"></li>
								<li>~</li>
								<li><input type="text"></li>
								<button>검색</button>
							</ul>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button class="">옵션 전체보기</button></td>
					</tr>
				</table>
			</div>
			<div class="quick-finder-search-title">
				<h3>
					조회상품(<span>##</span>)
				</h3>
				<p>
					<input class="list-search" type="text" placeholder="리스트 내 검색" />
					<button>검색</button>
				</p>
			</div>
			<div class="quick-finder-search-container">
				<ul>
					<li class="list-filter-active">인기상품순</li>
					<li>낮은가격순</li>
					<li>높은가격순</li>
					<li>신상품순</li>
				</ul>
				<div class="quick-finder-search-list">
					<div class="quick-finder-search-item">
						<div class="quick-searched-item-left">
							<div class="quick-searched-item-img">이미지</div>
							<div class="quick-searched-item-info">
								<div>
									<p>제품명</p>
									<div>
										<a href="#" target="_blank">상품스펙</a>
									</div>
								</div>
								<ul class="quick-searched-item-util">
									<li>등록월 : 2024.12</li>
									<li>
										<div class=""></div> 관심
									</li>
								</ul>
							</div>
						</div>
						<div class="quick-searched-item-right">
							<p>###,###원</p>
						</div>
					</div>
				</div>
			</div>
			<ul class="paging-container">
				<li class="paging-nowpage"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><img src="/images/icon/common-icon/paging-next-btn.png"
					alt="" /></li>
			</ul>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>






