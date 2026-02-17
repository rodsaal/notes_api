# README

# Sistema de Anotações

Aplicação fullstack composta por:

- Backend: Ruby on Rails (API)
- Frontend: Vue 3 (Vite)
- Banco de dados: PostgreSQL
- Testes: RSpec

O sistema permite:

- Criar anotações (título obrigatório)
- Listar anotações
- Exibir erros de validação
- Persistência em banco de dados

---

## 📦 Estrutura do Projeto

.

├── notes_api/ # Backend Rails API

└── notes_front/ # Frontend Vue 3 (Vite)


---

## 🚀 Como rodar a aplicação

### 🔧 Pré-requisitos

- Ruby 3.x
- Rails 7+
- Node 18+
- PostgreSQL
- Bundler

---

## 🖥️ Backend (Rails API)

### 1️⃣ Instalar dependências

```
cd notes_api
bundle install
```
### 2️⃣ Configurar banco de dados

Certifique-se de que o PostgreSQL está rodando.

```
rails db:create
rails db:migrate
```

### 3️⃣ Executar servidor
```
rails s
```

Backend disponível em:

http://localhost:3000

## 📡 Endpoints da API
### 🔎 Listar anotações
GET /api/v1/notes

Exemplo:

http://localhost:3000/api/v1/notes

### ➕ Criar anotação
POST /api/v1/notes
Content-Type: application/json

Exemplo de body:
```
{
  "note": {
    "title": "Reunião",
    "content": "Definir próximos passos"
  }
}
```

Respostas possíveis:

- 200 OK
- 201 Created
- 422 Unprocessable Entity (erro de validação)

## 🎨 Frontend (Vue 3)
clonar o repositório "notes_front":
- HTTPS: https://github.com/rodsaal/notes_front.git
- SSH: git@github.com:rodsaal/notes_front.git

### 1️⃣ Instalar dependências
```
cd notes_front
npm install
```
### 2️⃣ Criar arquivo .env

Dentro de notes_front:
```
VITE_API_BASE=http://localhost:3000/api/v1
```

### 3️⃣ Executar aplicação
```
npm run dev
```


Frontend disponível em:

http://localhost:5173

## 🧪 Testes Automatizados

Os testes foram implementados utilizando RSpec.

Cobertura implementada:

Validação do model Note
- Teste de listagem ordenada por data
- Teste de criação válida
- Teste de erro de validação (422)

Para executar:
```
cd notes_api
bundle exec rspec
```

## 🗄️ Banco de Dados

Banco utilizado: PostgreSQL
Ambiente padrão: development

Para acessar o console:
```
rails console
```

Exemplo:
```
Note.count
Note.last
```


## 🛠️ Decisões Técnicas

- Rails em modo API
- Frontend separado do backend
- Validações centralizadas no model
- Respostas seguindo padrão REST
- Configuração de CORS via rack-cors
- Testes de request para validar fluxo completo

## 👨‍💻 Autor

Rodrigo Almeida