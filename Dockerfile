FROM ubuntu:rolling

RUN apt-get update && \
    apt-get install -y curl wget git graphviz python3 python3-pip python3-graphviz python3-llvmlite
    apt-get clean

RUN pip3 install jupyter jupyter_contrib_nbextensions jupyter_nbextensions_configurator jupyterthemes RISE && \
    /usr/local/bin/jupyter contrib nbextension install --system && \
    /usr/local/bin/jupyter-nbextensions_configurator enable --system

# RISE
RUN jupyter-nbextension install rise --py --system && \
    jupyter-nbextension enable rise --py --system

# Always display run button at each cell. Remove the following two lines if unnecessary.
RUN sed -i -e '/div\.run_this_cell/{n;s/none/block/}' /usr/local/lib/python3.9/dist-packages/notebook/static/style/style.min.css && \
sed -i -e '/div\.run_this_cell/{n;s/none/block/}' /usr/local/lib/python3.9/dist-packages/notebook/static/style/ipython.min.css

ENV XDG_RUNTIME_DIR=""

WORKDIR /root

CMD ["/usr/local/bin/jupyter-notebook", "--notebook-dir=.", "--ip='*'", "--no-browser", "--allow-root"]


