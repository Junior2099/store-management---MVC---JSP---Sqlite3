@echo off
echo ========================================
echo Sistema Paraiso Grafica Rapida (DEBUG)
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
echo Iniciando servidor Tomcat com debug...
echo Acesse: http://localhost:8080/sistema-materiais
echo Login: admin / admin
echo.
echo Logs de debug ativados
echo Pressione Ctrl+C para parar o servidor
echo.

call mvn tomcat7:run -X
