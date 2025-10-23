@echo off
echo ========================================
echo Testando Sistema Paraiso Grafica
echo ========================================
echo.
echo 1. Compilando projeto...
call mvn clean compile
if %errorlevel% neq 0 (
    echo ERRO: Falha na compilacao!
    pause
    exit /b 1
)
echo Compilacao OK!
echo.

echo 2. Verificando banco de dados...
if not exist "database\paraisografica.db" (
    echo ERRO: Banco de dados nao encontrado!
    pause
    exit /b 1
)
echo Banco de dados OK!
echo.

echo 3. Iniciando servidor...
echo.
echo ========================================
echo SISTEMA PRONTO!
echo ========================================
echo.
echo Acesse: http://localhost:8080/sistema-materiais
echo Login: admin
echo Senha: admin
echo.
echo Pressione Ctrl+C para parar
echo.

call mvn tomcat7:run
