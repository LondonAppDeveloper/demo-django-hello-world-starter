FROM python:3.8-slim as builder

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

FROM python:3.8-slim

WORKDIR /app

# Copy dependencies and application code
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY . /app

EXPOSE 8000

CMD ["python", "app/manage.py", "runserver", "0.0.0.0:8000"]
