# Testes Automatizados ServeRest - Sprint 06

## 📋 Descrição

Testes automatizados para a API ServeRest utilizando Robot Framework, cobrindo endpoints de usuários, login, produtos e carrinho.

## ⚙️ Configuração Inicial

### 1. Ajustar IP da Máquina EC2

Antes de executar os testes, **OBRIGATORIAMENTE** ajuste o arquivo de variáveis:

```
Documentos\Sprint_06\Semana 02\ServeRest\suport\variaveis\serveres_variaveis.robot
```

Altere a variável `${BASE_URI}` com o IP da sua instância EC2:

```robot
*** Variables ***
${BASE_URI}    http://SEU_IP_EC2:3000
```

### 2. Pré-requisitos

```bash
pip install robotframework
pip install robotframework-requests
pip install robotframework-faker
```

## 🚀 Executar Testes

### Executar todos os testes
```bash
cd "Documentos\Sprint_06\Semana 02\ServeRest"
robot -d reports tests/
```

### Executar teste específico
```bash
robot -d reports tests/login_tests.robot
```

### Executar por tag
```bash
robot -d reports -i POSTLOGIN tests/
```

## 📁 Estrutura dos Testes

- `tests/` - Casos de teste
- `keywords/` - Keywords customizadas por endpoint
- `suport/` - Arquivos de apoio e configurações
- `reports/` - Relatórios de execução

## 🔧 Endpoints Testados

- **Login** - Autenticação de usuários
- **Usuários** - CRUD de usuários
- **Produtos** - CRUD de produtos
- **Carrinho** - Operações de carrinho de compras