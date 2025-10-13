<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login - Paraíso Gráfica Rápida</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <style>
        body { min-height: 100vh; display: flex; align-items: center; background: linear-gradient(135deg, #f8f9fa, #eef2f7); }
        .login-card { max-width: 420px; margin: 0 auto; box-shadow: 0 10px 30px rgba(0,0,0,.08); border: none; }
        .brand { font-weight: 800; color: #e60014; letter-spacing: .3px; }
    </style>
    <script>
        if (self !== top) { top.location = self.location; }
    </script>
</head>
<body>
<div class="container py-5">
    <div class="text-center mb-4">
        <h1 class="brand">Paraíso Gráfica Rápida</h1>
        <p class="text-muted mb-0">Acesse para continuar</p>
    </div>
    <div class="card login-card">
        <div class="card-body p-4">
            <form method="post" action="${pageContext.request.contextPath}/login" novalidate>
                <div class="mb-3">
                    <label for="username" class="form-label">Usuário</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="admin" required />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Senha</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="admin" required />
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-danger">Entrar</button>
                </div>
                <div class="form-text mt-2">Dica: admin / admin</div>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3" role="alert">${error}</div>
                </c:if>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


