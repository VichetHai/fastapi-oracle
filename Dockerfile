FROM python:3.12
EXPOSE 80
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /code/app
COPY ./alembic /code/alembic
COPY ./alembic.ini /code/alembic.ini

# Start up command that runs alembic migrations and starts the api
CMD ["sh", "-c", "alembic upgrade head && uvicorn app.main:app --proxy-headers --host 0.0.0.0 --port 80"]
