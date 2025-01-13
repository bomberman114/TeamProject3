let   recentHistory = JSON.parse(localStorage.getItem("recent-history")) || [];
let   submenuActive = false;
const $recentList   = document.querySelector(".recent-list ul");
let   $submenu      = null;
let   $user         = null;;


const $searchDiv    = document.querySelector(".search-div");



// 클릭 위임 이벤트
document.addEventListener("click", (e) => {
	const clicked = e.target;
	// 검색인풋 클릭시 클래스 추가
	if (clicked.closest(".search-div")) {
			if(recentHistory.length == 0){
				$recentList.innerHTML = "<li>검색내역이 없습니다.</li>"
			}else if(recentHistory.length > 0){
			displayRecent()
}
			$searchDiv.classList.add("recent");
			
	}
	// 검색인풋 이외에 클릭하면 클래스 제거
	if (!clicked.closest(".search-div") && !clicked.closest(".recent-remove") && recentHistory.length == 0) {
		$searchDiv.classList.remove("recent");
	}
	if(e.target.matches(".recnet-remove-all")){
		console.log(1)
		recentHistory = []
		$recentList.innerHTML = "";
		localStorage.setItem('recent-history', JSON.stringify(recentHistory));
		$searchDiv.classList.remove("recent");
	}
	if(e.target.matches(".recent-list ul li a")){
		e.preventDefault();
		saveRecent(e.target.textContent)
		console.log(e.target.textContent)
		window.location = e.target.href;
	}
	
})

// 키업 위임 이벤트
document.addEventListener("keyup", (e) => {
	if(e.target.matches("input[name='search']") && e.target.value != null){
		if(e.target.value != ""){
				userSearch(e.target.value);			
		}else{
			displayRecent();
		}
	}
	if (e.target.matches("input[name='search']") && e.keyCode == 13) {
		saveRecent(e.target.value.trim())
		if(e.target.value != ""){
			location.href = "/dSearch?keyword=" + e.target.value		
		}
	}
})

// 최근검색 display
function displayRecent() {
	if(recentHistory.length > 0){
		
	document.querySelector(".recent-list p").style.display = "flex"
	let recentInnerHtml = "";
	recentHistory.forEach((item, index) => {
		recentInnerHtml += '<li><a href="/dSearch?keyword=' + item + '">'+ item + '</a>'
		recentInnerHtml += "<img src='/images/icon/header-icon/recent-close.png' alt='검색 삭제' class='recent-remove' onclick='removeRecent(" + index + ")'/></li>"})
	$recentList.innerHTML = recentInnerHtml;
	}
}

// 최근검색 저장
function saveRecent(keyword) {
	if (keyword != "" && keyword != null) {
		recentHistory.unshift(keyword);
	}
	if (recentHistory.length > 10) {
		recentHistory.pop();
	}
	localStorage.setItem('recent-history', JSON.stringify(recentHistory));
}

// 최근검색 삭제
function removeRecent(index) {
	recentHistory.splice(index, 1);
	localStorage.setItem('recent-history', JSON.stringify(recentHistory));
	displayRecent();
	if (recentHistory.length == 0) {
		$searchDiv.classList.remove("recent");
	}
}

let userSearchData = [];

async function userSearch(keyword) {
    const res = await fetch("/dSearch/postSearchList", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ keyword: keyword })
    });

    if (!res.ok) {
        throw new Error(`HTTP error status: ${res.status}`);
    }

    const result = await res.json();
    
    // 배열의 내용을 비교하는 함수
    function arraysEqual(arr1, arr2) {
        if (arr1.length !== arr2.length) return false;
        for (let i = 0; i < arr1.length; i++) {
            if (JSON.stringify(arr1[i]) !== JSON.stringify(arr2[i])) return false;
        }
        return true;
    }

    // 결과가 이전과 다를 때만 렌더링
    if (!arraysEqual(result.appliProduct, userSearchData)) {
        userSearchData = result.appliProduct;
        $recentList.innerHTML = "";
        document.querySelector(".recent-list p").style.display = "none";
        result.appliProduct.forEach((item, index) => {
						const li = document.createElement("li");
						const a  = document.createElement("a");
						a.textContent = item.PRODUCT_NAME
						a.href = "/dSearch?keyword=" + item.PRODUCT_NAME
						li.append(a)
						$recentList.append(li)
        });

    }

    console.log(result);
    return result.purposeList;
}

