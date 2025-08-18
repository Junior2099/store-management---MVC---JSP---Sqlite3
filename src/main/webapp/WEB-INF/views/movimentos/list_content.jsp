<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h3>Movimentos</h3>
    <a href="${pageContext.request.contextPath}/movimentos/novo" class="btn btn-primary">Novo movimento</a>
    </div>

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


