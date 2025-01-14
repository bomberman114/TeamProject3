<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PC 견적</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script type="text/javascript">
   
    
    function capture() {
        // 모든 hidden input 요소 선택
        const hiddenInputs = document.querySelectorAll('.desktop-specs input[type="hidden"][name="PRODUCT_IDX"]');

        // 각 hidden input의 value를 배열에 저장
        const productIds = Array.from(hiddenInputs).map(input => input.value);

        // 결과 출력
        console.log("추출된 PRODUCT_IDX 값:", productIds);
        if (productIds.length == 0) {
            alert("상품을 선택해주세요");
            return; // 상품이 선택되지 않은 경우 함수 종료
        }

        if (productIds.length > 0) {
            let url = '/DeskTopEstimate/DeskTopCapture?productIdxList=' + productIds;
            fetch(url) // API 엔드포인트 확인
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답이 좋지 않습니다.');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log(data);
                    // 모달 띄우기
                    document.getElementById('capture-modal').style.display = 'flex';
                    const captureModalEl = document.getElementById('capture-modal');
                    let products = data.deskTopPartProductList;
                    captureModalEl.innerHTML = ''; // 모달 초기화

                    let html = '';
                    let totalPrice = 0; // 총 가격 초기화
                    html += '<div class="desk-modal-content">' +
                        '<span class="desk-close" onclick="closeModal1()" style="cursor: pointer;">&times;</span>' +
                        '<img src="/images/logo/logo.svg" style="height: 100px; width: 300px;" alt="로고" />' +
                        '<div id="capture-capture">' +
                            '<div id="capture-content">' +
                                '<div class="capture-category">분류</div>' +
                                '<div class="capture-image">이미지</div>' +
                                '<div class="capture-name">상품명</div>' +
                                '<div class="capture-price">가격</div>' +
                            '</div>';

                    // 각 제품 정보를 모달에 추가
                    products.forEach(product => {
                        html += '<div id="capture-content1">' +
                            '<div class="capture-category">' + product.CATEGORY_NAME + '</div>' +
                            '<img src="' + product.PRODUCT_SFILE_NAME + '" style="width: 14%;" class="capture-image" alt="로고" />' +
                            '<div class="capture-name">' + product.PRODUCT_NAME + '</div>' +
                            '<div class="capture-price">' + product.PRICE.toLocaleString() + ' 원</div>' +
                        '</div>';
                        totalPrice += product.PRICE; // 가격 합산
                    });

                    html += '<div class="total-modal-price">총 가격 : ' + totalPrice.toLocaleString() + ' 원</div>' +
                        '</div>' +
                        '<div class="button-container">' +
                            '<button id="download" class="capture-button">이미지 다운로드</button>' +
                        '</div>' +
                    '</div>';

                    // HTML 내용 추가
                    captureModalEl.innerHTML = html;
                    // 다운로드 버튼 클릭 이벤트 리스너 등록
                    document.getElementById('download').addEventListener('click', function() {
                        html2canvas(document.getElementById('capture-capture')).then(function(canvas) {
                            // 캔버스를 이미지로 변환
                            const imgData = canvas.toDataURL('image/png'); // PNG 형식으로 변환

                            // 링크 생성
                            const link = document.createElement('a');
                            link.href = imgData;
                            link.download = '견적_캡처.png'; // 다운로드할 파일 이름
                            link.click(); // 링크 클릭으로 다운로드 실행
                        });
                    });
                    
                })
                .catch(error => {
                    console.error('문제가 발생했습니다:', error);
                });
        }
    }


    function closeModal1() {
        document.getElementById('capture-modal').style.display = 'none';
    }
    
    function Compatibility() {
       // 모든 hidden input 요소 선택
       const hiddenInputs = document.querySelectorAll('.desktop-specs input[type="hidden"][name="PRODUCT_IDX"]');

       // 각 hidden input의 value를 배열에 저장
       const productIds = Array.from(hiddenInputs).map(input => input.value);

       // 결과 출력
       console.log("추출된 PRODUCT_IDX 값:", productIds);
       if(productIds.length == 0){
       alert("상품을 선택해주세요");
       };
       if(productIds.length > 0){
          
       let url = '/DeskTopEstimate/CompauterPartCompatibilityCheck?productIdxList=' + productIds;
        fetch(url) // API 엔드포인트 확인
         .then(response => {
             if (!response.ok) {
                 throw new Error('네트워크 응답이 좋지 않습니다.');
             }
             return response.json();
         })
         .then(data => {
            console.log(data);
        document.getElementById('compatibility-modal').style.display = 'block'; // 모달 표시
        const compatibilityModalEl = document.getElementById('compatibility-modal');
        compatibilityModalEl.innerHTML = '';
        let html = '';
        html +=  '<div class="desk-modal-content">' +
        '<span class="desk-close" onclick="closeModal()">&times;</span>' +
        '<h2 style="font-size: 20px; font-weight: bold; text-align: left; ' +
        ' ' +
        ' display: inline-block;">호환성 체크 결과</h2>' +
        '<div class="desk-modal-content2">' +
        
        '<div class="desk-modal-text">*호환성 좋지 않은 부품이 존재하면 해당 항목이 0점으로 표시되고 총점도 0점이 됩니다*</div>'+
        
        '<p style="margin-bottom: 20px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
        '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
        'CPU - 메모리' +
        '</span>' +  <!-- 고정된 width 설정 -->
        '<span style="font-size:10px; margin-left:20px; color:#e62807;">*메모리 규격의 일치 여부로 점수를 부여합니다*</span>' +
        '<span class="deskmodal-score">' + data.totalScoreCpuRam +  '점 / 15점</span>' +
      '</p>' +
            
            '<p style="margin-bottom: 30px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
            '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
            'CPU - 메인보드' +
            '</span>' + 
            '<span style="font-size:10px; margin-left:20px; color:#e62807;">*소켓의 일치 여부와 세부 칩셋에 따른 등급으로 점수를 부여합니다*</span><br>' +
            '<span class="deskmodal-score">' + data.totalScoreCpuMotherboard +  '점 / 15점</span>' +
          '</p>' +
          
          '<p style="margin-bottom: 30px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
          '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
          'CPU - 그래픽카드' +
          '</span>' +
          '<span style="font-size:10px; margin-left:20px; color:#e62807;">*제조사의 일치도에 따라 추가 점수를 부여합니다*</span><br>' +
          '<span class="deskmodal-score">' + data.totalScoreCpuGpuScore +  '점 / 15점</span>' +
        '</p>' +
                  
                  
        '<p style="margin-bottom: 30px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
        '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
        '메모리 - 메인보드' +
        '</span>' +
        '<span style="font-size:10px; margin-left:20px; color:#e62807;">*메모리 규격의 일치 여부와 소켓 용량에 따라 점수를 부여합니다*</span><br>' +
        '<span class="deskmodal-score">' + data.totalScoreMotherboardRam +  '점 / 15점</span>' +
      '</p>' +
                  
                  
      '<p style="margin-bottom: 30px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
      '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
      '케이스 - 메인보드' +
      '</span>' +
      '<span style="font-size:10px; margin-left:20px; color:#e62807;">*장착 규격이 일치하는 지에 따라 점수를 부여합니다*</span><br>' +
      '<span class="deskmodal-score">' + data.totalScoreMotherboardDesktopCase +  '점 / 15점</span>' +
      '</p>' +
                  
                  
      '<p style="margin-bottom: 30px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
      '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
      '케이스 - 그래픽카드' +
      '</span>' +
      '<span style="font-size:10px; margin-left:20px; color:#e62807;">*장착 길이에 따라 점수를 부여하고 조립 난이도가 낮을 시 추가 점수를 부여합니다*</span><br>' +
      '<span class="deskmodal-score">' + data.totalScoreGpuDesktopCase + '점 / 15점</span>' +
      '</p>' +
                  
      '<p style="margin-bottom: 30px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
      '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
      '케이스 - 파워' +
      '</span>' +
      '<span style="font-size:10px; margin-left:20px; color:#e62807;">*장착 규격이 일치하는 지에 따라 점수를 부여합니다. 조립 난이도가 낮을 시 추가 점수를 부여합니다*</span><br>' +
      '<span class="deskmodal-score">' + data.totalScoredesktopCasePower + '점 / 12점</span>' +
      '</p>' + 
                  
                  
      '<p style="margin-bottom: 30px; border-bottom: 2px solid #ccc; padding-bottom: 10px; color:#333333; display: flex; align-items: center;">' +
      '<span style="display: inline-block; width: 150px; border: 1px solid #ccc; border-radius: 6px; background-color: #CCC; color: #2A2A2A; text-align: center; padding: 5px;">' +
      '필요전력 - 파워' +
      '</span>' +
      '<span style="font-size:10px; margin-left:20px; color:#e62807;">*필요 전력 요구치가 정격 출력과 일치하면 점수를 부여합니다. 정격 출력이 높을 수록 추가 점수를 부여합니다*</span><br>' +
      '<span class="deskmodal-score">' + data.totalScorePowerGpu +  '점 / 15점</span>' +
      '</p>' + 
                  '</div>' +
              '<div class="desk-modal-totalsocre">' +    
                  '<p>*최고 점수 : 114점*</p>' +
                  '<p style="font-size:18px;">내 호환성 점수 : ' + data.totalScore + '점</p>' + 
              '</div>' +
          '</div>';
     // HTML 내용 추가
        compatibilityModalEl.innerHTML = html;
         })
         
         .catch(error => {
             console.error('문제가 발생했습니다:', error);
         });
       };
    }

    function closeModal() {
        document.getElementById('compatibility-modal').style.display = 'none'; // 모달 숨김
    }

    // 모달 바깥을 클릭하면 모달 닫기
    window.onclick = function(event) {
        const modal = document.getElementById('compatibility-modal');
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    }
    
    
    function showMore(button) {
        const labels = button.previousElementSibling.querySelectorAll('label.hidden');
        const hiddenCount = button.getAttribute('data-hidden-count');

        // 숨겨진 label 표시
        labels.forEach((label, index) => {
            if (index < parseInt(hiddenCount)) {
                label.classList.remove('hidden');
            }
        });

        // 버튼 숨기기 및 되돌리기 버튼 표시
        button.style.display = 'none'; // "더 보기" 버튼 숨김
        const undoButton = button.nextElementSibling;
        undoButton.style.display = 'inline-block'; // "닫기" 버튼 표시
    }

    function undo(button) {
        // 'desk-fillter' 클래스의 상위 요소를 찾기
        const filterContainer = button.closest('.desk-fillter');
        
        // 해당 필터의 모든 label 찾기
        const labels = filterContainer.querySelectorAll('label');

        // 모든 label을 숨김 처리, 기본 3개만 표시
        labels.forEach((label, index) => {
            if (index >= 3) {
                label.classList.add('hidden'); // 기본 3개만 표시
            }
        });

        // 버튼 표시 상태 복구
        const showMoreButton = button.previousElementSibling; // "더 보기" 버튼
        showMoreButton.style.display = 'inline-block'; // "더 보기" 버튼 표시
        button.style.display = 'none'; // "닫기" 버튼 숨김
    }

    
    function toggleAll(button) {
        const deskFilters = document.querySelectorAll('.desk-fillter');
        const isExpanding = button.textContent === '옵션 전체보기';

        deskFilters.forEach(filter => {
            const labels = filter.querySelectorAll('label');
            const showMoreButton = filter.querySelector('.show-more-btn');
            const undoButton = filter.querySelector('.undo-btn');

            labels.forEach((label, index) => {
                if (isExpanding) {
                    label.classList.remove('hidden'); // 모든 label 표시
                } else {
                    if (index >= 3) {
                        label.classList.add('hidden'); // 기본 3개만 표시
                    }
                }
            });

            // 더 보기 버튼 및 되돌리기 버튼 상태 조정
            if (showMoreButton) {
                showMoreButton.style.display = isExpanding ? 'none' : 'inline-block'; // '더 보기' 버튼 표시
            }
            if (undoButton) {
                undoButton.style.display = 'none'; // '닫기' 버튼 숨김
            }
        });

        // 버튼 텍스트 변경
        button.textContent = isExpanding ? '닫기' : '옵션 전체보기';
    }
        // AJAX 요청 함수
        function ajax(nowpage, category, map) {
           console.log(map);
           let url = '/DeskTopEstimate/DeskTopEstimateFiler?nowpage=' + nowpage + '&pageSize=10&category=' + category;
           if(map){
              if(map.categoryAttributeIdxs && map.categoryAttributeValueIdxs){
                 url += '&categoryAttributeIdxs=' + map.categoryAttributeIdxs.join(',') + 
                    '&categoryAttributeValueIdxs=' + map.categoryAttributeValueIdxs.join(',');
              };
           };
            fetch(url) // API 엔드포인트 확인
                .then(response => {
                    if (!response.ok) {
                        throw new Error('네트워크 응답이 좋지 않습니다.');
                    }
                    return response.json();
                })
                .then(data => {
                    updateHTML(data);
                })
                .catch(error => {
                    console.error('문제가 발생했습니다:', error);
                });
        }

     // HTML 업데이트 함수
        function updateHTML(data) {
            const categoryMap = data.categoryMap;
            const count = data.count;
            const deskTopEstimateProductFilterList = data.deskTopEstimateProductFilterList;
            const productResultList = data.productResultList;
            const pagination = data.pagination;
            const pageSize = data.pageSize;
            const nowpage = data.nowpage;
            const categoryAttributeIdxs = data.categoryAttributeIdxs;
            const categoryAttributeValueIdxs = data.categoryAttributeValueIdxs;
         console.log("categoryAttributeIdxs: "+categoryAttributeIdxs);
            //console.log(count);

            // 카테고리 및 상품 개수 업데이트
            updateCategoryHeader(categoryMap, count);
            
         if(categoryAttributeIdxs === undefined && categoryAttributeValueIdxs === undefined){
            // 필터 리스트 업데이트
               updateFilterList(deskTopEstimateProductFilterList);
         };

            // 상품 리스트 업데이트
            updateProductList(productResultList);

            // 페이징 업데이트
            updatePagination(pagination, pageSize, nowpage, categoryMap);
            // 체크박스에 이벤트 리스너 추가
            addCheckboxListeners(categoryMap);
        }

        // 카테고리 헤더 업데이트 함수
        function updateCategoryHeader(categoryMap, count) {
            const headerElement = document.querySelector('.desk-filters h3');
            if (headerElement) { // headerElement가 존재하는지 확인
                headerElement.innerHTML = "<span><strong>" + categoryMap.CATEGORY_NAME + "</strong> 상품 개수 : <strong>" + count + "개</strong></span>" +
                    "<button class='show-all-btn' onclick='toggleAll(this)' style='border: none; background-color: #1A3D91; color: #ffffff; margin-left: auto;'>옵션 전체보기</button>";
            }
        }
        
        
        

        // 필터 리스트 업데이트 함수
        function updateFilterList(deskTopEstimateProductFilterList) {
            const desktopPartFillter = document.querySelector('#desktopPartFillter');
            desktopPartFillter.innerHTML = '';
            let filterHTML = '';
            
            deskTopEstimateProductFilterList.forEach(function(item) {
                filterHTML += 
                    "<div class='desk-fillter'>" +
                        "<h3>" + item.CATEGORY_ATTRIBUTE_NAME + "</h3>" +
                        "<input type='hidden' name='CATEGORY_ATTRIBUTE_IDX' value='" + item.CATEGORY_ATTRIBUTE_IDX + "'>" +
                        "<div class='checkbox-group'>";

                item.items.forEach(function(subItem, index) {
                    // 인덱스에 따라 'hidden' 클래스를 추가
                    const hiddenClass = index < 3 ? '' : 'hidden';
                    filterHTML += "<label class='" + hiddenClass + "'> " +
                        "<input type='checkbox' name='CATEGORY_ATTRIBUTE_VALUE_IDX' value='" + subItem.CATEGORY_ATTRIBUTE_VALUE_IDX + "'> " + 
                        subItem.CATEGORY_ATTRIBUTE_VALUE_NAME + 
                        "</label>";
                });

                filterHTML += "</div>"; // checkbox-group div 종료

                // 아이템 수에 따른 "더 보기" 버튼 추가
                if (item.items.length > 3) {
                    filterHTML += 
                        "<button class='show-more-btn' onclick='showMore(this)' data-hidden-count='" + (item.items.length - 3) + "'>" +
                        (item.items.length - 3) + "개+</button>" +
                        "<button class='show-more-btn undo-btn' onclick='undo(this)' style='display: none;'>닫기-</button>";
                }
                filterHTML += "</div>"; // desk-fillter div 종료
            });

            desktopPartFillter.innerHTML = filterHTML;
        }

        function updateProductList(productResultList) {
            const productListContainer = document.querySelector('.product-list');
            productListContainer.innerHTML = ''; // 초기화

            productResultList.forEach(function(product) {
                const productHTML = 
                    "<input type='hidden' name='CATEGORY_IDX' value='" + product.CATEGORY_IDX + "'>" +
                    "<input type='hidden' name='PRODUCT_IDX' value='" + product.PRODUCT_IDX + "'>" +
                    "<div class='product-item'>" +
                        "<img src='" + product.PRODUCT_SFILE_NAME + "' alt='상품 이미지' style='height: 80px; width: 80px; margin-left: 10px;'>" +
                        "<div class='product-description'>" +
                            "<h4 style='font-weight: bold; margin-left: 20px;'>" + product.PRODUCT_NAME + "</h4>" +
                            "<p style='color: #767676; font-size: 14px; max-width: 492px; margin-left: 20px;'>" + product.PRODUCT_DESCRIPTION + "</p>" +
                            "<p style='color: #767676; margin-left: 20px;'>등록일 : " + new Date(product.CREATED_AT).toLocaleDateString() + "</p>" +
                        "</div>" +
                        "<div class='price-container'>" +
                            "<p class='price' style='font-weight: 20px; color: #333333; margin-right: 5px;'>" + product.PRICE.toLocaleString() + "원</p>" +
                            "<button class='add-btn' data-idx='" + product.PRODUCT_IDX + "' data-category='" + product.CATEGORY_IDX + "' style='height: 42px; width: 78px; color: #767676; border: #cccccc; font-weight: bold;'>담기</button>" +
                        "</div>" +
                    "</div>";
                productListContainer.innerHTML += productHTML;
            });

         // add-btn 클릭 이벤트 리스너 추가
            document.querySelectorAll('.add-btn').forEach(button => {
                button.addEventListener('click', function() {
                    const category = this.dataset.category;
                    const productName = this.closest('.product-item').querySelector('.product-description h4').textContent;
                    const productPrice = parseInt(this.closest('.price-container').querySelector('.price').textContent.replace(/[^0-9]/g, '')); // 가격을 숫자로 변환
                    const productIdx = this.dataset.idx; // PRODUCT_IDX를 가져옴


                    // 해당 카테고리의 hidden-content 요소에 제품 이름과 가격을 설정
                    const hiddenContent = document.querySelector('a[href*="category=' + category + '"] .hidden-content');
                    if (hiddenContent) {
                        hiddenContent.querySelector('p').textContent = productName;
                        hiddenContent.querySelector('span.price').textContent = productPrice.toLocaleString() + "원"; // 가격 업데이트

                     // 숨겨진 input 요소에 PRODUCT_IDX 설정
                        let hiddenInput = hiddenContent.querySelector('input[name="PRODUCT_IDX"]');
                        if (!hiddenInput) {
                            // 존재하지 않으면 새로운 input 요소 생성
                            hiddenInput = document.createElement('input');
                            hiddenInput.type = 'hidden';
                            hiddenInput.name = 'PRODUCT_IDX';
                            hiddenContent.appendChild(hiddenInput); // hidden-content에 추가
                        }
                        hiddenInput.value = productIdx; // PRODUCT_IDX 설정
                        
                        
                        // 취소 버튼 추가
                        let cancelButton = hiddenContent.querySelector('.cancel-btn');
                        if (!cancelButton) {
                            cancelButton = document.createElement('button');
                            cancelButton.className = 'cancel-btn';
                            cancelButton.textContent = '취소';
                            cancelButton.style = 'height: 42px; width: 78px; color: #ff0000; border: #cccccc; font-weight: bold; margin-left: 5px; background-color: #FFBEBE;'; // 배경색 변경
                            hiddenContent.appendChild(cancelButton); // hidden-content에 추가
                        }

                        // 취소 버튼 클릭 이벤트 리스너 추가
                        cancelButton.onclick = function() {
                            hiddenContent.querySelector('p').textContent = ''; // 제품 이름 지우기
                            hiddenContent.querySelector('span.price').textContent = ''; // 가격 지우기
                            hiddenInput.value = ''; // PRODUCT_IDX 지우기
                            cancelButton.remove(); // 취소 버튼 제거

                            // 총 가격 업데이트
                            updateTotalPrice();
                        };
                    }

                    // 총 가격 계산하여 업데이트
                    updateTotalPrice();
                });
            });

        }

        function updateTotalPrice() {
            const prices = document.querySelectorAll('.hidden-content span.price');
            let totalPrice = 0;

            prices.forEach(priceElement => {
                const priceText = priceElement.textContent.replace(/[^0-9]/g, ''); // 숫자만 추출
                const priceValue = parseInt(priceText); // 숫자로 변환

                // 가격이 유효한 경우에만 더함
                if (!isNaN(priceValue)) {
                    totalPrice += priceValue; // 총 가격에 추가
                }
            });

            const totalPriceElement = document.querySelector('.total-add-price');
            if (totalPriceElement) {
                totalPriceElement.textContent = totalPrice.toLocaleString() + "원"; // 총 가격 업데이트
            }
        }
        
        
        
        
        // 페이징 업데이트 함수
       function updatePagination(pagination, pageSize, nowpage, categoryMap) {
    const paginationContainer = document.querySelector('.desk-pagination');
    let map = {};
    let categoryAttributeIdxs = categoryMap.categoryAttributeIdxs;
    let categoryAttributeValueIdxs = categoryMap.categoryAttributeValueIdxs;
    if(categoryAttributeIdxs && categoryAttributeValueIdxs){
    map.categoryAttributeIdxs = categoryAttributeIdxs;
    map.categoryAttributeValueIdxs = categoryAttributeValueIdxs;
    };
    console.log(pagination);
    console.log(categoryMap);
    paginationContainer.innerHTML = ''; // 초기화
    const category = categoryMap.CATEGORY_IDX;
    let url = "/DeskTopEstimate/DeskTopEstimateFiler";

    if (nowpage > 1) {
        let prevUrl = "?nowpage=" + (nowpage - 1) + "&pageSize=" + pageSize + "&category=" + categoryMap.CATEGORY_IDX;
        if (categoryMap.categoryAttributeIdxs && categoryMap.categoryAttributeValueIdxs) {
            // URL에 파라미터 추가
            prevUrl += '&categoryAttributeIdxs=' + categoryMap.categoryAttributeIdxs.join(',') + 
                       '&categoryAttributeValueIdxs=' + categoryMap.categoryAttributeValueIdxs.join(',');
        };
        const prevLink = document.createElement('a');
        prevLink.id = 'page';
        prevLink.href = url + prevUrl;
        prevLink.textContent = '이전';
        prevLink.onclick = function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            ajax(nowpage - 1, category, map); // AJAX 호출
        };
        paginationContainer.appendChild(prevLink);
    }

    for (let i = 1; i <= pagination.totalPageCount; i++) {
        const pageLink = document.createElement('a');
        let pageUrl = "?nowpage=" + i + "&pageSize=" + pageSize + "&category=" + categoryMap.CATEGORY_IDX;
        if (categoryMap.categoryAttributeIdxs && categoryMap.categoryAttributeValueIdxs) {
            // URL에 파라미터 추가
            pageUrl += '&categoryAttributeIdxs=' + categoryMap.categoryAttributeIdxs.join(',') + 
                       '&categoryAttributeValueIdxs=' + categoryMap.categoryAttributeValueIdxs.join(',');
        };
        const currentClass = (i === nowpage) ? 'current-page' : '';

        pageLink.id = 'page';
        pageLink.className = currentClass;
        pageLink.href = url + pageUrl;
        pageLink.textContent = i;

        pageLink.onclick = function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            ajax(i, category, map); // AJAX 호출
        };
        paginationContainer.appendChild(pageLink);
    }

    if (nowpage < pagination.endPage) {
        let nextUrl = "?nowpage=" + (nowpage + 1) + "&pageSize=" + pageSize + "&category=" + categoryMap.CATEGORY_IDX;
        if (categoryMap.categoryAttributeIdxs && categoryMap.categoryAttributeValueIdxs) {
           nextUrl += '&categoryAttributeIdxs=' + categoryMap.categoryAttributeIdxs.join(',') + 
             '&categoryAttributeValueIdxs=' + categoryMap.categoryAttributeValueIdxs.join(',');
        };
        const nextLink = document.createElement('a');
        nextLink.id = 'page';
        nextLink.href = url + nextUrl;
        nextLink.textContent = '다음';
        nextLink.onclick = function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            ajax(nowpage + 1, category, map); // AJAX 호출
        };
        paginationContainer.appendChild(nextLink);
    }
}

        window.onload = function() {
            ajax(nowpage=1, category=5); // 페이지 로드 시 AJAX 호출
            
            // 옵션 전체보기 버튼 이벤트 바인딩
            const toggleAllButton = document.querySelector('.desk-filters h3 button');
            if (toggleAllButton) {
                toggleAllButton.addEventListener('click', function () {
                    toggleAll(this);
                });
            }
        };
        
     // DOMContentLoaded 이벤트를 사용하여 DOM이 완전히 로드된 후 실행
        document.addEventListener('DOMContentLoaded', function() {
            // 모든 .DeskTopEstimateCategory 요소를 찾기
            document.querySelectorAll('.DeskTopEstimateCategory').forEach(function(link) {
                link.addEventListener('click', function(event) {
                    event.preventDefault(); // 기본 링크 동작 방지
                    event.stopPropagation(); // 이벤트 전파 방지
                    
                    // 카테고리 값 추출
                    const category = this.getAttribute('href').split('=')[1];
                    
                    // 모든 .desktop-mini 요소의 배경색 초기화
                    document.querySelectorAll('.desktop-mini').forEach(function(mini) {
                        mini.style.backgroundColor = '#ffffff'; // 기본 배경색으로 초기화
                        // 취소 버튼도 제거하고 색상 초기화
                        const hiddenContent = mini.closest('a').querySelector('.hidden-content');
                        if (hiddenContent) {
                            const cancelButton = hiddenContent.querySelector('.cancel-btn');
                            if (cancelButton) {
                                cancelButton.style.backgroundColor = '#ffffff'; // 취소 버튼 색상 초기화
                            }
                        }
                    });
                    
                    // 클릭한 카테고리의 배경색 변경
                    const selectedMini = this.querySelector('.desktop-mini');
                    selectedMini.style.backgroundColor = '#FFBEBE'; // 클릭한 요소의 배경색 변경

                    // 취소 버튼 색상 변경
                    const hiddenContent = selectedMini.closest('a').querySelector('.hidden-content');
                    const cancelButton = hiddenContent.querySelector('.cancel-btn');
                    if (cancelButton) {
                        cancelButton.style.backgroundColor = '#FFBEBE'; // 취소 버튼 색상 변경
                    }

                    // AJAX 호출
                    ajax(1, category); // 첫 페이지와 카테고리 값을 전달
                });
            });

         // 페이지 로드 시 CPU 카테고리의 배경색 변경
            const cpuCategory = document.querySelector('.DeskTopEstimateCategory[href*="category=5"] .desktop-mini'); // CPU 카테고리 선택
            if (cpuCategory) {
                cpuCategory.style.backgroundColor = '#FFBEBE'; // 배경색 설정

                // CPU 카테고리의 취소 버튼 색상도 변경
                const hiddenContent = cpuCategory.closest('a').querySelector('.hidden-content');
                const cancelButton = hiddenContent.querySelector('.cancel-btn');
                if (cancelButton) {
                    cancelButton.style.backgroundColor = '#FFBEBE'; // 취소 버튼 색상 변경
                }
            }
        });
     

        
        function addCheckboxListeners(categoryMap) {
      // 각 체크박스에 change 이벤트 리스너 추가
            const checkboxes = document.querySelectorAll('#desktopPartFillter input[type="checkbox"]');
            //const checkboxes = document.querySelectorAll('.desk-fillter input[type="checkbox"]');
            console.log('하이', checkboxes);
         let  category = categoryMap.CATEGORY_IDX;
         console.log(category);
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    console.log('체크박스 상태가 변경되었습니다.'); // 확인을 위한 로그 추가
                    const selectedValues = Array.from(checkboxes)
                        .filter(checkbox => checkbox.checked)
                        .map(checkbox => checkbox.value);
                    
                    // 가까운 숨겨진 입력 필드의 값을 수집
                    const hiddenValues = Array.from(checkboxes)
                        .filter(checkbox => checkbox.checked)
                        .map(checkbox => {
                            const hiddenInput = checkbox.closest('.desk-fillter').querySelector('input[type="hidden"]');
                            return hiddenInput ? hiddenInput.value : null;
                        });

                    // 선택된 체크박스 값과 숨겨진 값 결합
                    const allValues = {
                       CATEGORY_ATTRIBUTE_VALUE_IDXS: selectedValues,
                        CATEGORY_ATTRIBUTE_IDXS: hiddenValues
                    };
               
                    console.log('선택된 체크박스 값들:', selectedValues);
                    console.log('숨겨진 값들:', hiddenValues);
                    console.log('모든값 값들:', allValues);
                    
                    const queryString = new URLSearchParams({
                        CATEGORY_ATTRIBUTE_VALUE_IDXS: JSON.stringify(selectedValues),
                        CATEGORY_ATTRIBUTE_IDXS: JSON.stringify(hiddenValues),
                        pageSize: 10,
                        category: category
                    }).toString();
                    console.log('모든값 값들:', queryString);

                     sendData(allValues,category ); // 이 줄은 나중에 사용할 수 있습니다.
                });
            });
        };
        // AJAX 요청 함수
        function sendData(allValues,category) {

            // JSON 문자열로 변환하고 URI 인코딩
            const allValuesString = encodeURIComponent(JSON.stringify(allValues));
            
            fetch('/DeskTopEstimate/DeskTopEstimateFiler?allValuesString=' + allValuesString  + '&pageSize=10&category=' + category) // API 엔드포인트 확인
             .then(response => {
                 if (!response.ok) {
                     throw new Error('네트워크 응답이 좋지 않습니다.');
                 }
                 return response.json();
             })
             .then(data => {
                 const categoryMap = data.categoryMap;
                  const count = data.count;
                  const deskTopEstimateProductFilterList = data.deskTopEstimateProductFilterList;
                  const productResultList = data.productResultList;
                  const pagination = data.pagination;
                  const pageSize = data.pageSize;
                  const nowpage = data.nowpage;
                  const categoryAttributeIdxs = data.categoryAttributeIdxs;
                  const categoryAttributeValueIdxs = data.categoryAttributeValueIdxs;
                  categoryMap.categoryAttributeIdxs = categoryAttributeIdxs;
                  categoryMap.categoryAttributeValueIdxs = categoryAttributeValueIdxs;
                  console.log(categoryMap);
                 //updateHTML(data);
                  // 상품 리스트 업데이트
                  updateProductList(productResultList);

                  // 페이징 업데이트
                  updatePagination(pagination, pageSize, nowpage, categoryMap);
                  // 체크박스에 이벤트 리스너 추가
                  addCheckboxListeners(categoryMap);
             })
             .catch(error => {
                 console.error('문제가 발생했습니다:', error);
             });
     }

        </script>
