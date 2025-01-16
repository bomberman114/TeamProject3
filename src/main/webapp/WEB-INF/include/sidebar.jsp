<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.sidebar {
    width: 200px;
    border-right: 1px solid #ddd;
    padding: 10px;
    margin-top: 20px;
}
.sidebar li {
    font-size: 15px;
    margin-bottom: 10px;
    border-bottom: 1px solid #ddd;
    position: relative;
    overflow: hidden;
}
.sidebar a {
    text-decoration: none;
    display: block;
    padding: 10px;
}
.sidebar a:hover {
    background-color: #CCC;
}
.dropdown-menu {
    background-color: #fff;
    transition: max-height 0.3s ease;
}
.sidebar li:hover .dropdown-menu,
.sidebar li.active .dropdown-menu {
    max-height: 300px;
}
.dropdown-menu a {
    padding: 10px;
    width: 100%;
    border-top: 1px solid #ddd;
    display: block;
}
.sidebar a.active {
    background-color: #CCC;
    font-weight: bold;
}
.sidebar li > a.head-link.active {
    background-color: #FFF;
    font-weight: bold;
}
</style>

<div class="sidebar">
    <ul>
        <li>
            <a href="/Manager/ManagerCsList" data-path="/Manager/ManagerCsList" class="head-link" style="font-size: 18px; font-weight: bold;">고객센터 관리</a>
            <div class="dropdown-menu">
                <a href="/Manager/ManagerCsList" data-path="/Manager/ManagerCsList">문의내역</a>
                <a href="/Manager/ManagerNoticeList" data-path="/Manager/ManagerNoticeList">공지사항</a>
                <a href="/Manager/ManagerAsklist" data-path="/Manager/ManagerAsklist">자주 묻는 질문</a>
            </div>
        </li>
        <li>
            <a href="#" data-path="" class="head-link" style="font-size: 18px; font-weight: bold;">상품 및 카테고리 관리</a>
            <div class="dropdown-menu">
                <a href="" data-path="">PC</a>
                <a href="" data-path="">노트북</a>
                <a href="" data-path="">주요부품</a>
                <a href="" data-path="">주변기기</a>
                <a href="" data-path="">카테고리 필터</a>
            </div>
        </li>
        <li>
            <a href="/Manager/ManagerAlbumList" data-path="/Manager/ManagerAlbumList" class="head-link" style="font-size: 18px; font-weight: bold;">커뮤니티 관리</a>
            <div class="dropdown-menu">
                <a href="/Manager/ManagerBoardList" data-path="/Manager/ManagerBoardList">자유게시판</a>
                <a href="/Manager/ManagerAlbumList" data-path="/Manager/ManagerAlbumList">조립앨범</a>
                <a href="/Manager/ManagerMarketList" data-path="/Manager/ManagerMarketList">장터</a>
            </div>
        </li>
    </ul>
</div>

<script>
    const sidebarItems = document.querySelectorAll('.sidebar li');
    const sidebarLinks = document.querySelectorAll('.sidebar a');

    sidebarLinks.forEach(link => {
        link.addEventListener('click', (event) => {
            sidebarItems.forEach(item => item.classList.remove('active'));
            sidebarLinks.forEach(l => l.classList.remove('active'));

            const parentLi = link.closest('li');
            if (parentLi) {
                parentLi.classList.add('active');
            }
            link.classList.add('active');
        });
    });

    const currentPath = window.location.pathname;

    sidebarLinks.forEach(link => {
        if (link.dataset.path === currentPath) {
            const parentLi = link.closest('li');
            if (parentLi) {
                parentLi.classList.add('active');
            }
            link.classList.add('active');
        }
    });
</script>
