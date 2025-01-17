<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>브랜드관</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5045804b97f82ee1c885808bf1ee578e&libraries=services"></script>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px; margin: auto;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}       
</style>
</head>
<body>
    <%@include file="/WEB-INF/include/header.jsp"%>
    <div class="brand-box">
        <div class="brand-text">
            브랜드관&nbsp; <span class="text-finder">설명서</span>
        </div>
        <div class="brand-links">
            <div class="brand-item">
                <a href="#" data-idx="1" data-content="lenovo"> 
                    <img src="/img/brandimg/LENOVO.png" alt="LENOVO" />
                </a>
                </div>
            <div class="brand-item">
                <a href="#" data-idx="2" data-content="samsung"> 
                    <img src="/img/brandimg/samsung.png" alt="SAMSUNG" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="9" data-content="lg"> 
                    <img src="/img/brandimg/LG.png" alt="LG" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="8" data-content="hp"> 
                    <img src="/img/brandimg/HP.png" alt="HP" />
                </a>
            </div>

            <div class="brand-item">
                <a href="#" data-idx="3" data-content="acer"> 
                    <img src="/img/brandimg/ACER.png" alt="ACER" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="6" data-content="dell"> 
                    <img src="/img/brandimg/DELL.png" alt="DELL" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="7" data-content="gigabyte"> 
                    <img src="/img/brandimg/GIGABYTE.png" alt="GIGABYTE" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="10" data-content="microsoft"> 
                    <img src="/img/brandimg/MICROSOFT.png" alt="MICROSOFT" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="12" data-content="razer"> 
                    <img src="/img/brandimg/RAZER.png" alt="RAZER" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="11" data-content="msi"> 
                    <img src="/img/brandimg/MSI.png" alt="MSI" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="5" data-content="asus"> 
                    <img src="/img/brandimg/ASUS.png" alt="ASUS" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-idx="4" data-content="apple"> 
                    <img src="/img/brandimg/APPLE.png" alt="APPLE" />
                </a>
            </div>
        </div>
    </div>
    <div class="map-container">
      <div id="brand-abcd-title"></div>
      <div id="brand-abcd-container" class="abcd-description-container"></div>
	  <div class="map_wrap">
        <div id="map" style="width:100%; height:100%; position:relative; overflow:hidden;"></div>
        <div id="menu_wrap" class="bg_white">
          <div class="option">
              <div>
                  <form onsubmit="searchPlaces(); return false;">
                      키워드 : <input type="text" value="" id="keyword" size="15"> 
                      <button type="submit">검색하기</button> 
                  </form>
              </div>
          </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
   </div>
</div>
    

    <div id="brand-description-container" class="brand-description-container"></div>
    <div id="additional-info-container" class="additional-info-container"></div> <!-- 추가 정보 컨테이너 -->




    <%@include file="/WEB-INF/include/footer.jsp"%>
