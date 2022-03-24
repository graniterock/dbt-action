ARG DBT_VERSION=latest
FROM xemuliam/dbt:${DBT_VERSION}
RUN apt-get update && apt-get install libsasl2-dev -y

# Need to re-declare the ARG to use its default value defined before the FROM
ARG DBT_VERSION=1.1.0b1
RUN pip install --no-cache-dir --upgrade pip && \
    pip install dbt-databricks && \
    pip install dbt-spark[PyHive]==${DBT_VERSION}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
