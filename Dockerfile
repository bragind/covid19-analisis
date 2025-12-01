# Dockerfile
FROM python:3.10-slim

# Установка OpenJDK 21 (единственная доступная LTS-версия в Debian Trixie)
RUN apt-get update && \
    apt-get install -y openjdk-21-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Установка JAVA_HOME для OpenJDK 21
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64

# Установка зависимостей Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Рабочая директория
WORKDIR /app

# Копируем проект
COPY . /app

# Порт Jupyter
EXPOSE 8888

# Запуск Jupyter без пароля (только для локальной разработки)
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]