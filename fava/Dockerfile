ARG BEANCOUNT_VERSION=3.2.3
ARG FAVA_VERSION=v1.30.13

FROM debian:trixie AS build_env
ARG BEANCOUNT_VERSION
ARG FAVA_VERSION

RUN apt-get update
RUN apt-get install -y build-essential libxml2-dev libxslt-dev curl \
        python3 libpython3-dev python3-pip git python3-venv bison flex \
        nodejs npm

ENV PATH="/app/bin:$PATH"
RUN python3 -mvenv /app

WORKDIR /tmp/build
RUN git clone https://github.com/beancount/beancount

WORKDIR /tmp/build/beancount
RUN git checkout ${BEANCOUNT_VERSION}

RUN CFLAGS=-s pip3 install -U /tmp/build/beancount

WORKDIR /tmp/build
RUN git clone https://github.com/beancount/fava

WORKDIR /tmp/build/fava
RUN git checkout ${FAVA_VERSION}

RUN pip3 install -U /tmp/build/fava
RUN pip3 install -U fava-portfolio-returns==2.6.0 beanprice==2.1.0

RUN pip3 uninstall -y pip

RUN find /app -name __pycache__ -exec rm -rf -v {} +

FROM gcr.io/distroless/python3-debian13
COPY --from=build_env /app /app

# Default fava port number
EXPOSE 5000

ENV BEANCOUNT_FILE=""

ENV FAVA_HOST="0.0.0.0"
ENV PATH="/app/bin:$PATH"

ENTRYPOINT ["fava"]
