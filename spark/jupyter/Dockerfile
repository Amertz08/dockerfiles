FROM amertz08/pyspark

RUN python3.6 -m pip install --no-cache-dir \
    jupyter \
    scipy \
    scikit-learn \
    pandas \
    matplotlib

ENV PYSPARK_DRIVER_PYTHON=jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS='notebook'

RUN useradd -ms /bin/bash notebook
USER notebook
WORKDIR /home/notebook
RUN mkdir .jupyter code
COPY jupyter_notebook_config.py /home/notebook/.jupyter
WORKDIR /home/notebook/code

EXPOSE 8888

CMD ["pyspark"]