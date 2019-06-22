FROM amertz08/spark

ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3.6

RUN apt-get install -y \
    software-properties-common \
    python-software-properties

RUN add-apt-repository \
    ppa:jonathonf/python-3.6 -y && \
    apt-get update

RUN apt-get install -y \
    python3.6

RUN wget -q https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN python3.6 -m pip install \
    pyspark

CMD ["runner", "py", "master"]
