<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/searchHistory.js" defer></script>
<script src="/js/mainCarousel.js" defer></script>
<style type="text/css">
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<c:if test="${not empty error}">
		<script>
			alert("${error}")
		</script>
	</c:if>
	<main class="home">
		<img class="scroll-top-btn" src="/images/icon/common-icon/scroll-top-btn.png" alt="위로가기">
		<div class="home__main-carousel">
			<div class="inner">
				<div class="dim-prev dim"></div>
				<div class="dim-next dim"></div>
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
			</div>
		<div class="inner">
			<h2 class="brand-carousel-title">
				브랜드관
				<ul>
					<li class="brand-prev-btn"><img
						src="/images/icon/home-icon/brand-carousel-left.png" alt="" /></li>
					<li class="brand-next-btn"><img
						src="/images/icon/home-icon/brand-carousel-right-active.png"
						alt="" /></li>
				</ul>
			</h2>
			<div>
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
				<h2>카테고리별 신상품</h2>
				<div class="home__box-best">
					<div class="box-best-btn">
						<ul class="box-best-btn-container">
							<c:forEach var="productListAll" items="${recentProductList}" varStatus="idx">
								<c:choose>
								<c:when test="${idx.index eq 0}">
									<li class="box-best-btn-active" data-bestIdx="${idx.index}">${productListAll.categoryName}</li>							
								</c:when>
								<c:otherwise>
									<li data-bestIdx="${idx.index}">${productListAll.categoryName}</li>															
								</c:otherwise>
								</c:choose>
							</c:forEach>		
						</ul>
					</div>
					<div class="box-best-container">
						<c:forEach var="productListAll" items="${recentProductList}" >
							<div class="box-best-container-item">
								<h3>${productListAll.categoryName}</h3>
								<div class="box-best-item-list">
									<c:forEach var="productList" items="${productListAll.productList}">
										<div class="box-best-item">
											<div class="box-best-item-img"><img src="/images/product/${productList.PRODUCT_SFILE_NAME}"></div>
											<div class="box-best-item-title">${productList.PRODUCT_NAME}</div>
											<div class="box-best-item-price"><fmt:formatNumber value="${productList.PRICE}" type="number" pattern="#,###" />원</div>
										</div>
									</c:forEach>	
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	<script>
    let brandCarouselIdx = 0;

    const $brandCarouselContainer = document.querySelector(".brand-carousel-container");
    const $brandCarouselSlide     = $brandCarouselContainer.querySelectorAll("li");
    const $brandPrevBtn           = document.querySelector(".brand-prev-btn img");
    const $brandNextBtn           = document.querySelector(".brand-next-btn img");

    // 브랜드 캐러셀 이전 클릭 이벤트
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
    
    
    // 브랜드 캐러셀 다음 클릭 이벤트
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

    // 브랜드 캐러셀 클릭 함수
    function brandCarouselBtnClick(direct) {
        brandCarouselIdx += direct;
        $brandCarouselContainer.style.transform = "translateX(-" + $brandCarouselSlide[0].clientWidth * brandCarouselIdx + "px)";
    }

    
    const $bestItemList = document.querySelector('.box-best-container');

 		// 해당 카테고리 위치로 이동 함수
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

    
const $scrollTopBtn = document.querySelector(".scroll-top-btn");

    window.addEventListener("scroll", () => {
        const scrollY = window.scrollY;
        const containerItems = document.querySelectorAll(".box-best-container-item");
        const btnContainers = document.querySelectorAll(".box-best-btn-container li");

        containerItems.forEach((item, i) => {
            const itemTop = item.offsetTop;
            const itemHeight = item.offsetHeight;
            
            if (scrollY - 300 > itemTop - window.innerHeight / 2 && scrollY < itemTop + itemHeight - (window.innerHeight / 2)) {
                btnContainers.forEach(btn => btn.classList.remove("box-best-btn-active"));
                btnContainers[i].classList.add("box-best-btn-active");
            }
        });
          	if(window.scrollY > 0){
        		$scrollTopBtn.style.opacity = "1"
        		$scrollTopBtn.style.pointerEvents = "auto";
        	}else{
        		$scrollTopBtn.style.opacity = "0"
            $scrollTopBtn.style.pointerEvents = "none";
        	}
    });
    
    
$scrollTopBtn.addEventListener("click", () => {
    window.scroll({ top: 0, behavior: "smooth" });
});


    </script>
</html>