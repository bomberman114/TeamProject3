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
<style type="text/css">



</style>
</head>
<body>
	<img class="scroll-top-btn" src="/images/icon/common-icon/scroll-top-btn.png" alt="위로가기">
	<div class="program-filter">
		<ul>
			<li class="li-purpose-idx purpose-active" data-purposeIdx="">전체</li>
			<li class="li-purpose-idx" data-purposeIdx=1>사무용</li>
			<li class="li-purpose-idx" data-purposeIdx=2>게임용</li>
		</ul>
		<div>
			<div class="purpose-btn purpose-btn-prev"><img src="/images/icon/common-icon/prev-btn-fff-48.png" alt="prev"></div>
			<div class="purpose-container"><ul class="quick-finder-filter-program"></ul></div>
			<div class="purpose-btn purpose-btn-next"><img src="/images/icon/common-icon/next-btn-fff-48.png" alt="next"></div>		
		</div>
	</div>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="easy-search">
		<div class="inner">
			<div class="quick-finder">
				<div class="quick-finder-title">
					<div>
						간편검색<span><b>Quick</b> Finder</span>
					</div>
					<ul>
						<li class="li-purpose-idx purpose-active" data-purposeIdx="">전체</li>
						<li class="li-purpose-idx" data-purposeIdx=1>사무용</li>
						<li class="li-purpose-idx" data-purposeIdx=2>게임용</li>
					</ul>
				</div>
				<ul class="quick-finder-program">
				</ul>
				<div class="quick-finder-filter">
					<ul>
						<li class="quick-finder-filter-division"><span>구분</span><select
							name="computerType">
								<option value="" selected>전체</option>
								<option value="2">PC</option>
								<option value="3">노트북</option>
						</select></li>
						<li class="quick-finder-filter-company"><span>제조사</span>
							<div>
								<div class="filter-company-container">
									<div>
										<select name="manufacture">
											<option value="" selected style="display: none">제조사
											</option>
											<option value="">삼성</option>
										</select> <select name="" id="" disabled="disabled">
											<option value="" selected style="display: none">라인업
											</option>
											<option value="">갤럭시 북 360</option>
										</select>
									</div>
									<p class="brand-hint">선택된 라인업이 없습니다.</p>
								</div>
							</div></li>
						<li><span>가격</span>
							<div class="quick-finder-filter-price">
								<input type="text" maxlength="11"  name="lowestPrice"/>~
								<input type="text" maxlength="11" name="highestPrice"/>
							</div>
							<button class="quick-finder-filter-btn">조회</button></li>
					</ul>
				</div>
			</div>
			<div class="quick-finder-search-title">
				<h3>
					조회상품(<span>##</span>)
				</h3>
				<p>
					<input class="list-search" type="text" placeholder="리스트 내 검색" />
					<button class="list-search-btn">검색</button>
				</p>
			</div>
			<div class="quick-finder-search-container">
				<ul>
					<li class="list-filter-active" data-sortType="">인기상품순</li>
					<li data-sortType="lowestPrice">낮은가격순</li>
					<li data-sortType="highestPrice">높은가격순</li>
					<li data-sortType="recent">신상품순</li>
				</ul>
				<div class="quick-finder-search-list"></div>
			</div>
			<div class="paging-container"></div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	<script>
    
      let chartInstances = [];
      let computerType = null; 
      let manufacture = null; 
      let manufactureBrand = null;
      let lowestPrice = null;
      let highestPrice = null; 
      let listSearch = null; 
      let sortType = null; 
      let nowpage = null;
      
      
      getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,nowpage);

      // 가격 입력 정규식 이벤트
	    document.addEventListener('keyup', function(e) {
	       let value = e.target.value;
	    	if(e.target.closest(".quick-finder-filter-price input")){
	        
	        // 숫자와 쉼표만 허용하는 정규식
	        const regex = /^[0-9,]*$/;
	        
	        if (!regex.test(value)) {
	          // 숫자나 쉼표가 아닌 문자가 입력되면 해당 문자를 제거
	          value = value.replace(/[^0-9,]/g, '');
	        }
	        
	        value = Number(value.replaceAll(',', ''));
	        if(isNaN(value)) {
	          e.target.value = 0;
	        } else {
	          const formatValue = value.toLocaleString('ko-KR');
	          e.target.value = formatValue;
	        }
	    		
	    	}
	    });
      
      let { pcpu, pvga, pram } = { pcpu: 16000, pvga: 8000, pram: 16 };

      // 화면에 있는 canavs들 dataset으로 계산해서 그래프 그리기
		function renderCanvas() {
		  const $canvasList = document.querySelectorAll("canvas");
		  $canvasList.forEach((canvas, i) => {
		    const ctx = canvas.getContext('2d');
		    const currentData = JSON.parse(canvas.dataset.bench);
		    const newData = [
		      Math.floor((currentData.cpu / pcpu) * 100),
		      Math.floor((currentData.vga / pvga) * 100),
		      Math.floor((currentData.ram / pram) * 100),
		    ];		    	
		    if(!pvga){newData[1] = 0}
		 
		
		    if (!chartInstances[i]) {
		      createGraph(canvas, newData, i);
		    } else {
		      updateGraph(chartInstances[i], newData);
		    }
		  });
		}
		
		function updateGraph(chart, newData) {
		  chart.data.datasets[0].data = newData;
		  chart.update();
		}



  		// Chart.js 그래프 설정
      function createGraph(canvas, data, i) {
    	  if (chartInstances[i]) {
    		    chartInstances[i].destroy();
    		  }
        Chart.register(ChartDataLabels);
        const ctx = canvas.getContext("2d");
        const mixedChart = new Chart(ctx, {
          type: "bar",
          data: {
            labels: ["CPU", "그래픽카드", "메모리"],
            datasets: [
              {
                data: data,
                backgroundColor: [
                  "rgb(255, 99, 132)",
                  "rgb(54, 162, 235)",
                  "rgb(255, 206, 86)",
                ],
                order: 2,
              },
              {
                data: [100, 100, 100],
                type: "line",
                backgroundColor: ["white", "white", "white"],
                borderWidth: 1,
                borderColor: "#2a2b33",
                borderWidth: 2,
                fill: false,
                order: 1,
              },
            ],
          },
          options: {
            responsive: false,
            maintainAspectRatio: false,
            layout: {
              padding: {
                top: 10,
              },
            },
            plugins: {
              datalabels: {
                color: "#111",
                anchor: "start",
                align: "top",
                offset: 0,
                formatter: function (value, context) {
                    if (context.datasetIndex === 0) {
                      return value === 0 ? null : value + "%";
                    }
                    return null;
                  },
              },
              tooltip: {
                enabled: true,
                backgroundColor: "#212121",
                padding: 10,
                callbacks: {
                  label: function (context) {
                    return context.parsed.y + "%";
                  },
                },
              },
              legend: {
                display: false,
              },
            },
            scales: {
              x: {
                grid: {
                  drawBorder: false,
                  display: false,
                },
                border: {
                  display: false, // Y축의 기본 테두리 비활성화
                },
              },
              y: {
                max: 200, // Y축 최대값 설정
                grid: {
                  drawBorder: false,
                  display: false,
                },
                
                ticks: {
                  display : false,
                  /*
                  callback: function (value, index, values) {
                    return value === 100 ? value + "%" : "";
                  },*/
                },
                
                border: {
                  display: false, // Y축의 기본 테두리 비활성화 (중요)
                },
              },
            },
          },
        });
        chartInstances[i] = mixedChart;
      }
      
  		// 그래프 삭제하는 함수
      function destroyCharts() {
    	  chartInstances.forEach(chart => {
    	    if (chart) {
    	      chart.destroy();
    	    }
    	  });
    	  chartInstances = [];
    	}
      
      getPurposeList();
      
      // 사용용도 가져오는 fetch 함수
      async function getPurposeList(purposeIdx){
  	    const res = await fetch("/QuickFinder/getPurposeList", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json",
	        },
	        body: JSON.stringify({ purposeIdx : purposeIdx})
	    });
	
	    if (!res.ok) {
	        throw new Error(`HTTP error status: ${res.status}`);
	    }
	
	    const result = await res.json();
	    renderPurposeList(result.purposeList)
	    if(result.purposeList.length > 7){
	    		document.querySelector(".purpose-btn-next img").style.display = "block"
	    }else{
	    	document.querySelector(".purpose-btn-next img").style.display = "none"
	    }
	    document.querySelector(".purpose-btn-prev img").style.display = "none"
	    
	    return result.purposeList;
			}
     
      let purposeCurrentIdx = 0;
      
      // 사용용도 프로그램 렌더링하는 함수
      function renderPurposeList(purposeList){
    	  const $purposeContainer = document.querySelector(".quick-finder-program");
    	  const $purposeFilterContainer = document.querySelector(".quick-finder-filter-program");
    	  $purposeFilterContainer.style.transform = "translateX(0)";
    	  purposeCurrentIdx = 0;
    	  $purposeContainer.innerHTML = "";
    	  $purposeFilterContainer.innerHTML = "";
    	  let html = "";
    	  purposeList.forEach(purpose => {
    		    const li = document.createElement('li');
    		    li.textContent = purpose.PURPOSE_CONTENT_NAME;
    		    li.classList.add("purpose")
    		    li.dataset.bench = JSON.stringify({
    		        cpu: purpose.CPU_BENCH,
    		        vga: purpose.GPU_BENCH,
    		        ram: purpose.RAM_BENCH
    		      });
    		    $purposeContainer.appendChild(li);
    		    const li2 = document.createElement('li');
    		    li2.textContent = purpose.PURPOSE_CONTENT_NAME;
    		    li2.classList.add("purpose")
    		    li2.dataset.bench = JSON.stringify({
    		        cpu: purpose.CPU_BENCH,
    		        vga: purpose.GPU_BENCH,
    		        ram: purpose.RAM_BENCH
    		      }); 
    		    $purposeFilterContainer.appendChild(li2);
    	  })
      }
      
      // 프로그램 선택시 그래프 다시 그리거나 캐러셀 이벤트
      document.addEventListener("click",(e)=>{
    	  const clicked = e.target
    	  if(clicked.matches(".li-purpose-idx")){
    		  const $purposelis = document.querySelectorAll(".li-purpose-idx")
    		  $purposelis.forEach((li,i)=>{li.classList.remove("purpose-active")
    		  if(e.target.textContent == $purposelis[i].textContent){
    			  $purposelis[i].classList.add("purpose-active")}
    		  })
    		  getPurposeList(clicked.dataset.purposeidx)
    	  }
    	  if(clicked.matches(".purpose")){
    		  pcpu = JSON.parse(e.target.dataset.bench).cpu
    		  pvga = JSON.parse(e.target.dataset.bench).vga
    		  pram = JSON.parse(e.target.dataset.bench).ram	  
    		  renderCanvas();
    	  }
    	  if(clicked.matches(".purpose-btn-next img")){
    		  purposeCurrentIdx++;
    		  purposeSlideMove(purposeCurrentIdx)
    	  }
    	  if(clicked.matches(".purpose-btn-prev img")){
    		  purposeCurrentIdx--;
    		  purposeSlideMove(purposeCurrentIdx)
    	  }
    	  if(clicked.matches(".paging-li")){
    		  nowpage = clicked.textContent;
    		  getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,nowpage);
    		  window.scrollTo(0, 700)
    	  }
    	  if(clicked.matches(".quick-finder-search-container li")){
    		  sortType = clicked.dataset.sorttype;
    		  document.querySelectorAll(".quick-finder-search-container li").forEach(li=>li.className = "")
    		  clicked.className = "list-filter-active"
    		  getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,1);
    	  }
    	  if(clicked.matches(".quick-finder-filter-btn")){
    		  computerType = document.querySelector("select[name='computerType']").value
    		  manufacture = document.querySelector("select[name='manufacture']").value
    		  lowestPrice = document.querySelector("input[name='lowestPrice']").value.replaceAll(",","")
    		  highestPrice = document.querySelector("input[name='highestPrice']").value.replaceAll(",","")
    		  getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,1);
    	  }
    	  if(clicked.matches(".list-search-btn")){
    		  listSearch = document.querySelector(".list-search").value.toUpperCase();
    		  getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,1);
    	  }
    	  if(clicked.matches(".paging-next-btn")){
    		  nowpage = clicked.dataset.nowpage;
    		  getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,nowpage);
    		}
    	  if(clicked.matches(".paging-prev-btn")){
    		  nowpage = clicked.dataset.nowpage;
  		   getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,nowpage);
    	  }
      })
      
      // 사용용도 프로그램 캐러셀 함수
      function purposeSlideMove(idx){
    	  const $purposeSlideContainer = document.querySelector(".quick-finder-filter-program")
    	  const $purposeSlide = $purposeSlideContainer.querySelector("li");
    	  const $prevBtn      = document.querySelector(".purpose-btn-prev img")
    	  const $nextBtn      = document.querySelector(".purpose-btn-next img")
    	  $purposeSlideContainer.style.transform = "translateX(" + -idx * ($purposeSlide.clientWidth+8) + "px)"
    	  if(idx > $purposeSlideContainer.querySelectorAll("li").length - 6){
    		  $nextBtn.style.display = 'none' 
    	  }else if(idx == 0){
    		  $prevBtn.style.display = 'none'
    	  }else{
    		  $prevBtn.style.display = 'block'
    			  $nextBtn.style.display = 'block' 
    	  }
      }
      
      // 스크롤 위치 따라 사용용도 프로그램 fixed 하는 이벤트
      window.addEventListener("scroll",checkslide)
      
      function checkslide(){
      const $quickFinder = document.querySelector(".quick-finder")
      const $programFilter = document.querySelector(".program-filter")
      if( $quickFinder.getBoundingClientRect().bottom < 200){
    	  $programFilter.classList.add("scroll-active")
      }else{
    	  $programFilter.classList.remove("scroll-active")
      }
    }
     

      
     // 상품 가져오는 fetch 함수
     async function getProductPagingFilterList(
    		 computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,nowpage
    		 ){
 	    const res = await fetch("/QuickFinder/getProductPagingFilterList", {
        method: "POST",
        headers: {"Content-Type": "application/json",},
        body: JSON.stringify({ 
        	computerType     : computerType,
        	manufacture      : manufacture, 
        	manufactureBrand : manufactureBrand,
        	lowestPrice      : lowestPrice,
        	highestPrice     : highestPrice,
        	listSearch       : listSearch,
        	sortType         : sortType,
        	nowpage          : nowpage})
	    });

      if (!res.ok) {
        throw new Error(`HTTP error status: ${res.status}`);
      }

      const result = await res.json();
      document.querySelector(".quick-finder-search-title span").textContent = result.response.pagination.totalRecordCount
      createPagingList(result)
      createProductList(result.response.list)
      destroyCharts()
      renderCanvas();
    
    	return result.purposeList;
		}

     function formatNumberWithCommasAndWon(number) {
    	  return number.toLocaleString('ko-KR') + '원';
    	}
     
     
     function createProductList(list) {
    	 const $itemList = document.querySelector(".quick-finder-search-list");
    	 $itemList.innerHTML = "";
		  if(list){
    	  list.forEach(item => {
    	    const itemDiv             = document.createElement("div");
    	    itemDiv.className         = "quick-finder-search-item";
    	    const itemLeftDiv         = document.createElement("div");
    	    itemLeftDiv.className     = "quick-searched-item-left";
    	    const itemLeftImgDiv      = document.createElement("div");
    	    itemLeftImgDiv.className  = "quick-searched-item-img";
    	    const itemLeftInfoDiv     = document.createElement("div");
    	    itemLeftInfoDiv.className = "quick-searched-item-info";
    	    const itemLeftUtilUl      = document.createElement("ul");
    	    itemLeftUtilUl.className  = "quick-searched-item-util";
    	    const itemLeftUtilbookmarkDiv     = document.createElement("div");
    	    itemLeftUtilbookmarkDiv.className = "product-bookmark";
    	    const itemRightDiv                = document.createElement("div");
    	    itemRightDiv.className            = "quick-searched-item-right";

    	    const productTitleDiv       = document.createElement("div");
    	    const productTitleP         = document.createElement("p");
    	    const productSpectDiv       = document.createElement("div");
    	    productTitleP.textContent   = item.PRODUCT_NAME;
    	    productSpectDiv.textContent = item.PRODUCT_DESCRIPTION;
    	    productTitleDiv.append(productTitleP);
    	    productTitleDiv.append(productSpectDiv);
    	    itemLeftInfoDiv.append(productTitleDiv);

    	    const createAtLi    = document.createElement("li");
    	    const bookMarkLi    = document.createElement("li");
    	    const bookMarkLiImg = document.createElement("div");

    	    createAtLi.textContent = item.CREATED_AT;
    	    bookMarkLi.textContent = "관심";

    	    bookMarkLi.append(bookMarkLiImg);

    	    itemLeftUtilUl.append(createAtLi);
    	    itemLeftUtilUl.append(bookMarkLi);

    	    itemLeftInfoDiv.append(itemLeftUtilUl);

    	    
    	    const itemImg = document.createElement("img");
    	    //itemImg.src = "/images/product/" +  item.PRODUCT_SFILE_NAME
    	    
    	    itemLeftImgDiv.append(itemImg);
    	    
    	    itemLeftDiv.append(itemLeftImgDiv);
    	    itemLeftDiv.append(itemLeftInfoDiv);

    	    const itemRightP = document.createElement("p");
   	      const itemRightCanvas = document.createElement("canvas");
   	      itemRightCanvas.className = "bench-graph";
   	      itemRightCanvas.dataset.bench = JSON.stringify({
   	        cpu: item.CPU_BENCH,
   	    	  vga: item.GPU_BENCH,
   	        ram: item.RAM_BENCH
   	      });
    	    itemRightP.textContent = formatNumberWithCommasAndWon(item.PRICE);
    	    itemRightDiv.append(itemRightCanvas);
    	    itemRightDiv.append(itemRightP)
    	    itemDiv.append(itemLeftDiv);
    	    itemDiv.append(itemRightDiv);

    	    $itemList.append(itemDiv);
    	  });
		  }
    	}

     function createPagingList(result) {
    	  document.querySelector(".paging-container").innerHTML = "";
    	  const ul = document.createElement("ul");
    	  
    	  if (result.response.pagination.existPrevPage) {
    	    const li = document.createElement("li");
    	    li.className = "paging-prev-btn";
    	    li.dataset.nowpage = result.response.pagination.startPage - result.searchVo.pageSize ;
    	    ul.append(li);
    	  }
    	  
    	  for (
    	    let i = result.response.pagination.startPage;
    	    i <= result.response.pagination.endPage;
    	    i++
    	  ) {
    	    const li = document.createElement("li");
    		  if(result.nowpage == i){
    			  li.className = "paging-li paging-nowpage"
    		  }else{
    			  li.className = "paging-li";
    		  }
    	    li.textContent = i;
    	    ul.append(li);
    	  }
    	  
    	  if (result.response.pagination.existNextPage) {
    	    const li = document.createElement("li");;
    	    li.className = "paging-next-btn";
    	    li.dataset.nowpage = result.response.pagination.endPage + 1;
    	    ul.append(li);
    	  }
    	  
    	  const $pagingContainer = document.querySelector(".paging-container");
    	  $pagingContainer.append(ul);
    	 }
     
 		   document.querySelector(".list-search").addEventListener("keyup",(e)=>{
 			   if(e.keyCode == 13 ){
 	    		  listSearch = document.querySelector(".list-search").value.toUpperCase();
 	    		  getProductPagingFilterList(computerType,manufacture,manufactureBrand,lowestPrice,highestPrice,listSearch,sortType,1);
 			   }
 		   })
     
 		   const $scrollTopBtn = document.querySelector(".scroll-top-btn");
 		  window.addEventListener("scroll", (e)=>{
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
</body>
</html>






