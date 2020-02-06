  
FROM python:3.7-alpine

RUN pip install truffleHog
RUN apk --update add git jq less openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

ADD entrypoint.sh  /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]