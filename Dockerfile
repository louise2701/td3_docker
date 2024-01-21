# Stage 1: Build the application
FROM python:3.9-slim-buster AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .

# Stage 2: Create a minimal image
FROM python:3.9-slim-buster
WORKDIR /app
COPY --from=builder /app .

CMD ["python", "app.py"]