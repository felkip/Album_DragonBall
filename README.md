# 🐉 Dragon Ball Album - Coleção Lendária

O **Dragon Ball Album** é uma aplicação web interativa que simula um álbum de figurinhas físico dedicado aos Guerreiros Z, Vilões Clássicos e à Red Ribbon. O frontend pode ser publicado como site estático; as imagens de Goku e Vegeta são carregadas de `frontend/assets`, sem depender de um backend.

---

## 🎯 Objetivo

Proporcionar uma experiência interativa de colecionar figurinhas digitais. O frontend inclui virada de páginas, efeitos visuais e sonoros, e carrega localmente as imagens disponíveis. O backend FastAPI permanece no repositório como opção para desenvolvimento.

---

## 🛠️ Estrutura do Projeto

```
Album-Alura/
├── backend/
│   ├── figurinhas/
│   │   ├── Goku.png
│   │   └── Vegeta.png
│   ├── main.py
│   └── requirements.txt
├── frontend/
│   ├── assets/
│   │   ├── Goku.png
│   │   └── Vegeta.png
│   ├── index.html
│   ├── style.css
│   └── app.js
├── setup.ps1
└── README.md
```

### Backend (`backend/`)
- **`main.py`**: Aplicação FastAPI responsável por:
  - Servir arquivos estáticos de imagens localizados na pasta `figurinhas/` sob a rota `/imgs`.
  - Fornecer a rota GET `/figurinhas` com os dados JSON das figurinhas da coleção (incluindo **Goku** `#01` e **Vegeta** `#02`).
  - Suportar **CORS** para permitir a comunicação com o frontend.
- **`requirements.txt`**: Lista de dependências Python (`fastapi`, `uvicorn`). Usado pelo `setup.ps1` para instalação automática.
- **`figurinhas/`**: Pasta contendo as imagens das figurinhas (`Goku.png`, `Vegeta.png`).

### Raiz do Projeto
- **`setup.ps1`**: Script PowerShell que automatiza a criação do ambiente virtual, instalação de dependências e inicialização do backend.

### Frontend (`frontend/`)
- **`index.html`**: Estrutura HTML5 do álbum, contendo capa com temática Dragon Ball, esfera de energia animada, e páginas de slots por categoria (Guerreiros Z, Vilões, Red Ribbon).
- **`style.css`**: Design moderno com tema espacial/anime, gradientes radiais, efeitos de luz/aura e animações para colar figurinhas.
- **`app.js`**:
  - Inicialização do efeito de folhear páginas com a biblioteca `St.PageFlip`.
  - Sintetização de efeitos sonoros de papel virando via Web Audio API.
  - Carregamento local das imagens de `assets/` para os slots #01 e #02, compatível com GitHub Pages.

---

## 🚀 Como Executar o Projeto

### Publicar ou testar o frontend estático

O álbum pode ser aberto sem iniciar a API. Para testar, use o Live Server no arquivo `frontend/index.html`. Se o GitHub Pages publicar a raiz do repositório, a página estará em `/frontend/index.html`; para usar o endereço raiz, publique o conteúdo de `frontend/` como artifact do Pages. As imagens locais de Goku e Vegeta são incluídas no frontend.

### Backend opcional

O backend FastAPI continua disponível para desenvolvimento e pode ser iniciado pelo script abaixo. Ele não é necessário para a demonstração estática no GitHub Pages.

#### Método rápido

Na raiz do projeto, execute o script de setup automático no **PowerShell**:

```powershell
.\setup.ps1
```

O script irá automaticamente:
1. ✅ Verificar se o Python está instalado
2. 📦 Criar o ambiente virtual `venv` (ou reutilizar se já existir)
3. ⬇️ Instalar todas as dependências listadas em `backend/requirements.txt`
4. 🚀 Iniciar o servidor FastAPI em **`http://localhost:8000`**

> **Nota:** Na primeira execução no PowerShell, pode ser necessário permitir scripts com:
> ```powershell
> Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
> ```

---

### 🔧 Método Manual (Passo a Passo)

#### 1. Backend (FastAPI)

```powershell
cd backend
python -m venv venv
venv\Scripts\Activate.ps1      # PowerShell
pip install -r requirements.txt
python main.py
```

O backend estará ativo em **`http://localhost:8000`**.

#### 2. Frontend

Em um **novo terminal** (na raiz do projeto):

```powershell
python -m http.server 3000 --directory frontend
```

Acesse: **[http://localhost:3000](http://localhost:3000)**

> Alternativamente, use a extensão **Live Server** do VS Code no arquivo `index.html`.

---

## 🐉 Figurinhas Cadastradas no Backend (`backend/main.py`)

| Slot ID | Nome | Categoria | Imagem |
|---|---|---|---|
| `#01` | **Goku** | Saiyajin | `/imgs/Goku.png` |
| `#02` | **Vegeta** | Saiyajin | `/imgs/Vegeta.png` |
