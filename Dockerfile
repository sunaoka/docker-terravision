# syntax=docker/dockerfile:1
# check=error=true
ARG VERSION=latest

FROM patrickchugh/terravision:${VERSION}

RUN <<EOT sh -ex
    pip install "terravision[mcp]"
EOT
