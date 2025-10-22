# Faca
A Dockerfile for [beancount-fava](https://github.com/beancount/fava), the  web UI for [beancount](https://github.com/beancount/beancount).
Also contains [fava-portfolio-returns](https://github.com/andreasgerstmayr/fava-portfolio-returns) and [beanprice](https://github.com/beancount/beanprice).

## Usage
You can get started creating a container from this image, you can either use docker-compose or the docker cli.
Assuming you have `example.bean` in the current directory:

### Docker Cli

```bash
docker run -d \
    --name=fava \
    -v $PWD:/bean \
    -e BEANCOUNT_FILE=/bean/example.bean \
    -p 5000:5000 \
    --restart unless-stopped \
    ghcr.io/fdw/fava-docker
```

### Docker Compose

```yml
version: "3.0"
services:
  fava:
    container_name: fava
    image: ghcr.io/fdw/fava-docker
    ports:
      - 5000:5000
    environment:
      - BEANCOUNT_FILE=/bean/example.beancount
    volumes:
      - ${PWD}/:/bean
    restart: unless-stopped
```

## Environment Variables

| Parameter        | Value                                                 |
|------------------|-------------------------------------------------------|
| `BEANCOUNT_FILE` | path to your beancount file. Default to empty string. |

## History
This was originally based on of [yegle/fava-docker](https://github.com/yegle/fava-docker) with updates and only the plugins I need.
