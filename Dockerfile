FROM node:20-alpine
# Install Bun
RUN apk add --no-cache curl bash && \
    curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:$PATH"
WORKDIR /app
COPY package.json ./
RUN bun install
COPY . .
EXPOSE 3001
CMD ["bun", "run", "start"]
