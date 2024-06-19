# Dockerfile para a aplicação back-end Node.js

# Use a imagem oficial do Node.js como base
FROM mhart/alpine-node:12

# Instalação do Git
RUN apk add --no-cache git

# Diretório de trabalho dentro do contêiner

# Atualização do npm
RUN npm install

WORKDIR /app

# Copie os arquivos de configuração e dependências
COPY package*.json ./
COPY ./src ./src

# Instale as dependências do projeto
RUN npm install

# Execute os comandos necessários (migrate, seed)
RUN npm run db:migrate
RUN npm run db:seed

# Expõe a porta 3000 para acesso externo (ajuste conforme necessário)
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]
