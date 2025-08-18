<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Novo movimento</h3>
<form method="post" action="${pageContext.request.contextPath}/movimentos">
    <div class="mb-3">
        <label class="form-label">Produto</label>
        <select name="produtoId" class="form-select" required>
            <c:choose>
                <c:when test="${empty param.produtoId}">
                    <option value="" disabled selected>Selecione</option>
                </c:when>
                <c:otherwise>
                    <option value="" disabled>Selecione</option>
                </c:otherwise>
            </c:choose>
            <c:forEach var="p" items="${produtos}">
                <c:choose>
                    <c:when test="${not empty param.produtoId and param.produtoId == p.id}">
                        <option value="${p.id}" selected><c:out value="${p.nome}"/></option>
                    </c:when>
                    <c:otherwise>
                        <option value="${p.id}"><c:out value="${p.nome}"/></option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Tipo</label>
        <select name="tipo" class="form-select" required>
            <option value="ENTRADA">Entrada</option>
            <option value="SAIDA">Saída</option>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Quantidade</label>
        <input type="number" name="quantidade" min="1" value="1" class="form-control" required />
    </div>
    <div class="mb-3">
        <label class="form-label">Observação</label>
        <input type="text" name="observacao" class="form-control" />
    </div>
    <button class="btn btn-primary" type="submit">Salvar</button>
    <a href="${pageContext.request.contextPath}/movimentos" class="btn btn-secondary">Cancelar</a>
</form>


