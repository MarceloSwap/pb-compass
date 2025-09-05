@echo off
echo Executando testes da API Reqres...

REM Executar todos os testes
robot -d reports tests/

REM Executar apenas testes smoke
REM robot -d reports -i smoke tests/

REM Executar apenas testes de usuarios
REM robot -d reports tests/users_tests.robot

REM Executar apenas testes de autenticacao
REM robot -d reports tests/auth_tests.robot

echo Testes concluidos! Verifique os relatorios em reports/