# Repositório PB – Compass

## 📋 Descrição

Este repositório centraliza todos os arquivos importantes produzidos ao longo das Sprints do programa PB Compass, incluindo planejamentos de testes, automações, documentações e entregas de qualidade.

## 🗂️ Estrutura do Projeto

```
pb-compass/
├── Documentos/
│   ├── AtividadesDiversas/          # Apresentações e documentos gerais
│   ├── MapasMentaisServeRest/       # Mapas mentais dos testes
│   ├── Postman/                    # Collections e documentação Postman
│   ├── Prints/                     # Screenshots dos testes
│   ├── Sprint 05/                  # Automação Robot Framework
│   │   ├── Reqres/                 # Testes API Reqres
│   │   └── ServeRest/              # Testes API ServeRest
│   └── Sprint 06/                  # Continuação dos testes
│       └── ServeRest/
└── README.md
```

## 🚀 Tecnologias Utilizadas

- **Robot Framework** - Automação de testes
- **RequestsLibrary** - Testes de API REST
- **Postman** - Testes manuais e documentação
- **Jira** - Gestão de issues e planejamento
- **Confluence** - Documentação de planos de teste

## 📚 Conteúdo do Repositório

### 🧪 Testes Automatizados
- **API Reqres**: Testes automatizados da API https://reqres.in/
- **API ServeRest**: Testes automatizados da API https://serverest.dev/
- **Collections Postman**: Testes manuais e documentação

### 📊 Documentação
- **Mapas Mentais**: Estratégias de teste visualizadas
- **Planos de Teste**: Documentação completa no Confluence
- **Screenshots**: Evidências dos testes executados
- **Relatórios**: Resultados das execuções

## 🔧 Como Executar os Testes

### Pré-requisitos
```bash
pip install robotframework
pip install robotframework-requests
```

### Executar Testes Reqres
```bash
cd "Documentos/Sprint 05/Reqres"
robot -d reports tests/
```

### Executar Testes ServeRest
```bash
cd "Documentos/Sprint 05/ServeRest"
robot -d reports *.robot
```

## 📖 Links Importantes

- **[Plano de Teste - Confluence](https://marcelofs.atlassian.net/wiki/external/MzQ4OTg3NGE1YzkzNDdhZGJjNTY4M2UxYjMxNzZkMjA)**
- **[Documentação Postman](https://documenter.getpostman.com/view/26925285/2sB3BKFTZy)**
- **[API ServeRest](https://serverest.dev/)**
- **[API Reqres](https://reqres.in/)**

## 📈 Métricas de Qualidade

- ✅ Cobertura de testes de API
- ✅ Automação com Robot Framework
- ✅ Documentação técnica completa
- ✅ Evidências de execução
- ✅ Integração com ferramentas de gestão

## 👥 Contribuição

Este repositório faz parte do programa de estágio PB Compass e contém as entregas e evoluções das atividades de Quality Assurance.

---

**Desenvolvido durante o Programa PB Compass** 🧭