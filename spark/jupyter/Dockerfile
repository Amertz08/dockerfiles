FROM amertz08/spark

RUN pip install jupyter

ENV PYSPARK_DRIVER_PYTHON=jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS='notebook'

RUN useradd -ms /bin/bash notebook
USER notebook
WORKDIR /home/notebook
RUN mkdir .jupyter
COPY jupyter_notebook_config.py /home/notebook/.jupyter
