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


.program-filter {
	display: none;
	position: fixed;
	align-items : center;
	padding : 20px 40px;
	z-index: 2;
	width : 100%;
	background : #2a2b33;
	color: #fff;
	
	 & .quick-finder-program {
	background: #2a2b33;
	display: flex;
	overflow: hidden;
	}
}

.program-filter.scroll-active {
	display: flex;
	flex-wrap: nowrap;
	width : 100%;
	gap : 40px;
	
	& >div{
		width : 100%;
		display: flex;
		gap : 40px;
		align-items: center;
		padding : 0  20px;
	}
	
	& .purpose-container{
		width: 100%;
		overflow: hidden;
	}
	
	& .purpose-btn{
		flex-shink : 1;
		width: 40px;
		height: 40px;

		& img{
		width : 40px;
		cursor: pointer;
		}
	}
	
	& >ul:first-child{
		width : 300px;
		white-space : nowrap;
		
		
		& li{
			display : flex;
			justify-content: center;
			align-items: center;
			width : 100%;
			border : solid 1px #ccc;
			padding : 12px;
			border : solid 1px rbg(189,234,20);
			margin-bottom: 12px;
			cursor: pointer;
		}
		
		& li:last-child{
			margin-bottom: 0;
		}
		
		& .purpose-active{
		color : #37D0FD;
		border : solid 1px #37D0FD;
		}
	}
}

.quick-finder-filter-program{
	display: flex;
	width: 90%;
	height : 100%;
	gap : 8px;
	transition : all 0.4s;
	
	& li{
		width : calc(100%/5);
		aspect-ratio : 1.618;
		flex-shrink : 0;
		height : 100%;
		background: #ccc;
		cursor: pointer;
	}
}


</style>
</head>
<body>
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
						간편검색<span>Quick Finder</span>
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
							name="" id="">
								<option value="" selected style="display: none">전체</option>
								<option value="">PC</option>
								<option value="">노트북</option>
						</select></li>
						<li class="quick-finder-filter-company"><span>제조사</span>
							<div>
								<div class="filter-company-container">
									<div>
										<select name="" id="">
											<option value="" selected style="display: none">제조사
											</option>
											<option value="">삼성</option>
										</select> <select name="" id="" disabled="disabled">
											<option value="" selected style="display: none">라인업
											</option>
											<option value="">갤럭시 북 360</option>
										</select>
									</div>
									<p>선택된 라인업이 없습니다.</p>
								</div>
							</div></li>
						<li><span>가격</span>
							<div class="quick-finder-filter-price">
								<input type="text" maxlength="11" />~<input type="text"
									maxlength="11" />
							</div>
							<button>조회</button></li>
					</ul>
				</div>
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
							<canvas class="bench-graph"
								data-bench='{"cpu" : 21000, "vga" : 7000, "ram" : 16}'></canvas>
							<p>###,###원</p>
						</div>
					</div>
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
							<canvas class="bench-graph"
								data-bench='{"cpu" : 21000, "vga" : 7000, "ram" : 16}'></canvas>
							<p>###,###원</p>
						</div>
					</div>
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
							<canvas class="bench-graph"
								data-bench='{"cpu" : 21000, "vga" : 7000, "ram" : 16}'></canvas>
							<p>###,###원</p>
						</div>
					</div>
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
							<canvas class="bench-graph"
								data-bench='{"cpu" : 21000, "vga" : 7000, "ram" : 16}'></canvas>
							<p>###,###원</p>
						</div>
					</div>
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
							<canvas class="bench-graph"
								data-bench='{"cpu" : 11000, "vga" : 5000, "ram" : 8}'></canvas>
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
					alt=""></li>
			</ul>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	<script>
    
      let chartInstances = [];
    
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
      
      
      //JSON.parse(document.querySelector("canvas").dataset.bench)["cpu"]
      let { pcpu, pvga, pram } = { pcpu: 16000, pvga: 8000, pram: 16 };

      renderCanvas();

      // 화면에 있는 canavs들 dataset으로 계산해서 그래프 그리기
      function renderCanvas() {
    	  destroyCharts();
    	  const $canvasList = document.querySelectorAll("canvas");

    	  $canvasList.forEach((canvas, i) => {
    	    canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height);
    	    let data = [
    	      Math.floor((JSON.parse(canvas.dataset.bench)["cpu"] / pcpu) * 100),
    	      Math.floor((JSON.parse(canvas.dataset.bench)["vga"] / pvga) * 100),
    	      Math.floor((JSON.parse(canvas.dataset.bench)["ram"] / pram) * 100),
    	    ];
    	    createGraph(canvas, data, i);
    	  });
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
                color: "#fff",
                anchor: "start",
                align: "top",
                offset: 0,
                formatter: function (value, context) {
                  return context.datasetIndex === 0 ? value + "%" : null;
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
      
      // 사용용도 렌더링하는 함수
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
      
      // 클릭 이벤트리스너 
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
      })
      
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
      
      
      window.addEventListener("scroll",checkslide)
      
      function checkslide(){
      const $quickFinder = document.querySelector(".quick-finder")
      const $programFilter = document.querySelector(".program-filter")
      if( $quickFinder.getBoundingClientRect().bottom < 0){
    	  $programFilter.classList.add("scroll-active")
      }else{
    	  $programFilter.classList.remove("scroll-active")
      }
    }
      
      
    </script>
</body>
</html>






