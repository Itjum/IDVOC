FROM zarak.fr:8092/cache/library/python:3

WORKDIR /web

ENV FLASK_RUN_PORT 5000

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["flask", "run", "--host=0.0.0.0"]
