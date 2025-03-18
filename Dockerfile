FROM public.ecr.aws/lambda/python:3.12


ENV PYTHONUNBUFFERED=1 \
    # prevents python creating .pyc files
    PYTHONDONTWRITEBYTECODE=1 \
    \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    # poetry
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    POETRY_VERSION=2.0.0 \
    # make poetry install to this location
    POETRY_HOME="/opt/poetry" \
    # do not ask any interactive question
    POETRY_NO_INTERACTION=1 \
    \
    # paths
    # this is where our requirements + virtual environment will live
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

RUN curl -sSL https://install.python-poetry.org | python3 -

COPY ./src/app ${LAMBDA_TASK_ROOT}

COPY ./pyproject.toml ${LAMBDA_TASK_ROOT}
COPY ./README.md ${LAMBDA_TASK_ROOT}

WORKDIR ${LAMBDA_TASK_ROOT}

RUN poetry config virtualenvs.create false
RUN poetry install --without test --no-root

CMD [ "main.handler" ]