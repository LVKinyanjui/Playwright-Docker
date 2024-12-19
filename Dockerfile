FROM node:20-bookworm

WORKDIR /app

RUN npx -y playwright@1.49.1 install --with-deps

RUN apt update \
    && apt install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install -r requirements.txt --break-system-packages \
	--no-cache-dir \
    && playwright install
