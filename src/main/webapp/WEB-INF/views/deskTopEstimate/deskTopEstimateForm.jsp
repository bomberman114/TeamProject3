<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PC 견적</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
<script type="text/javascript">
</script>
</head>
<body>
    <%@include file="/WEB-INF/include/header.jsp"%>
    <main class="desktopestimate-main" style="max-width: 1100px; margin-left: 150px;">
        <section class="content">
            <h1 style="font-size: 24px; color: #333333; margin-bottom: 10px; font-weight: bold;">PC 견적</h1>
            <div class="desk-search-bar">
                <input type="text" class="desk-search-bar"  placeholder="  상품명을 입력하세요">
                <button style="border:none; height: 60px; width: 60px; background-color: #D2CBCB;">검색</button>
            </div>

            <div class="desk-filters">
                <h3 style="padding-left:40px; line-height: 60px; background-color: #cccccc; height: 60px; width: 788px;">
                <strong>CPU</strong> 상품 개수 : <strong>##개</strong> 
                <button style="border:none; background-color: #D2CBCB; margin-left: 510px; color:#767676;">옵션 전체보기</button>
                </h3>

             <div style="margin: 15px;">
                <div style="display: flex; align-items: center; gap: 50px;">
                <h3 style="color:#333333; margin-left: 30px; font-weight: bold;">필터1</h3>
                <label><input type="checkbox" style="color:#55555;"> 필터값1</label>
                <label><input type="checkbox"> 필터값2</label>
                <label><input type="checkbox"> 필터값3</label>
                <label><input type="checkbox"> 필터값4</label>
                <label><input type="checkbox"> 필터값5</label>
                <p style="margin-left:20px;">##개+</p>
                </div>
                </div>
                <div style="margin: 15px;">
                <div style="display: flex; align-items: center; gap: 50px;">
                <h3 style="color:#333333; margin-left: 30px; font-weight: bold;">필터1</h3>
                <label><input type="checkbox" style="color:#55555;"> 필터값1</label>
                <label><input type="checkbox"> 필터값2</label>
                <label><input type="checkbox"> 필터값3</label>
                <label><input type="checkbox"> 필터값4</label>
                <label><input type="checkbox"> 필터값5</label>
                <p style="margin-left:20px;">##개+</p>
                </div>
                </div>
                <div style="margin: 15px;">
                <div style="display: flex; align-items: center; gap: 50px;">
                <h3 style="color:#333333; margin-left: 30px; font-weight: bold;">필터1</h3>
                <label><input type="checkbox" style="color:#55555;"> 필터값1</label>
                <label><input type="checkbox"> 필터값2</label>
                <label><input type="checkbox"> 필터값3</label>
                <label><input type="checkbox"> 필터값4</label>
                <label><input type="checkbox"> 필터값5</label>
                <p style="margin-left:20px;">##개+</p>
                </div>
                </div>
                <div style="margin: 15px;">
                <div style="display: flex; align-items: center; gap: 50px;">
                <h3 style="color:#333333; margin-left: 30px; font-weight: bold;">필터1</h3>
                <label><input type="checkbox" style="color:#55555;"> 필터값1</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값2</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값3</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값4</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값5</label>
                <p style="margin-left:20px;">##개+</p> 
                </div>
                </div>
                <div style="margin: 15px;">
                <div style="display: flex; align-items: center; gap: 50px;">
                <h3 style="color:#333333; margin-left: 30px; font-weight: bold;">필터1</h3>
                <label><input type="checkbox" style="color:#55555;"> 필터값1</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값2</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값3</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값4</label>
                <label><input type="checkbox" style="color:#55555;"> 필터값5</label>
                <p style="margin-left:20px;">##개+</p>
                </div>
                </div>
            </div>
         
         <div class="desk-click">
         <p>인기상품순</p><p>낮은가격순</p><p>높은가격순</p><p>신상품순</p>
         </div>
         
            <div class="product-list">
                <div class="product-item">
                <img src="/img/desktopestimate/빅터스 정면.jpg" alt="상품 이미지" style="height: 80px; width: 80px; margin-left: 10px; ">
                <div class="product-description">
                <h4 style="font-weight: bold; margin-left: 20px;">상품제목</h4>
                <p style="color:#767676;font-size:14px; max-width: 492px; margin-left: 20px;">상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세...</p> 
                <p style="color:#767676;margin-left: 20px;">등록일 : 2024.12</p>
                </div>
                <div class="price-container">
                <p style="font-weight: 20px; color:#333333; margin-right: 5px;">###,###원</p>
                <button style="height: 42px; width: 78px; color: #767676; border: #cccccc; font-weight: bold;">담기</button>
                </div>
                </div>
               <div class="product-item">
                <img src="/img/desktopestimate/빅터스 정면.jpg" alt="상품 이미지" style="height: 80px; width: 80px; margin-left: 10px; ">
                <div class="product-description">
                <h4 style="font-weight: bold; margin-left: 20px;">상품제목</h4>
                <p style="color:#767676;font-size:14px; max-width: 492px; margin-left: 20px;">상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세...</p> 
                <p style="color:#767676;margin-left: 20px;">등록일 : 2024.12</p>
                </div>
                <div class="price-container">
                <p style="font-weight: 20px; color:#333333; margin-right: 5px;">###,###원</p>
                <button style="height: 42px; width: 78px; color: #767676; border: #cccccc; font-weight: bold;">담기</button>
                </div>
                </div>
                <div class="product-item">
                <img src="/img/desktopestimate/빅터스 정면.jpg" alt="상품 이미지" style="height: 80px; width: 80px; margin-left: 10px; ">
                <div class="product-description">
                <h4 style="font-weight: bold; margin-left: 20px;">상품제목</h4>
                <p style="color:#767676;font-size:14px; max-width: 492px; margin-left: 20px;">상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세...</p> 
                <p style="color:#767676;margin-left: 20px;">등록일 : 2024.12</p>
                </div>
                <div class="price-container">
                <p style="font-weight: 20px; color:#333333; margin-right: 5px;">###,###원</p>
                <button style="height: 42px; width: 78px; color: #767676; border: #cccccc; font-weight: bold;">담기</button>
                </div>
                </div>
                <div class="product-item">
                <img src="/img/desktopestimate/빅터스 정면.jpg" alt="상품 이미지" style="height: 80px; width: 80px; margin-left: 10px; ">
                <div class="product-description">
                <h4 style="font-weight: bold; margin-left: 20px;">상품제목</h4>
                <p style="color:#767676;font-size:14px; max-width: 492px; margin-left: 20px;">상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세...</p> 
                <p style="color:#767676;margin-left: 20px;">등록일 : 2024.12</p>
                </div>
                <div class="price-container">
                <p style="font-weight: 20px; color:#333333; margin-right: 5px;">###,###원</p>
                <button style="height: 42px; width: 78px; color: #767676; border: #cccccc; font-weight: bold;">담기</button>
                </div>
                </div>
                <div class="product-item">
                <img src="/img/desktopestimate/빅터스 정면.jpg" alt="상품 이미지" style="height: 80px; width: 80px; margin-left: 10px; ">
                <div class="product-description">
                <h4 style="font-weight: bold; margin-left: 20px;">상품제목</h4>
                <p style="color:#767676;font-size:14px; max-width: 492px; margin-left: 20px;">상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세...</p> 
                <p style="color:#767676;margin-left: 20px;">등록일 : 2024.12</p>
                </div>
                <div class="price-container">
                <p style="font-weight: 20px; color:#333333; margin-right: 5px;">###,###원</p>
                <button style="height: 42px; width: 78px; color: #767676; border: #cccccc; font-weight: bold;">담기</button>
                </div>
                </div>
                <div class="product-item">
                <img src="/img/desktopestimate/빅터스 정면.jpg" alt="상품 이미지" style="height: 80px; width: 80px; margin-left: 10px; ">
                <div class="product-description">
                <h4 style="font-weight: bold; margin-left: 20px;">상품제목</h4>
                <p style="color:#767676;font-size:14px; max-width: 492px; margin-left: 20px;">상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세스펙상품상세...</p> 
                <p style="color:#767676;margin-left: 20px;">등록일 : 2024.12</p>
                </div>
                <div class="price-container">
                <p style="font-weight: 20px; color:#333333; margin-right: 5px;">###,###원</p>
                <button style="height: 42px; width: 78px; color: #767676; border: #cccccc; font-weight: bold;">담기</button>
                </div>
                </div>
            </div>

            <div class="pagination">
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
            </div>
        </section>

        <aside class="sidebar-right">
            <div class="sidebar-name"> PC 주요 구성</div>
            <div class="desktop-specs">
                <div class="desktop-mini">CPU</div>
                <div class="desktop-mini">메인보드</div>
                <div class="desktop-mini">메모리</div>
                <div class="desktop-mini">그래픽카드</div>
                <div class="desktop-mini">SSD</div>
                <div class="desktop-mini">HDD</div>
                <div class="desktop-mini">CPU 쿨러</div>
                <div class="desktop-mini">케이스</div>
                <div class="desktop-mini">파워</div>
            </div>
            <div class="under-specs">
            <p class="under-under">총#개 품목선택 &nbsp; <button style="background-color: #ffffff; margin-right:15px; border: none;">전체 삭제</button></p>
            <div class="total-container" style="display: flex; justify-content: flex-start; align-items: center;">
            <p class="total-amount" style="margin-right: auto;">총 합계 금액</p>
            <p class="amount">#원</p>
            </div>
            <button class="desk-button">AI 호환성 체크</button>
         <button class="desk-button">호환성 체크</button>
         <button class="desk-button">견적 캡쳐</button>
            </div>
        </aside>
    </main>
<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>
