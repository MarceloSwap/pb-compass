*** Settings ***
Documentation    Configurações globais para testes da API Reqres
Library          RequestsLibrary
Library          Collections
Library          String

*** Variables ***
${BASE_URL}         https://reqres.in/api
${VALID_EMAIL}      eve.holt@reqres.in
${VALID_PASSWORD}   cityslicka
${TEST_EMAIL}       user0011@mail.com