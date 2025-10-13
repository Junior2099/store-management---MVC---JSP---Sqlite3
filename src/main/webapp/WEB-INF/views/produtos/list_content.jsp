<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-between align-items-center mb-3">
    <h3>Produtos</h3>
    <a href="${pageContext.request.contextPath}/produtos/novo" class="btn btn-primary">Novo produto</a>
    </div>

<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Categoria</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th class="text-end">Opções</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${produtos}">
                <tr>
                    <td><c:out value="${p.id}"/></td>
                    <td><c:out value="${p.nome}"/></td>
                    <td>
                        <c:forEach var="c" items="${categorias}">
                            <c:if test="${c.id == p.categoriaId}"><c:out value="${c.nome}"/></c:if>
                        </c:forEach>
                    </td>
                    <td>R$ <c:out value="${p.preco}"/></td>
                    <td><c:out value="${p.quantidade}"/></td>
                    <td class="text-end">
                        <a href="${pageContext.request.contextPath}/movimentos/novo?produtoId=${p.id}" class="btn btn-sm btn-outline-primary">Movimentar</a>
                        <a href="${pageContext.request.contextPath}/produtos/editar/${p.id}" class="btn btn-sm btn-outline-secondary">Editar</a>
                        <a href="${pageContext.request.contextPath}/produtos/remover/${p.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Remover produto?');">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>


