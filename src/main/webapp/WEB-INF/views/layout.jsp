<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><c:out value="${title}" default="Paraíso Gráfica Rápida"/></title>
    <link rel="icon" type="image/png" href="https://img.icons8.com/?size=100&id=M9xNyIu2wL3e&format=png&color=000000" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <style>
        .brand { font-weight: 800; color: #e60014; letter-spacing: .3px; }
        .nav-link.active { font-weight: 600; }
        footer { font-size: .9rem; color: #666; }
        .card { border: none; box-shadow: 0 8px 24px rgba(0,0,0,.06); }
        .badge { letter-spacing: .2px; }
        
        /* Dashboard específico */
        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem 0;
            margin: -1.5rem -15px 2rem -15px;
        }
        
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(0,0,0,0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 1rem;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            color: #6c757d;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 0.5px;
        }
        
        .recent-activity {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .activity-item {
            padding: 1rem 0;
            border-bottom: 1px solid #f8f9fa;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            margin-right: 1rem;
        }
        
        .welcome-section {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .welcome-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .welcome-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
        }
    </style>
    <c:if test="${not empty extraCss}">${extraCss}</c:if>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom mb-4">
    <div class="container">
        <a class="navbar-brand brand" href="${pageContext.request.contextPath}/">Paraíso Gráfica Rápida</a>
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
            <form class="d-flex" action="${pageContext.request.contextPath}/logout" method="post">
                <span class="navbar-text me-3">Olá, <strong><c:out value="${sessionScope.user}"/></strong></span>
                <button class="btn btn-outline-danger btn-sm" type="submit">Sair</button>
            </form>
        </div>
    </div>
    </nav>

    <main class="container">
        <c:import url="${content}" />
    </main>

    <footer class="container mt-5 mb-4">
        <hr />
        <p>Paraíso Gráfica Rápida</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <c:if test="${not empty extraJs}">${extraJs}</c:if>
</body>
</html>


