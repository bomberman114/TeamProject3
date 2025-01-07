<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.pagination {
    display: flex;
    justify-content: center;
    padding-top: 20px;
}

.pagination a {
    margin: 0 5px;
    padding: 8px 12px;
    text-decoration: none;
    color: #333;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    transition: background-color 0.3s, color 0.3s;
}

.pagination a:hover {
    background-color: #CCC;
    color: #fff;
}

.pagination a.active {
    background-color: #CCC;
    color: #fff;
    font-weight: bold;
}
</style>
<div class="pagination">
    <c:if test="${totalPages > 0}">

        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 10 > 0 ? currentPage - 10 : 1}&size=${size}">이전</a>
        </c:if>
	
        <c:forEach var="i" begin="1" end="${totalPages}">
            <c:choose>
                <c:when test="${i == currentPage}">
                    <a href="?page=${i}&size=${size}" class="active">${i}</a>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}&size=${size}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 10 > totalPages ? totalPages : currentPage + 10}&size=${size}">다음</a>
        </c:if>
    </c:if>
</div>