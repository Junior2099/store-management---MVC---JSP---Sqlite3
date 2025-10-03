<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3><c:out value="${categoria != null ? 'Editar categoria' : 'Nova categoria'}"/></h3>
<form method="post" action="${pageContext.request.contextPath}/categorias">
    <c:if test="${categoria != null}">
        <input type="hidden" name="id" value="${categoria.id}" />
    </c:if>
    <div class="mb-3">
        <label class="form-label">Nome</label>
        <input type="text" name="nome" value="${categoria != null ? categoria.nome : ''}" class="form-control" required />
    </div>
    <button class="btn btn-primary" type="submit">Salvar</button>
    <a href="${pageContext.request.contextPath}/categorias" class="btn btn-secondary">Cancelar</a>
</form>


