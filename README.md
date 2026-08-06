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
│   └── venv/
├── frontend/
│   ├── index.html
│   ├── style.css
│   ├── app.js
│   └── README.md
└── README.md
```

### Backend (`backend/`)
- **`main.py`**: Aplicação FastAPI responsável por:
  - Servir arquivos estáticos de imagens localizados na pasta `figurinhas/` sob a rota `/imgs`.
  - Fornecer a rota GET `/figurinhas` com os dados JSON das figurinhas da coleção (incluindo **Goku** `#01` e **Vegeta** `#02`).
  - Suportar **CORS** para permitir a comunicação com o frontend.
- **`figurinhas/`**: Pasta contendo as imagens das figurinhas (`Goku.png`, `Vegeta.png`).

### Frontend (`frontend/`)
- **`index.html`**: Estrutura HTML5 do álbum, contendo capa com temática Dragon Ball, esfera de energia animada, e páginas de slots por categoria (Guerreiros Z, Vilões, Red Ribbon).
- **`style.css`**: Design moderno com tema espacial/anime, gradientes radiais, efeitos de luz/aura e animações para colar figurinhas.
- **`app.js`**:
  - Inicialização do efeito de folhear páginas com a biblioteca `St.PageFlip`.
  - Sintetização de efeitos sonoros de papel virando via Web Audio API.
  - Consumo assíncrono da API (`http://localhost:8000/figurinhas`) para posicionar e renderizar as imagens nos slots.

---

## 🚀 Como Executar o Projeto

### 1. Executar o Backend (FastAPI)

1. No terminal, acesse a pasta `backend`:
   ```powershell
   cd backend
   ```

2. (Opcional) Ative o ambiente virtual `venv`:
   * **PowerShell:** `venv\Scripts\Activate.ps1`
   * **CMD:** `venv\Scripts\activate.bat`

3. Instale as dependências (caso necessário):
   ```bash
   pip install fastapi uvicorn
   ```

4. Inicie o servidor Backend:
   ```bash
   python main.py
   ```
   Ou com Uvicorn:
   ```bash
   python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload
   ```

   O backend estará ativo em **`http://localhost:8000`**.

---

### 2. Executar o Frontend

1. Em um novo terminal, execute um servidor estático para a pasta `frontend`:
   ```powershell
   python -m http.server 3000 --directory frontend
   ```
2. Acesse no seu navegador: **[http://localhost:3000](http://localhost:3000)** (ou utilize a extensão Live Server no arquivo `index.html`).

---

## 🐉 Figurinhas Cadastradas no Backend (`backend/main.py`)

| Slot ID | Nome | Categoria | Imagem |
|---|---|---|---|
| `#01` | **Goku** | Saiyajin | `/imgs/Goku.png` |
| `#02` | **Vegeta** | Saiyajin | `/imgs/Vegeta.png` |
