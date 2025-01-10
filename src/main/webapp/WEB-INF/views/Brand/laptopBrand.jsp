<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>브랜드관</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />

    <script src="/js/searchHistory.js" defer></script>
    <script src="/js/mainCarousel.js" defer></script>
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
    <div id="brand-abcd-container" class="abcd-description-container"></div>
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
        
        switch(brand) {
            case 'lenovo':
                content = 'LENOVO' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;    
            case 'samsung':
                content = '삼성' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'lg':
                content = 'LG' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'hp':
                content = 'HP' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'acer':
                content = 'ACER' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'gigabyte':
                content = 'GIGABYTE' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'dell':
                content = 'DELL' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'microsoft':
                content = 'MICROSOFT' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'razer':
                content = 'RAZER' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'msi':
                content = 'MSI' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'asus':
                content = 'ASUS' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            case 'apple':
                content = 'APPLE' + content;
                add1 = '<div class="iframe-container"><iframe src="https://www.dell.com/ko-kr/shop/dell-laptops/scr/laptops" class="brand-iframe"></iframe></div>';
                break;
            default:
                content = '<h2>브랜드 설명</h2><p>선택된 브랜드에 대한 설명이 없습니다.</p>';
                additionalDescription = '<p>추가 정보가 없습니다.</p>';
        }
        
        document.querySelector('#brand-abcd-container').innerHTML = additionalDescription;
        document.querySelector('.brand-text').innerHTML = content;
        document.querySelector('#brand-description-container').innerHTML = add1; // 추가 설명 업데이트
    }
</script>
</body>
</html>