</head>
<body>
   <%@include file="/WEB-INF/include/header.jsp"%>
   <main class="desktopestimate-main" style="max-width: 1300px; margin: 0 auto; height: auto;">
      <section class="content">
         <h1 style="font-size: 24px; color: #333333; margin-bottom: 10px; font-weight: bold;">PC 견적</h1>
         <div class="desk-search-bar">
            <input type="text" class="desk-search-bar" placeholder="상품명을 입력하세요">
            <button style="border: none; height: 60px; width: 60px; color: #ffffff; background-color: #1A3D91;">검색</button>
         </div>

         <div class="desk-filters">
            <h3 style="padding-left: 40px; color: #ffffff; line-height: 60px; background-color: #1A3D91; height: 60px; width: 788px; display: flex; justify-content: space-between; align-items: center;"></h3>
            <div id="desktopPartFillter"></div>
            <!-- 필터 리스트가 동적으로 추가될 부분 -->
         </div>



         <div class="product-list">
            <!-- 상품 리스트가 동적으로 추가될 부분 -->
         </div>

         <div class="desk-pagination">
            <!-- 페이징이 동적으로 추가될 부분 -->
         </div>
      </section>

      <aside class="sidebar-right">
         <div class="sidebar-name">PC 주요 구성</div>
         <div class="desktop-specs">
            <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=5"><div class="desktop-mini">
                  CPU
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=6"><div class="desktop-mini">
                  메인보드
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=7"><div class="desktop-mini">
                  메모리
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=8"><div class="desktop-mini">
                  그래픽카드
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=9"><div class="desktop-mini">
                  SSD
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=10"><div class="desktop-mini">
                  HDD
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=11"><div class="desktop-mini">
                  CPU 쿨러
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=12"><div class="desktop-mini">
                  케이스
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a> <a class="DeskTopEstimateCategory" href="/DeskTopEstimate/DeskTopEstimateFiler?category=13"><div class="desktop-mini">
                  파워
                  <div class=hidden-content>
                     <p></p>
                     <span class="price"></span>
                  </div>
               </div></a>
         </div>
         <div class="under-specs">
            <p class="under-under">
               총#개 품목선택 &nbsp;
               <button style="background-color: #ffffff; margin-right: 15px; border: none;">전체 삭제</button>
            </p>
            <div class="total-container" style="display: flex; justify-content: flex-start; align-items: center;">
               <p class="amount" style="margin-right: auto;">총 합계 금액</p>
               <p class="total-add-price">#원</p>
            </div>
            <button class="desk-button" onclick="Compatibility()">호환성 체크</button>
            <div id="compatibility-modal" class="desk-modal"></div>
            <button class="desk-capture-button" onclick="capture()">견적 캡쳐</button>
            
            <div id="capture-modal" class="desk-modal">
               
            </div>
      </aside>
   </main>
   <%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>

