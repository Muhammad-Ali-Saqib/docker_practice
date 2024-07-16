# Use a lightweight Python 3.10 image
FROM python:3.10-slim

# Create a working directory within the container
WORKDIR /app

# Copy the Poetry project directory
COPY pyproject.toml poetry.lock ./

RUN pip install poetry

# Install dependencies using Poetry
RUN poetry install --no-interaction

# Copy the application code
COPY . .

# Expose the port for FastAPI
EXPOSE 8000

# Run the application using uvicorn
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
