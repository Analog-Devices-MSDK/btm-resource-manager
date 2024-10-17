FROM ubuntu:latest
WORKDIR /app
RUN apt-get update && apt-get install -y python3 python3-pip
COPY * .
# RUN chmod +x install.sh
# RUN ./install.sh 
CMD ["/bin/sh", "-c", "set -e && \
    rm -rf dist && \
    python3 -m venv test-env && \
    ./test-env/bin/pip install --upgrade build && \
    python3 -m build && \
    ./test-env/bin/pip install dist/*.whl --force-reinstall && \
    python3 -c \"import btm_resource_manager\" && \
    set +e && \
    resource_manager --configure \
    "]
