<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><c:out value="${title}" default="Estoque MagazineLuiza"/></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <style>
        .brand { font-weight: 700; color: #e60014; }
        .nav-link.active { font-weight: 600; }
        footer { font-size: .9rem; color: #666; }
    </style>
    <c:if test="${not empty extraCss}">${extraCss}</c:if>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
    <div class="container">
        <a class="navbar-brand brand" href="${pageContext.request.contextPath}/">Magazine Luiza - SP Estoque</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav" aria-controls="nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${activePage eq 'dashboard'}">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${activePage eq 'produtos'}">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/produtos">Produtos</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="${pageContext.request.contextPath}/produtos">Produtos</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${activePage eq 'categorias'}">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/categorias">Categorias</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="${pageContext.request.contextPath}/categorias">Categorias</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${activePage eq 'movimentos'}">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/movimentos">Movimentos</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="${pageContext.request.contextPath}/movimentos">Movimentos</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
    </nav>

    <main class="container">
        <c:import url="${content}" />
    </main>

    <footer class="container mt-5 mb-4">
        <hr />
        <p>Magazine Luiza - SP Estoque</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <c:if test="${not empty extraJs}">${extraJs}</c:if>
</body>
</html>


