<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row g-3">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Categorias</h5>
                <p class="display-6"><c:out value="${fn:length(categorias)}"/></p>
                <a href="${pageContext.request.contextPath}/categorias" class="btn btn-primary">Ver categorias</a>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Produtos</h5>
                <p class="display-6"><c:out value="${fn:length(produtos)}"/></p>
                <a href="${pageContext.request.contextPath}/produtos" class="btn btn-primary">Ver produtos</a>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Movimentos</h5>
                <p class="display-6"><c:out value="${fn:length(movimentos)}"/></p>
                <a href="${pageContext.request.contextPath}/movimentos" class="btn btn-primary">Ver movimentos</a>
            </div>
        </div>
    </div>
</div>

<div class="mt-4">
    <h4>Últimos movimentos</h4>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Produto</th>
                    <th>Tipo</th>
                    <th>Quantidade</th>
                    <th>Data/Hora</th>
                    <th>Observação</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="m" items="${movimentos}">
                    <tr>
                        <td><c:out value="${m.id}"/></td>
                        <td>
                            <c:forEach var="p" items="${produtos}">
                                <c:if test="${p.id == m.produtoId}"><c:out value="${p.nome}"/></c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${m.tipo == 'ENTRADA'}">
                                    <span class="badge bg-success"><c:out value="${m.tipo}"/></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger"><c:out value="${m.tipo}"/></span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${m.quantidade}"/></td>
                        <td><c:out value="${m.dataHora}"/></td>
                        <td><c:out value="${m.observacao}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


