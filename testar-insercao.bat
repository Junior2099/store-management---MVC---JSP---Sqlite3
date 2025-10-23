@echo off
echo ========================================
echo Testando Insercao de Materiais
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
echo SISTEMA PRONTO PARA TESTE!
echo ========================================
echo.
echo CORRECOES APLICADAS:
echo - Removido Statement.RETURN_GENERATED_KEYS
echo - Adicionado last_insert_rowid() para SQLite
echo - Melhorado tratamento de erros
echo - Adicionadas validacoes de campos
echo.
echo Acesse: http://localhost:8080/sistema-materiais
echo Login: admin / admin
echo.
echo TESTE: Tente adicionar um novo material
echo Pressione Ctrl+C para parar
echo.

call mvn tomcat7:run
