FROM amertz08/spark

RUN pip install --upgrade \
    pip \
    jupyter \
    scipy \
    scikit-learn \
    pandas \
    matplotlib==2.*

ENV PYSPARK_DRIVER_PYTHON=jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS='notebook'

RUN useradd -ms /bin/bash notebook
USER notebook
WORKDIR /home/notebook
RUN mkdir .jupyter code
COPY jupyter_notebook_config.py /home/notebook/.jupyter
WORKDIR /home/notebook/code
