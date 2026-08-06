from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
import os

# Cria a instância principal da aplicação FastAPI
app = FastAPI()

# Configuração do CORS para permitir que o frontend acesse a API
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permite requisições de qualquer origem
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos os métodos HTTP (GET, POST, etc.)
    allow_headers=["*"],  # Permite todos os cabeçalhos
)


# Define o caminho absoluto para o diretório base e para a pasta de figurinhas
PASTA_BASE = os.path.dirname(os.path.abspath(__file__))
PASTA_IMAGENS = os.path.join(PASTA_BASE, "figurinhas")

# Configura o FastAPI para servir arquivos estáticos da pasta de figurinhas na rota "/imgs"
app.mount("/imgs", StaticFiles(directory=PASTA_IMAGENS), name="imgs")

# Lista de figurinhas com temática Dragon Ball e links para as imagens estáticas
figurinhas = [
    {
        "id": 1,
        "nome": "Goku",
        "categoria": "Saiyajin",
        "imagem_url": "/imgs/Goku.png"
    },
    {
        "id": 2,
        "nome": "Vegeta",
        "categoria": "Saiyajin",
        "imagem_url": "/imgs/Vegeta.png"
    }
]

# Define o único endpoint para retornar a lista de figurinhas
@app.get("/figurinhas")
def listar_figurinhas():
    # Retorna a lista de figurinhas em formato JSON
    return figurinhas

if __name__ == "__main__":
    import uvicorn
    # Inicializa o servidor Uvicorn escutando em 0.0.0.0 para aceitar conexões locais via localhost ou 127.0.0.1
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
