FROM python:3.11-slim-buster

# Set working directory
WORKDIR /app

# Install dependencies with Poetry
RUN pip install --upgrade pip==20.0.* poetry==1.0.* && poetry config virtualenvs.create false

# Copy the source code
COPY pyproject.toml poetry.* /src/ ./

RUN poetry install

# Expose port 8000
EXPOSE 8000
