@echo off
echo ========================================
echo Sistema Paraiso Grafica Rapida (Jetty)
echo ========================================
echo.
echo Compilando o projeto...
call mvn clean compile
if %errorlevel% neq 0 (
    echo Erro na compilacao!
    pause
    exit /b 1
)

echo.
echo Iniciando servidor Jetty...
echo Acesse: http://localhost:8080/sistema-materiais
echo Login: admin / admin
echo.
echo Pressione Ctrl+C para parar o servidor
echo.

call mvn jetty:run
