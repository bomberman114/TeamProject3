<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>브랜드관</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />

    <script src="/js/searchHistory.js" defer></script>
</head>
<body>
    <%@include file="/WEB-INF/include/header.jsp"%>
    <div class="brand-box">
        <div class="brand-text">
            브랜드관&nbsp; <span class="text-finder">설명서</span>
        </div>
        <div class="brand-links">
            <div class="brand-item">
                <a href="#" data-content="samsung"> 
                    <img src="/img/brandimg/samsung.png" alt="SAMSUNG" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="lg"> 
                    <img src="/img/brandimg/LG.png" alt="LG" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="hp"> 
                    <img src="/img/brandimg/HP.png" alt="HP" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="lenovo"> 
                    <img src="/img/brandimg/LENOVO.png" alt="LENOVO" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="acer"> 
                    <img src="/img/brandimg/ACER.png" alt="ACER" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="gigabyte"> 
                    <img src="/img/brandimg/GIGABYTE.png" alt="GIGABYTE" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="dell"> 
                    <img src="/img/brandimg/DELL.png" alt="DELL" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="microsoft"> 
                    <img src="/img/brandimg/MICROSOFT.png" alt="MICROSOFT" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="razer"> 
                    <img src="/img/brandimg/RAZER.png" alt="RAZER" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="msi"> 
                    <img src="/img/brandimg/MSI.png" alt="MSI" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="asus"> 
                    <img src="/img/brandimg/ASUS.png" alt="ASUS" />
                </a>
            </div>
            <div class="brand-item">
                <a href="#" data-content="apple"> 
                    <img src="/img/brandimg/APPLE.png" alt="APPLE" />
                </a>
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
            
            const brand = this.getAttribute('data-content');
            loadBrandContent(brand);
            fetchRequest(brand); // 브랜드에 대한 정보를 가져오기 위해 fetchRequest 호출
        });
    });

    function fetchRequest(brand) {
        fetch('/LaptopBrand/BrandExplain?brand=' + brand) // 브랜드를 URL 파라미터로 추가
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok: ' + response.status);
                }
                return response.json(); 
            })
            .then(data => {
                console.log(data);
                // 데이터베이스에서 가져온 추가 정보 표시
                displayAdditionalInfo(data); // 추가 정보 표시 함수 호출
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error); 
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
            additionalInfoContainer.appendChild(itemDiv);
        });
    }

    function loadBrandContent(brand) {
        let content = '의 라인업에 대한 설명입니다.</p>';
        let additionalDescription = '';

        switch(brand) {
            case 'samsung':
                content = '삼성' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'lg':
                content = 'LG' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'hp':
                content = 'HP' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'lenovo':
                content = 'LENOVO' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'acer':
                content = 'ACER' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'gigabyte':
                content = 'GIGABYTE' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'dell':
                content = 'DELL' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'microsoft':
                content = 'MICROSOFT' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'razer':
                content = 'RAZER' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'msi':
                content = 'MSI' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'asus':
                content = 'ASUS' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            case 'apple':
                content = 'APPLE' + content;
                additionalDescription = '<p>이건 직접 입력</p>';
                break;
            default:
                content = '<h2>브랜드 설명</h2><p>선택된 브랜드에 대한 설명이 없습니다.</p>';
                additionalDescription = '<p>추가 정보가 없습니다.</p>';
        }

        document.querySelector('.brand-text').innerHTML = content;
        document.querySelector('#brand-description-container').innerHTML = additionalDescription; // 추가 설명 업데이트
    }
</script>
</body>
</html>
