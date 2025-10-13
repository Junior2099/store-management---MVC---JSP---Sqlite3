<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Header do Dashboard -->
<div class="dashboard-header">
    <div class="container">
        <div class="welcome-section">
            <h1 class="welcome-title">Bem-vindo ao Sistema de Estoque</h1>
            <p class="welcome-subtitle">Gerencie seu inventário de forma eficiente</p>
        </div>
    </div>
</div>

<!-- Cards de Estatísticas -->
<div class="row g-4 mb-5">
    <div class="col-lg-4 col-md-6">
        <div class="stat-card">
            <div class="d-flex align-items-center">
                <div class="stat-icon bg-primary bg-opacity-10 text-primary">
                    <img src="https://img.icons8.com/fluency/48/tags.png" alt="Categorias" style="width: 24px; height: 24px;">
                </div>
                <div class="flex-grow-1">
                    <div class="stat-number text-primary"><c:out value="${fn:length(categorias)}"/></div>
                    <div class="stat-label">Categorias</div>
                </div>
            </div>
            <div class="mt-3">
                <a href="${pageContext.request.contextPath}/categorias" class="btn btn-primary btn-sm">
                    <img src="https://img.icons8.com/?size=100&id=U5n0qpPE377X&format=png&color=000000" alt="Ver" class="me-1" style="width: 16px; height: 16px;">Ver Categorias
                </a>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
        <div class="stat-card">
            <div class="d-flex align-items-center">
                <div class="stat-icon bg-success bg-opacity-10 text-success">
                    <img src="https://img.icons8.com/fluency/48/package.png" alt="Produtos" style="width: 24px; height: 24px;">
                </div>
                <div class="flex-grow-1">
                    <div class="stat-number text-success"><c:out value="${fn:length(produtos)}"/></div>
                    <div class="stat-label">Produtos</div>
                </div>
            </div>
            <div class="mt-3">
                <a href="${pageContext.request.contextPath}/produtos" class="btn btn-success btn-sm">
                    <img src="https://img.icons8.com/?size=100&id=13758&format=png&color=000000" alt="Ver" class="me-1" style="width: 16px; height: 16px;">Ver Produtos
                </a>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
        <div class="stat-card">
            <div class="d-flex align-items-center">
                <div class="stat-icon bg-info bg-opacity-10 text-info">
                    <img src="https://img.icons8.com/?size=100&id=jQhdjj6cuiwg&format=png&color=000000" alt="Movimentos" style="width: 24px; height: 24px;">
                </div>
                <div class="flex-grow-1">
                    <div class="stat-number text-info"><c:out value="${fn:length(movimentos)}"/></div>
                    <div class="stat-label">Movimentos</div>
                </div>
            </div>
            <div class="mt-3">
                <a href="${pageContext.request.contextPath}/movimentos" class="btn btn-info btn-sm">
                    <img src="https://img.icons8.com/?size=100&id=agdYOQXuYm4o&format=png&color=000000" alt="Ver" class="me-1" style="width: 16px; height: 16px;">Ver Movimentos
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Ações Rápidas -->
<div class="row g-4 mb-5">
    <div class="col-12">
        <div class="recent-activity">
            <div class="d-flex align-items-center mb-4">
                <div class="activity-icon bg-primary bg-opacity-10 text-primary">
                    <img src="https://img.icons8.com/fluency/20/lightning-bolt.png" alt="Ações" style="width: 20px; height: 20px;">
                </div>
                <div>
                    <h4 class="mb-1">Ações Rápidas</h4>
                    <p class="text-muted mb-0">Acesso rápido às principais funcionalidades</p>
                </div>
            </div>
            
            <div class="row g-3">
                <div class="col-md-3 col-sm-6">
                    <a href="${pageContext.request.contextPath}/produtos?action=form" class="btn btn-outline-primary w-100 d-flex align-items-center justify-content-center py-3">
                        <img src="https://img.icons8.com/fluency/20/plus.png" alt="Adicionar" class="me-2">
                        <span>Novo Produto</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="${pageContext.request.contextPath}/categorias?action=form" class="btn btn-outline-success w-100 d-flex align-items-center justify-content-center py-3">
                        <img src="https://img.icons8.com/fluency/20/plus.png" alt="Adicionar" class="me-2">
                        <span>Nova Categoria</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="${pageContext.request.contextPath}/movimentos?action=form" class="btn btn-outline-info w-100 d-flex align-items-center justify-content-center py-3">
                        <img src="https://img.icons8.com/fluency/20/plus.png" alt="Adicionar" class="me-2">
                        <span>Novo Movimento</span>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline-warning w-100 d-flex align-items-center justify-content-center py-3">
                        <img src="https://img.icons8.com/fluency/20/refresh.png" alt="Atualizar" class="me-2">
                        <span>Atualizar Dashboard</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Seção de Atividade Recente -->
