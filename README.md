# 🐉 Dragon Ball Album - Coleção Lendária

O **Dragon Ball Album** é uma aplicação web interativa desenvolvida para colecionadores e fãs do universo Dragon Ball. O projeto simula um álbum de figurinhas físico (estilo "copa do mundo") dedicado aos Guerreiros Z, Vilões Clássicos e a Red Ribbon.

---

## 🎯 Objetivo

Proporcionar uma experiência imersiva de colecionar figurinhas digitais de Dragon Ball. O projeto une um visual sci-fi/anime moderno com animações imersivas de simulação física (como a virada de página e geração de sons realistas de papel) e integração dinâmica com um servidor backend em **FastAPI** para carregar as figurinhas (ex: Goku e Vegeta).

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
  - Consumo assíncrono da API (`http://localhost:8000/figurinhas`) para posicionar e renderizar as imagens nos slots.

---

## 🚀 Como Executar o Projeto

### ⚡ Método Rápido (Recomendado)

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
