<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PC 견적</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

header {
    background-color: #333;
    color: white;
    padding: 10px 20px;
}

.header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

nav a {
    color: white;
    margin: 0 10px;
    text-decoration: none;
}

main {
    display: flex;
    padding: 20px;
}

.sidebar {
    width: 200px;
    background-color: #fff;
    padding: 20px;
    margin-right: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.content {
    flex-grow: 1;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.sidebar-right {
    width: 200px;
    background-color: #fff;
    padding: 20px;
    margin-left: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.search-bar {
    display: flex;
    margin-bottom: 20px;
}

.search-bar input {
    flex-grow: 1;
    padding: 10px;
    border: 1px solid #ccc;
}

.search-bar button {
    padding: 10px;
    background-color: #333;
    color: white;
    border: none;
    cursor: pointer;
}

.filters {
    margin-bottom: 20px;
}

.product-list {
    margin-bottom: 20px;
}

.product-item {
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
}

.product-item button {
    background-color: #333;
    color: white;
    border: none;
    cursor: pointer;
}

.pagination {
    display: flex;
    justify-content: center;
}

.pagination button {
    margin: 0 5px;
}

footer {
    text-align: center;
    padding: 10px;
    background-color: #333;
    color: white;
    position: relative;
    bottom: 0;
    width: 100%;
}


</style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo">로고</div>
            <nav>
                <a href="#">로그인</a>
                <a href="#">장바구니</a>
            </nav>
        </div>
    </header>
    
    <main>
        <aside class="sidebar">
            <h2>카테고리</h2>
            <ul>
                <li><a href="#">기타</a></li>
                <li><a href="#">PC 견적</a></li>
                <li><a href="#">부품</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </aside>

        <section class="content">
            <h1>PC 견적</h1>
            <div class="search-bar">
                <input type="text" placeholder="검색어를 입력하세요">
                <button>검색</button>
            </div>

            <div class="filters">
                <h3>CPU</h3>
                <label><input type="checkbox"> 옵션1</label>
                <label><input type="checkbox"> 옵션2</label>
                <label><input type="checkbox"> 옵션3</label>
            </div>

            <div class="product-list">
                <div class="product-item">
                    <h4>상품명 1</h4>
                    <p>상품 설명이 들어갑니다. 가격: ###,###원</p>
                    <button>상세보기</button>
                </div>
                <div class="product-item">
                    <h4>상품명 2</h4>
                    <p>상품 설명이 들어갑니다. 가격: ###,###원</p>
                    <button>상세보기</button>
                </div>
                <div class="product-item">
                    <h4>상품명 3</h4>
                    <p>상품 설명이 들어갑니다. 가격: ###,###원</p>
                    <button>상세보기</button>
                </div>
                <div class="product-item">
                    <h4>상품명 4</h4>
                    <p>상품 설명이 들어갑니다. 가격: ###,###원</p>
                    <button>상세보기</button>
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
            <h2>PC 주요 구성</h2>
            <div class="specs">
                <h4>CPU</h4>
                <h4>메인보드</h4>
                <h4>메모리</h4>
                <h4>그래픽카드</h4>
                <h4>SSD</h4>
                <h4>HDD</h4>
                <h4>CPU 쿨러</h4>
                <h4>케이스</h4>
                <h4>파워</h4>
            </div>
            <button>전체 검색</button>
        </aside>
    </main>

    <footer>
        <p>저작권 © 2024</p>
    </footer>
</body>
</html>
