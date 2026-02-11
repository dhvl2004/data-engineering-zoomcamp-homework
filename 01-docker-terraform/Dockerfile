FROM python:3.13.11-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

WORKDIR /app

# Add uv venv to PATH to remove the need to add "uv", "run" to command
ENV PATH="/app/.venv/bin:$PATH"

# Install dependencies
COPY pyproject.toml .python-version uv.lock ./
RUN uv sync --locked

# Copy content into container
COPY ingest_data.py .


ENTRYPOINT ["python", "ingest_data.py"]