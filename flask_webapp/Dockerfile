FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
COPY . /app
RUN apk --update add bash nano
ENV STATIC_URL /static
ENV STATIC_PATH /var/www/static
COPY ./requirements.txt /var/www/requirements.txt
VOLUME /database.db
RUN pip install -r /var/www/requirements.txt
