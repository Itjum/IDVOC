FROM zarak.fr:8092/cache/library/python:3.10-alpine

WORKDIR /worker

ENV FLASK_RUN_PORT 9000
EXPOSE 9000

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

LABEL org.opencontainers.image.authors="samuel.fouchard"
RUN adduser -S samuel.fouchard
USER samuel.fouchard

COPY . .

CMD ["flask", "run", "--host=0.0.0.0"]
