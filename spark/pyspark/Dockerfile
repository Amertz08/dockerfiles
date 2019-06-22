FROM amertz08/spark

ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3.6

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository \
    ppa:deadsnakes/ppa -y && \
    apt-get update

RUN apt-get install --no-install-recommends -y \
    python3.6-dev \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3.6 /usr/bin/python

RUN wget -q https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN python3.6 -m pip install --no-cache-dir \
    pyspark

CMD ["pyspark"]
