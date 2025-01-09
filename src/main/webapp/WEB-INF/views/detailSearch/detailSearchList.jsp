<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세검색</title>
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
				<c:forEach var="attribute" items="${categoryAttribueList}">
				    <tr>
				        <td>
				            <c:forEach var="entry" items="${attribute}" varStatus="status">
				                <c:if test="${entry.key != 'Group'}">
				                    ${entry.key}
				                </c:if>
				            </c:forEach>
				        </td>
				        <td>
				            <ul>
				                <c:forEach var="entry" items="${attribute}">
				                    <c:if test="${entry.key != 'Group'}">
				                        <c:forEach var="attributeValue" items="${entry.value}">
				                            <li>
				                                <input type="checkbox" name="${entry.key}" id="${entry.key}_${attributeValue.attribute_value_idx}" value="${attributeValue.attribute_value_idx}">
				                                <label for="${entry.key}_${attributeValue.attribute_value_idx}">${attributeValue.attribute_value_name}</label>
				                            </li>
				                        </c:forEach>
				                    </c:if>
				                </c:forEach>
				            </ul>
				            <button class="filter-val-all"># 더보기</button>
				        </td>
				    </tr>
				</c:forEach>
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
	
    let selectedFilters = []; 
    let lowestPrice = null;
    let highestPrice = null; 
    let listSearch = null; 
    let sortType = null; 
    let nowpage = null;
    let categoryIdx = "${categoryIdx}"
	
    getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,nowpage)
    
     document.addEventListener("click",(e)=>{
    	  const clicked = e.target
    	  if(clicked.matches(".quick-finder-search-container li")){
    		  sortType = clicked.dataset.sorttype;
    		  document.querySelectorAll(".quick-finder-search-container li").forEach(li=>li.className = "")
    		  clicked.className = "list-filter-active"
    		 getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,1)
    	  }
    	  if(clicked.matches(".paging-li")){
    		  nowpage = clicked.textContent;
    		  getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,nowpage)
    		  window.scrollTo(0, 700)
    	  }
    	  if(clicked.matches(".list-search-btn")){
    		  listSearch = document.querySelector(".list-search").value.toUpperCase();
    		  getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,1)
    	  }
    	  if(clicked.matches(".paging-next-btn")){
    		  nowpage = clicked.dataset.nowpage;
    		  getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,nowpage)
    		}
    	  if(clicked.matches(".paging-prev-btn")){
    		  nowpage = clicked.dataset.nowpage;
    		  getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,nowpage)
    	  }
      })
      
      document.addEventListener("change",(e)=>{
    	if(e.target.matches("input[type='checkbox']")){
    		const inputChecked = document.querySelectorAll("input:checked")
    		selectedFilters = Array.from(inputChecked).map(input=>input.value);
    		getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,1)
    	}
      })
    
    
    
    
	async function getProductPagingFilterList(
			categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,nowpage
   		 ){
	    const res = await fetch("/DetailSearch/getProductPagingFilterList", {
       method: "POST",
       headers: {"Content-Type": "application/json",},
       body: JSON.stringify({ 
    	categoryIdx      : categoryIdx,
       	selectedFilters  : selectedFilters,
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
   
   	return result.purposeList;
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
   	    itemImg.src = "/images/product/" +  item.PRODUCT_SFILE_NAME
   	    
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

    function formatNumberWithCommasAndWon(number) {
  	  return number.toLocaleString('ko-KR') + '원';
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
	
	</script>
</body>
</html>






