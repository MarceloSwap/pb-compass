# Testes Automatizados - API Reqres

Este projeto contém testes automatizados para a API [Reqres](https://reqres.in/) utilizando Robot Framework.

## Estrutura do Projeto

```
Reqres/
├── data/                   # Dados de teste
│   └── test_data.robot
├── resources/              # Keywords e configurações
│   ├── config.robot
│   ├── api_keywords.robot
│   └── validation_keywords.robot
├── tests/                  # Casos de teste
│   ├── users_tests.robot
│   └── auth_tests.robot
├── reports/                # Relatórios de execução
├── run_tests.bat          # Script para execução
└── README.md
```

## Como Executar

### Executar todos os testes:
```bash
robot -d reports tests/
```

### Executar apenas testes smoke:
```bash
robot -d reports -i smoke tests/
```

### Executar testes específicos:
```bash
robot -d reports tests/users_tests.robot
robot -d reports tests/auth_tests.robot
```

### Usando o script batch (Windows):
```bash
run_tests.bat
```

## Tags Disponíveis

- `smoke`: Testes principais/críticos
- `POST`, `GET`, `PUT`, `DELETE`: Por método HTTP
- `users`, `auth`: Por funcionalidade
- `negative`: Testes de cenários negativos

## Casos de Teste

### Usuários (users_tests.robot)
- CT001: Criar usuário com sucesso
- CT002: Listar usuários
- CT003: Obter usuário por ID
- CT004: Atualizar usuário
- CT005: Deletar usuário
- CT006: Obter usuário inexistente

### Autenticação (auth_tests.robot)
- CT007: Login com sucesso
- CT008: Registrar usuário
- CT009: Logout
- CT010: Login com email inválido
- CT011: Login sem senha