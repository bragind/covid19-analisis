# Аналитическая система для эпидемиологического мониторинга COVID-19 (Docker-версия)

## Требования
- Docker и Docker Compose установлены
- Файл `metadata.csv` из [COVID-19 Chest X-Ray Dataset](https://github.com/ieee8023/covid-chestxray-dataset)

## Подготовка данных
1. Создайте папку `data` в корне проекта.
2. Поместите `metadata.csv` в `./data/`.

## Запуск через Docker Compose (рекомендуется)

```bash
docker-compose up --build

