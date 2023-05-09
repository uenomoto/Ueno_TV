FROM mysql:8.0

# データフォルダーの中身をコンテナにコピーする。
COPY ./data /docker-entrypoint-initdb.d/
