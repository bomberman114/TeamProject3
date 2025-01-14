<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<img class="scroll-top-btn" src="/images/icon/common-icon/scroll-top-btn.png" alt="위로가기">
			<ul class="dir-list">
				<li><a href="/">홈</a></li>
				<c:forEach var="categoryList" items="${parentCategoryList}" varStatus="outerStatus">
				    <li>
				        <select class="category-select">
				            <c:forEach var="category" items="${categoryList.categoryList}">
				                <c:set var="isSelected" value="false" />
				                <c:if test="${outerStatus.index == 0}">
				                    <c:forEach var="innerCategory" items="${parentCategoryList[1].categoryList}">
				                        <c:if test="${innerCategory.PARENT_CATEGORY_IDX == category.CATEGORY_IDX}">
				                            <c:set var="isSelected" value="true" />
				                        </c:if>
				                    </c:forEach>
				                </c:if>
				                <option value="${category.CATEGORY_IDX}" 
				                        ${isSelected ? 'selected="selected"' : ''}
				                        ${categoryIdx eq category.CATEGORY_IDX ? 'selected="selected"' : ''}>
				                    ${category.CATEGORY_NAME}
				                </option>
				            </c:forEach>
				        </select>
				    </li>
				</c:forEach>
			</ul>
			<div class="detail-search-title">상세검색</div>
			<div class="detail-search-container">
				<table>
				<c:forEach var="attribute" items="${categoryAttribueList}" varStatus="status">
						<c:if test="${status.index eq 7 }">
							<tr>
							<td>가격</td>
							<td class="price-filter">
								<input type="text" maxlength="11" name="lowestPrice" />~ <input type="text" maxlength="11" name="highestPrice" />
								<button class="detailSearch-price-filter-btn">검색</button>
							</td>
						</tr>
						</c:if>
				    <tr>
				        <td>
				            <c:forEach var="entry" items="${attribute}">
				                <c:if test="${entry.key != 'Group'}">
				                    ${entry.key}
				                </c:if>
				            </c:forEach>
				        </td>
				        <td>
							<c:forEach var="entry" items="${attribute}">
							    <c:if test="${entry.key != 'Group'}">
							        <c:set var="itemCount" value="0" />
							        <ul>
							            <c:forEach var="attributeValue" items="${entry.value}" varStatus="status">
							                    <li>
							                        <input type="checkbox" name="${entry.key}" id="${entry.key}_${attributeValue.attribute_value_idx}" value="${attributeValue.attribute_value_idx}">
							                        <label for="${entry.key}_${attributeValue.attribute_value_idx}">${attributeValue.attribute_value_name}</label>
							                    </li>
							                <c:set var="itemCount" value="${itemCount + 1}"/>
							            </c:forEach>
							        </ul>
							        <c:if test="${itemCount > 5}">
							            <button class="filter-val-all" data-overflowcount="${itemCount - 5}">${itemCount - 5}개+</button>
							        </c:if>
							    </c:if>
							</c:forEach>
				        </td>
				    </tr>
				</c:forEach>
				</table>
			</div>
			<p class="detailSearch-option-all-open-btn">옵션 전체보기</p>
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
					<li class="list-filter-active" data-sortType="">신상품순</li>
					<li data-sortType="lowestPrice">낮은가격순</li>
					<li data-sortType="highestPrice">높은가격순</li>
				</ul>
				<div class="quick-finder-search-list"></div>
			</div>
			<div class="paging-container"></div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	<script>
	
    let selectedFilters = []; 
    let lowestPrice     = null;
    let highestPrice    = null; 
    let listSearch      = null; 
    let sortType        = null; 
    let nowpage         = null;
    let categoryIdx     = "${categoryIdx}"
    let isOptionOpen    = false;
    
    const $scrollTopBtn = document.querySelector(".scroll-top-btn");
    $scrollTopBtn.addEventListener("click", () => {
        window.scroll({ top: 0, behavior: "smooth" });
    });
    window.addEventListener("scroll", () => {
      	if(window.scrollY > 0){
    		$scrollTopBtn.style.opacity = "1"
    		$scrollTopBtn.style.pointerEvents = "auto";
    	}else{
    		$scrollTopBtn.style.opacity = "0"
        $scrollTopBtn.style.pointerEvents = "none";
    	}
});
	
    getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,nowpage)
    
    filterAllBtnHeightCalc();
    
    function filterAllBtnHeightCalc(){
    	if(isOptionOpen != true){
    	      const $filterContainer = document.querySelector(".detail-search-container");
    	        let height = 0;
    	        for(let i = 0; i < 8 ; i++){
    	        	height += $filterContainer.querySelectorAll("tr")[i].clientHeight + 1
    	        }
    			$filterContainer.style.height =  height + "px"; 
    	}
  
    }

     document.addEventListener("click",(e)=>{
    	  const clicked = e.target	
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
    	  if(clicked.matches(".quick-finder-search-container li")){
    		  sortType = clicked.dataset.sorttype;
    		  document.querySelectorAll(".quick-finder-search-container li").forEach(li=>li.className = "")
    		  clicked.className = "list-filter-active"
    		  getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,1)
    	  }
    	  if(clicked.matches(".detailSearch-option-all-open-btn")){
    		  const $filterContainer = document.querySelector(".detail-search-container");
    		  if(isOptionOpen == true){
    			  isOptionOpen = !isOptionOpen
    			  $filterContainer.style.height = ($filterContainer.querySelector("tr").clientHeight + 1) * 8 + "px";
    			  clicked.textContent = "옵션 전체보기"
    		  }else{
    				isOptionOpen = !isOptionOpen
    	    	$filterContainer.style.height = "auto";
        		clicked.textContent = "옵션 간략보기"
    		  }
    	  }
    	  if(clicked.matches(".detailSearch-price-filter-btn")){
    		  lowestPrice = document.querySelector("input[name='lowestPrice']").value.replaceAll(",","")
    		  highestPrice = document.querySelector("input[name='highestPrice']").value.replaceAll(",","")
    		  getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,1)
    	  }
    	  if(clicked.matches(".filter-val-all")){
					if(clicked.previousElementSibling.style.display != "grid"){
						clicked.previousElementSibling.style.display = "grid";
						clicked.previousElementSibling.style.gridTemplateColumns = "repeat(5, 1fr)";
						clicked.textContent = "닫기";
					}else{
						clicked.previousElementSibling.style.display = "flex";
						clicked.previousElementSibling.style.gridTemplateColumns = "none";
						clicked.textContent = clicked.dataset.overflowcount + "개+";
					}
				filterAllBtnHeightCalc()
    	  }
      })
      
      document.addEventListener("change",(e)=>{
	    	if(e.target.matches("input[type='checkbox']")){
	    		const inputChecked = document.querySelectorAll("input:checked")
	    		selectedFilters = Array.from(inputChecked).map(input=>input.value);
	    		getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,1)
	    	}
	    	if(e.target.matches(".list-search")){
	    		listSearch = e.target.value;
	    	}
	    	if(e.target.matches(".category-select")){
	    		location.href = "DetailSearch?category=" + e.target.value
	    	}
	    	if (e.target.closest("input[name='제조사']")) {
	    		  const allLabels = document.querySelectorAll("td:last-child label");
	    		  let filterLabels = [];
	    		  
	    		  if (e.target.checked) {
	    		    if (e.target.nextElementSibling.textContent == "INTEL") {
	    		      filterLabels.push(...Array.from(allLabels).filter(label => label.textContent.includes("AMD")));
	    		      filterLabels.push(...Array.from(allLabels).filter(label => label.textContent.includes("라이젠")));
	    		    } else if(e.target.nextElementSibling.textContent == "AMD") {
	    		    	filterLabels.push(...Array.from(allLabels).filter(label => label.textContent.includes("인텔")));
	    		    	filterLabels.push(...Array.from(allLabels).filter(label => label.textContent.startsWith("코어")));
	    		    }
	    		    filterLabels.forEach(label => {
	    		      if (label.previousElementSibling.name != "제조사") {
	    		        label.previousElementSibling.disabled = true;
	    		      }
	    		    });
	    		  } else {
	    		    // 선택 해제 시 모든 체크박스의 disabled 상태를 해제
	    		    allLabels.forEach(label => {
	    		      if (label.previousElementSibling.name != "제조사") {
	    		        label.previousElementSibling.disabled = false;
	    		      }
	    		    });
	    		  }
	    		}
      })

       document.querySelector(".list-search").addEventListener("keyup",(e)=>{
 			   if(e.keyCode == 13 ){
 	    		  listSearch = document.querySelector(".list-search").value.toUpperCase();
 		    		getProductPagingFilterList(categoryIdx,selectedFilters,lowestPrice,highestPrice,listSearch,sortType,1)
 			   }
 		   })
      
 		   document.addEventListener('keyup', function(e) {
			    if (e.target.closest(".price-filter input")) {
			        let value = e.target.value.trim(); // 앞뒤 공백 제거
			        
			        // 입력값이 비어있으면 빈 문자열로 설정하고 함수 종료
			        if (value === '') {
			            e.target.value = '';
			            return;
			        }
			        
			        // 숫자와 쉼표만 허용하는 정규식
			        const regex = /^[0-9,]*$/;
			        
			        if (!regex.test(value)) {
			            // 숫자나 쉼표가 아닌 문자가 입력되면 해당 문자를 제거
			            value = value.replace(/[^0-9,]/g, '');
			        }
			        
			        value = Number(value.replaceAll(',', ''));
			        if (isNaN(value)) {
			            e.target.value = '';
			        } else {
			            const formatValue = value.toLocaleString('ko-KR');
			            e.target.value = formatValue;
			        }
			    }
			});
 		   
      
    
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
     if(result.response.list.length > 0){
	     createPagingList(result)
	     createProductList(result.response.list)    	 
     }else{
    	 document.querySelector(".quick-finder-search-list").innerHTML = "<div class='exception-title'>조건에 맞는 상품이 없습니다. 다시 선택해주세요.</div>"
    	 document.querySelector(".paging-container").innerHTML = ""
    	 alert("조건에 맞는 상품이 없습니다.")
     }
   
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
 	     itemLeftImgDiv.dataset.pname = item.PRODUCT_NAME;
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

		    const createAtLi        = document.createElement("li");
		    const bookMarkLi        = document.createElement("li");
		    const bookMarkLiImg     = document.createElement("img");
		    bookMarkLiImg.className = "bookmark-img"
		    bookMarkLiImg.src       = "/images/icon/common-icon/heart-76767-14.png"
		    
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
    
	</script>
	</body>
</html>




