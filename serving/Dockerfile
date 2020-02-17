FROM yjbds/mlrun-base:dev

RUN pip install --no-cache-dir -U -q kfserving

#ENTRYPOINT ["tini", "-g", "--", "python"]
ENTRYPOINT ["tini", "-g", "--", "/bin/bash"]
