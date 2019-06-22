FROM amertz08/spark

ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3.6

RUN apt-get install -y \
    software-properties-common

RUN add-apt-repository \
    ppa:deadsnakes/ppa -y && \
    apt-get update

RUN apt-get install -y \
    python3.6-dev

RUN wget -q https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN python3.6 -m pip install \
    pyspark

CMD ["pyspark"]
