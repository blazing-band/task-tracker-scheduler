FROM python 3.14

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-dev

COPY . .

EXPOSE 8080

CMD ["uvicorn", "src.task_tracker_scheduler.app:create_app", "--host", "0.0.0.0", "--port", "8080"]
