ARG DBT_VERSION=1.0.1
FROM xemuliam/dbt:${DBT_VERSION}
RUN apt-get update && apt-get install libsasl2-dev -y && rm -rf /var/lib/apt/lists/*

# Need to re-declare the ARG to use its default value defined before the FROM
ARG DBT_VERSION=1.0.0rc1
RUN pip install --no-cache-dir --upgrade pip && \
    pip install dbt-databricks && \
    pip install dbt-spark[PyHive]==${DBT_VERSION}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
