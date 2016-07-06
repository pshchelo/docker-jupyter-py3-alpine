Docker files
============

alpine-jupyter-minimal-py3
--------------------------

Very minimal, ephemeral and insecure Jupyter Notebook server deployment,
Python3-based.
Only Python stdlib and ``notebook`` package with dependencies are installed.

TODO
----

- better startup behavior, handle signals
- add more general purpose or Jupyter-specific Python packages

  - ?requests
  - ?ipywidgets
  - ?local MathJax

- ``alpine-jupyter-py3-sci`` - add more of Python scientific stack packages

  - numpy
  - pandas
  - matplotlib
  - scipy
  - sympy
  - networkx
  - ?Cython
  - ?plotly
  - ?quandl

- add versions with both Python2 and Python3
- secure the server

  - passwords
  - SSL/certs
  - ?non-root user
