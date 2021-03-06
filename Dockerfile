ARG DBT_VERSION=1.0.1
FROM xemuliam/dbt:${DBT_VERSION}
RUN apt-get update && apt-get install --reinstall build-essential -y && apt-get install python-dev libsasl2-dev gcc -y

# Need to re-declare the ARG to use its default value defined before the FROM
ARG DBT_VERSION=1.1.0b1
RUN pip install --no-cache-dir --upgrade pip && \
    pip install dbt-databricks && \
    pip install dbt-spark[PyHive]==${DBT_VERSION}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
