# Используем базовый образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем все файлы проекта в рабочую директорию
COPY . /app

# Устанавливаем зависимости проекта
RUN pip install --no-cache-dir -r requirements.txt

# Определяем команду для запуска приложения
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
