# See README.md for instructions how to use this.

FROM python:3.9-slim
LABEL maintainer="Marti Raudsepp <marti@juffo.org>"

RUN adduser --system --uid=191 --group --disabled-password --home /app app

USER app
WORKDIR /app

ENV POETRY_VIRTUALENVS_IN_PROJECT=true
ENV PATH=/app/.venv/bin:/usr/local/bin:/usr/bin:/bin

# Install Poetry
RUN --mount=type=cache,id=histonia-pip-cache,target=/app/.cache/pip,uid=191 \
    python -m venv .venv && \
    pip install poetry

# Install dependencies with Poetry
COPY pyproject.toml poetry.lock ./
RUN --mount=type=cache,id=histonia-poetry-cache,target=/app/.cache/pypoetry,uid=191 \
    poetry install --no-dev --no-root

# Configure
COPY mapproxy.yaml ./

CMD mapproxy-util serve-develop mapproxy.yaml --bind 0.0.0.0:8080
EXPOSE 8080
