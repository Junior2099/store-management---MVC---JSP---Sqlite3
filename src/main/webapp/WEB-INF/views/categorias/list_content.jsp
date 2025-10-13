<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h3>Categorias</h3>
    <a href="${pageContext.request.contextPath}/categorias/novo" class="btn btn-primary">Nova categoria</a>
    </div>

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th class="text-end">Opções</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${categorias}">
                <tr>
                    <td><c:out value="${c.id}"/></td>
                    <td><c:out value="${c.nome}"/></td>
                    <td class="text-end">
                        <a href="${pageContext.request.contextPath}/categorias/editar/${c.id}" class="btn btn-sm btn-outline-secondary">Editar</a>
                        <a href="${pageContext.request.contextPath}/categorias/remover/${c.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Remover categoria?');">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