</body>
<script>

    document.querySelectorAll('.brand-item a').forEach(item => {
        item.addEventListener('click', function(event) {
            event.preventDefault();
            
            const brandidx = this.getAttribute('data-idx');
            const brand = this.getAttribute('data-content');
            fetchRequest(brand, brandidx); // 브랜드에 대한 정보를 가져오기 위해 fetchRequest 호출
        });
    });

    function fetchRequest(brand, brandidx) {
        fetch('/LaptopBrand/BrandExplain?BRAND_MANUFACTURER_IDX=' + brandidx) // 브랜드를 URL 파라미터로 추가
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok: ' + response.status);
                }
                return response.json(); 
            })
            .then(data => {
                console.log(data);
                if (data.length > 0) {
                    const manufacturerExplain = data[0].BRAND_MANUFACTURER_EXPLAIN; // 첫 번째 데이터 항목에서 설명 가져오기
                    loadBrandContent(brand, manufacturerExplain); // 브랜드 설명과 manufacturerExplain 전달
                    displayAdditionalInfo(data); // 추가 정보 표시 함수 호출
                } else {
                    console.error('No data found for the specified brand.'); // 데이터가 없을 경우 에러 메시지
                }
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error); // 에러 발생 시 콘솔에 출력
            });
    }

    function displayAdditionalInfo(data) {
        const additionalInfoContainer = document.getElementById('additional-info-container');
        additionalInfoContainer.innerHTML = ''; // 기존 내용을 초기화

        data.forEach(item => {
            const itemDiv = document.createElement('div');
            itemDiv.className = 'additional-info-item';
            itemDiv.innerHTML = `
                <img src="${item.imageUrl}" alt="${item.name}" /> <!-- 이미지 URL -->
                <h3>${item.name}</h3> <!-- 브랜드 이름 -->
                <p>${item.description}</p> <!-- 설명 -->
            `;
           
        });
    }

    function loadBrandContent(brand, manufacturerExplain) {
        let content = '의 라인업에 대한 설명입니다.</p>';
        let additionalDescription = manufacturerExplain; // 가져온 설명을 사용

      let add1 = '';

        let value = '';
        switch(brand) {
            case 'lenovo':
                content = 'LENOVO' + content;
            value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://kr.msi.com/" class="brand-iframe"></iframe></div>';

                break;    
            case 'samsung':
                content = '삼성' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'lg':
                content = 'LG' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'hp':
                content = 'HP' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'acer':
                content = 'ACER' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'gigabyte':
                content = 'GIGABYTE' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'dell':
                content = 'DELL' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'microsoft':
                content = 'MICROSOFT' + content;
                value += 'MS' + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'razer':
                content = 'RAZER' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.razer.com/store/gaming-laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'msi':
                content = 'MSI' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://blog.naver.com/ww31ni/223051564142" class="brand-iframe"></iframe></div>';
                break;
            case 'asus':
                content = 'ASUS' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'apple':
                content = 'APPLE' + content;
                value += brand + ' 서비스센터';
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            default:
                content = '<h2>브랜드 설명</h2><p>선택된 브랜드에 대한 설명이 없습니다.</p>';
                additionalDescription = '<p>추가 정보가 없습니다.</p>';
        }
        searchPlaces(value);
        document.querySelector('#brand-abcd-container').innerHTML = additionalDescription;
        document.querySelector("#brand-abcd-title").innerHTML = content;
        document.querySelector('#brand-description-container').innerHTML = add1; // 추가 설명 업데이트
    }
   
   
    
    
    var markers = [];

    const mapContentInner = document.querySelector('.map-container')
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

    let recent = null
    
    mapContentInner.style.display = "none"
    document.addEventListener("click",(e)=>{
       if(e.target.closest(".brand-item") && recent != e.target.parentNode.dataset.content.toUpperCase()){
          mapContentInner.style.display = "block"
        document.getElementById('keyword').value = e.target.parentNode.dataset.content.toUpperCase() + " 서비스센터"
            recent = e.target.parentNode.dataset.content.toUpperCase();
          map.relayout(); // 지도 재구성
          searchPlaces();             
       }
    })
    
    
    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();  

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 키워드로 장소를 검색합니다
    //searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces(value) {
		
        var keyword = document.getElementById('keyword').value;
		if(value){
			document.getElementById('keyword').value = value;
			keyword = value;
		};
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }
        
        

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';
        
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i), 
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                    '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>';           

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i; 

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
     
     
 // 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
    function setMapType(maptype) { 
        var roadmapControl = document.getElementById('btnRoadmap');
        var skyviewControl = document.getElementById('btnSkyview'); 
        if (maptype === 'roadmap') {
            map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
            roadmapControl.className = 'selected_btn';
            skyviewControl.className = 'btn';
        } else {
            map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
            skyviewControl.className = 'selected_btn';
            roadmapControl.className = 'btn';
        }
    }

    const mapTypeControl = new kakao.maps.MapTypeControl();
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
 
    const zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
 
     
</script>
</body>
</html>
