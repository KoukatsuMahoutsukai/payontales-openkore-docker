# Build stage
FROM alpine:latest as builder

RUN mkdir -p /opt/openkore \
    && apk update \
    && apk add --no-cache build-base perl perl-dev perl-time-hires perl-compress-raw-zlib readline readline-dev python3 curl-dev unzip wget

RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1lZiuMGQS94VZuWYnlVCT3W8l7nq4E-rB' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1lZiuMGQS94VZuWYnlVCT3W8l7nq4E-rB" -O /opt/PayonTales_Openkore.zip && rm -rf /tmp/cookies.txt

RUN unzip /opt/PayonTales_Openkore.zip -d /opt/

RUN rm /opt/PayonTales_Openkore.zip

RUN chmod +x /opt/PayonTales_Openkore/openkore.pl

# Build app
RUN /opt/PayonTales_Openkore/openkore.pl

# New build
FROM alpine:latest

COPY --from=builder /opt/PayonTales_Openkore /opt/PayonTales_Openkore

# Install required runtime https://openkore.com/wiki/How_to_run_OpenKore, you can maybe also add nano or something for easier editing
RUN apk update \
    && apk add --no-cache perl perl-time-hires readline-dev curl-dev

WORKDIR /opt/PayonTales_Openkore

RUN chmod +x /opt/PayonTales_Openkore/openkore.pl

CMD ["/opt/PayonTales_Openkore/openkore.pl"]