<div class="row">
    <div class="col-12">
        <div class="recent-activity">
            <div class="d-flex align-items-center mb-4">
                <div class="activity-icon bg-warning bg-opacity-10 text-warning">
                    <img src="https://img.icons8.com/fluency/48/clock.png" alt="Atividade" style="width: 20px; height: 20px;">
                </div>
                <div>
                    <h4 class="mb-1">Atividade Recente</h4>
                    <p class="text-muted mb-0">Últimos movimentos de estoque</p>
                </div>
            </div>
            
            <c:choose>
                <c:when test="${not empty movimentos}">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th><img src="https://img.icons8.com/?size=100&id=UMPitFomK612&format=png&color=000000" alt="ID" class="me-1" style="width: 20px; height: 20px;">ID</th>
                                    <th><img src="https://img.icons8.com/fluency/20/package.png" alt="Produto" class="me-1">Produto</th>
                                    <th><img src="https://img.icons8.com/?size=100&id=24271&format=png&color=000000" alt="Tipo" class="me-1" style="width: 20px; height: 20px;">Tipo</th>
                                    <th><img src="https://img.icons8.com/?size=100&id=5ZTS42yO8Qir&format=png&color=000000" alt="Quantidade" class="me-1" style="width: 20px; height: 20px;">Quantidade</th>
                                    <th><img src="https://img.icons8.com/fluency/20/calendar.png" alt="Data" class="me-1">Data/Hora</th>
                                    <th><img src="https://img.icons8.com/fluency/20/comments.png" alt="Observação" class="me-1">Observação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${movimentos}" begin="0" end="9">
                                    <tr>
                                        <td><span class="badge bg-secondary">#<c:out value="${m.id}"/></span></td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="https://img.icons8.com/fluency/16/package.png" alt="Produto" class="text-muted me-2">
                                                <c:forEach var="p" items="${produtos}">
                                                    <c:if test="${p.id == m.produtoId}">
                                                        <strong><c:out value="${p.nome}"/></strong>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${m.tipo == 'ENTRADA'}">
                                                    <span class="badge bg-success-subtle text-success">
                                                        <img src="https://img.icons8.com/?size=100&id=9fp9k4lPT8us&format=png&color=000000" alt="Entrada" class="me-1" style="width: 16px; height: 16px;"><c:out value="${m.tipo}"/>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-danger-subtle text-danger">
                                                        <img src="https://img.icons8.com/fluency/16/arrow-up.png" alt="Saída" class="me-1"><c:out value="${m.tipo}"/>
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <span class="fw-bold"><c:out value="${m.quantidade}"/></span>
                                        </td>
                                        <td>
                                            <small class="text-muted"><c:out value="${m.dataHora}"/></small>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty m.observacao}">
                                                    <small class="text-muted"><c:out value="${m.observacao}"/></small>
                                                </c:when>
                                                <c:otherwise>
                                                    <small class="text-muted">-</small>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="text-center mt-3">
                        <a href="${pageContext.request.contextPath}/movimentos" class="btn btn-outline-primary">
                            <img src="https://img.icons8.com/?size=100&id=EnLdUKY9PVzN&format=png&color=000000" alt="Ver" class="me-1" style="width: 16px; height: 16px;">Ver Todos os Movimentos
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="text-center py-5">
                        <div class="mb-3">
                            <img src="https://img.icons8.com/fluency/96/inbox.png" alt="Vazio" class="text-muted">
                        </div>
                        <h5 class="text-muted">Nenhum movimento encontrado</h5>
                        <p class="text-muted">Comece registrando movimentos de estoque</p>
                        <a href="${pageContext.request.contextPath}/movimentos" class="btn btn-primary">
                            <img src="https://img.icons8.com/fluency/16/plus.png" alt="Adicionar" class="me-1">Adicionar Movimento
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>


