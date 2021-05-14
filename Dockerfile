FROM python:3.8-alpine

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY sync.sh /sync.sh
COPY requirements.txt /requirements.txt

RUN apk add --update --no-cache libxml2 libxslt vim zlib \
    && rm -rf /var/cache/apk/*

RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt \
    && chmod u+x /docker-entrypoint.sh && chmod +x /sync.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["cron"]
