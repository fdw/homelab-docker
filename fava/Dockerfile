FROM debian:trixie AS build_env

RUN apt-get update && apt-get install -y python3-pip

RUN pip3 install --target=/app/packages \
        fava==1.30.13 \
        beancount==3.2.3 \
        fava-portfolio-returns==2.6.0 \
        beanprice==2.1.0

FROM gcr.io/distroless/python3-debian13
COPY --from=build_env /app/packages /app/packages

EXPOSE 5000

ENV BEANCOUNT_FILE=""
ENV FAVA_HOST="0.0.0.0"
ENV PYTHONPATH="/app/packages"
ENV PATH="/app/packages/bin:$PATH"

ENTRYPOINT ["fava"]
