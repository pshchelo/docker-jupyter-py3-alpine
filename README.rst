Docker files
============

alpine-jupyter-minimal-py3
--------------------------

Basic insecure single user Jupyter Notebook server deployment, Python3-based.
Apart from Python stdlib following Python packages are installed:

- notebook
- ipywidgets
- requests

This makes this image already useful for teaching/showcasing
and some development around Web APIs.

You can plug your own persistent notebooks as volume to ``/notebooks`` mount.
Example start of container::

    docker run -d \
        --name jupyter \
        -p 8888:8888 \
        -v ${PWD}:/notebooks \
        pshchelo/alpine-jupyter-minimal-py3


TODO
----

- better startup/shutdown behavior, handle signals and arguments

  - dedicated startup script?
  - move default settings to jupyter config file?

- ``alpine-jupyter-sci-py3`` - add more of Python scientific stack packages

  - numpy
  - pandas
  - matplotlib
  - scipy
  - sympy
  - networkx
  - ?Cython
  - ?plotly
  - ?quandl
