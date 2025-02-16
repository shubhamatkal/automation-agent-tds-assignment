# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /automation-agent-tds-assignment

COPY requirements.txt .
COPY ./packages /app/packages

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt --find-links ./packages

COPY . .

# Expose the FastAPI server port
EXPOSE 8000

# Run the FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]