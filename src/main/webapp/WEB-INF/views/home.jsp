<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/searchHistory.js" defer></script>
<script src="/js/mainCarousel.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	  <a href="/DeskTopEstimate/DeskTopEstimateForm">PC견적</a>
	<main class="home">
		<div class="inner">
			<div class="home__main-carousel">
				<div class="dim-left dim"></div>
				<div class="dim-right dim"></div>
				<div class="carousel-container">
					<div class="carousel-slide">
						<div>aa</div>
					</div>
					<div class="carousel-slide">
						<div>bb</div>
					</div>
					<div class="carousel-slide">
						<div>cc</div>
					</div>
					<div class="carousel-slide">
						<div>dd</div>
					</div>
				</div>
				<button class="carousel-button prev">
					<img src="/images/icon/home-icon/main-carousel-left-btn.png"
						alt="메인캐러셀 prev" />
				</button>
				<button class="carousel-button next">
					<img src="/images/icon/home-icon/main-carousel-right-btn.png"
						alt="메인캐러셀 next" />
				</button>
				<p class="carousel-count">
					<span class="nowpage">1</span><span>/</span><span
						class="slide-length"></span>
				</p>
			</div>
			<h2 class="brand-carousel-title">
				브랜드관
				<ul>
					<li class="brand-prev-btn"><img
						src="/images/icon/home-icon/brand-carousel-left.png" alt="" />
					</li>
					<li class="brand-next-btn"><img
						src="/images/icon/home-icon/brand-carousel-right-active.png"
						alt="" /></li>
				</ul>
			</h2>
			<div class="brand-carousel">
				<ul class="brand-carousel-container">
					<li>MSI1</li>
					<li>MSI2</li>
					<li>MSI3</li>
					<li>MSI4</li>
					<li>MSI5</li>
					<li>MSI6</li>
					<li>MSI7</li>
					<li>MSI8</li>
					<li>MSI9</li>
					<li>MSI10</li>
				</ul>
			</div>
			<h2>지금 가장 인기 있는 상품</h2>
			<div class="home__box-best">
				<div class="box-best-btn">
					<ul class="box-best-btn-container">
						<li data-bestIdx="0">전체</li>
						<li data-bestIdx="1">PC</li>
						<li data-bestIdx="2">노트북</li>
						<li data-bestIdx="3">주요부품</li>
						<li data-bestIdx="4">주변기기</li>
					</ul>
				</div>
				<div class="box-best-container">
					<div class="box-best-container-item">
						<h3>전체</h3>
						<div class="box-best-item-list">
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명 제품명
									제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
						</div>
					</div>
					<div class="box-best-container-item">
						<h3>PC</h3>
						<div class="box-best-item-list">
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명 제품명
									제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
						</div>
					</div>
					<div class="box-best-container-item">
						<h3>노트북</h3>
						<div class="box-best-item-list">
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명 제품명
									제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
						</div>
					</div>
					<div class="box-best-container-item">
						<h3>주요부품</h3>
						<div class="box-best-item-list">
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명 제품명
									제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
						</div>
					</div>
					<div class="box-best-container-item">
						<h3>주변기기</h3>
						<div class="box-best-item-list">
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명 제품명
									제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
							<div class="box-best-item">
								<div class="box-best-item-img">1</div>
								<div class="box-best-item-title">제품명 제품명 제품명 제품명 제품명</div>
								<div class="box-best-item-price">###,###원</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	<script>
    let brandCarouselIdx = 0;

    const $brandCarouselContainer = document.querySelector(".brand-carousel-container");
    const $brandCarouselSlide =
      $brandCarouselContainer.querySelectorAll("li");
    const $brandPrevBtn = document.querySelector(".brand-prev-btn img");
    const $brandNextBtn = document.querySelector(".brand-next-btn img");

    $brandPrevBtn.addEventListener("click", () => {
      if (brandCarouselIdx >= 1) {
        $brandPrevBtn.src =
          "/images/icon/home-icon/brand-carousel-left-active.png";
        brandCarouselBtnClick(-1);
      }
      if (brandCarouselIdx == 0) {
        $brandPrevBtn.src = "/images/icon/home-icon/brand-carousel-left.png";
      }
      if (brandCarouselIdx != $brandCarouselSlide.length - 8){
        $brandNextBtn.src = "/images/icon/home-icon/brand-carousel-right-active.png";
      }
    });

    $brandNextBtn.addEventListener("click", () => {
      if (brandCarouselIdx < $brandCarouselSlide.length - 8) {
        brandCarouselBtnClick(1);
        if (brandCarouselIdx >= 1) {
          $brandPrevBtn.src =
            "/images/icon/home-icon/brand-carousel-left-active.png";
        }
      }

      if (brandCarouselIdx == $brandCarouselSlide.length - 8) {
        $brandNextBtn.src = "/images/icon/home-icon/brand-carousel-right.png";
      }
    });

    function brandCarouselBtnClick(direct) {
        brandCarouselIdx += direct;
        $brandCarouselContainer.style.transform = "translateX(-" + $brandCarouselSlide[0].clientWidth * brandCarouselIdx + "px)";
    }

    const $bestItemList = document.querySelector('.box-best-container');
    window.addEventListener("scroll", checkslide);

    function checkslide(){
      const $bestItemBtnList = document.querySelector(".box-best-btn-container")
      if( $bestItemList.getBoundingClientRect().top < 0){
        $bestItemBtnList.style.transform = "translateY("+ ($bestItemList.getBoundingClientRect().top *-1 + 120 )+ "px)";
      }else{
        $bestItemBtnList.style.transform = "translateY(0px)";
      }
    }

    const $bestConatinerItem = $bestItemList.querySelectorAll(".box-best-container-item")
    document.addEventListener("click",(e)=>{
      const clicked = e.target
      if(clicked.matches(".box-best-btn-container li")){
        window.scrollTo({
          top: $bestConatinerItem[clicked.dataset.bestidx * 1].offsetTop,
          left: 0,
          behavior: 'smooth'
        });
      }
    })

    </script>
</html>







