<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paraíso Gráfica Rápida - Dashboard</title>
    <link href="${pageContext.request.contextPath}/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h1>Dashboard - Paraíso Gráfica Rápida</h1>
                <p>Bem-vindo, ${sessionScope.nome}!</p>
                
                <div class="row">
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Total de Materiais</h5>
                                <h2>${totalMateriais}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Categorias</h5>
                                <h2>${totalCategorias}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Quantidade Total</h5>
                                <h2>${totalQuantidade}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Valor Total</h5>
                                <h2><fmt:formatNumber value="${valorTotal}" type="currency" currencySymbol="R$ "/></h2>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row mt-4">
                    <div class="col-md-6">
                        <h3>Materiais</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Categoria</th>
                                    <th>Quantidade</th>
                                    <th>Preço</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="material" items="${materiais}">
                                    <tr>
                                        <td>${material.nome}</td>
                                        <td>${material.categoria}</td>
                                        <td>${material.quantidade}</td>
                                        <td><fmt:formatNumber value="${material.precoUnitario}" type="currency" currencySymbol="R$ "/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <h3>Ações</h3>
                        <a href="materiais" class="btn btn-primary">Gerenciar Materiais</a>
                        <a href="materiais?action=form" class="btn btn-success">Novo Material</a>
                        <a href="logout" class="btn btn-danger">Sair</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
