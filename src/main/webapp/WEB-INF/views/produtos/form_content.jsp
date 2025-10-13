<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3><c:out value="${produto != null ? 'Editar produto' : 'Novo produto'}"/></h3>
<form method="post" action="${pageContext.request.contextPath}/produtos">
    <c:if test="${produto != null}">
        <input type="hidden" name="id" value="${produto.id}" />
    </c:if>
    <div class="mb-3">
        <label class="form-label">Nome</label>
        <input type="text" name="nome" value="${produto != null ? produto.nome : ''}" class="form-control" required />
    </div>
    <div class="mb-3">
        <label class="form-label">Categoria</label>
        <select name="categoriaId" class="form-select" required>
            <c:choose>
                <c:when test="${produto == null}">
                    <option value="" disabled selected>Selecione</option>
                </c:when>
                <c:otherwise>
                    <option value="" disabled>Selecione</option>
                </c:otherwise>
            </c:choose>
            <c:forEach var="c" items="${categorias}">
                <c:choose>
                    <c:when test="${produto != null and produto.categoriaId == c.id}">
                        <option value="${c.id}" selected><c:out value="${c.nome}"/></option>
                    </c:when>
                    <c:otherwise>
                        <option value="${c.id}"><c:out value="${c.nome}"/></option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Preço</label>
        <input type="number" name="preco" step="0.01" value="${produto != null ? produto.preco : ''}" class="form-control" required />
    </div>
    <div class="mb-3">
        <label class="form-label">Quantidade</label>
        <input type="number" name="quantidade" min="0" value="${produto != null ? produto.quantidade : 0}" class="form-control" required />
    </div>
    <button class="btn btn-primary" type="submit">Salvar</button>
    <a href="${pageContext.request.contextPath}/produtos" class="btn btn-secondary">Cancelar</a>
    </form>


