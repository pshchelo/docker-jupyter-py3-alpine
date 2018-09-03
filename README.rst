=============================================
Jupyter notebook based on Alpine docker image
=============================================

Basic insecure single user Jupyter Notebook server deployment, Python3-based.

**HARDCODED PASSWORD IS** ``jupyter``

alpine-jupyter-minimal-py3
==========================
.. image:: https://img.shields.io/docker/stars/pshchelo/alpine-jupyter-minimal-py3.svg
   :target: `alpine-jupyter-minimal-py3_dockerhub`_

.. image:: https://img.shields.io/docker/pulls/pshchelo/alpine-jupyter-minimal-py3.svg
   :target: `alpine-jupyter-minimal-py3_dockerhub`_

.. image:: https://img.shields.io/docker/automated/pshchelo/alpine-jupyter-minimal-py3.svg
   :target: `alpine-jupyter-minimal-py3_dockerhub`_

.. _alpine-jupyter-minimal-py3_dockerhub: https://hub.docker.com/r/pshchelo/alpine-jupyter-minimal-py3/

Apart from Python3 stdlib following Python packages are installed:

- notebook
- ipywidgets
- requests

This makes this image already useful for teaching/showcasing
and some development around Web APIs.

alpine-jupyter-sci-py3
======================
.. image:: https://img.shields.io/docker/stars/pshchelo/alpine-jupyter-sci-py3.svg
   :target: `alpine-jupyter-sci-py3_dockerhub`_

.. image:: https://img.shields.io/docker/pulls/pshchelo/alpine-jupyter-sci-py3.svg
   :target: `alpine-jupyter-sci-py3_dockerhub`_

.. image:: https://img.shields.io/docker/automated/pshchelo/alpine-jupyter-sci-py3.svg
   :target: `alpine-jupyter-sci-py3_dockerhub`_

.. _alpine-jupyter-sci-py3_dockerhub: https://hub.docker.com/r/pshchelo/alpine-jupyter-sci-py3/

In addition to the minimal image (`alpine-jupyter-minimal-py3`_),
the following scientific/visualization Python packages are added:

- numpy
- pandas
- sympy
- networkx
- plotly (Plot.ly integration, >= 1.9 has offline mode)
- cufflinks

``matplotlib``, ``scipy`` and various ``scikits`` may be added later
as they require non-trivial build dependencies.

Usage
=====

Standard Jupyter port ``8888`` is exposed, map it to your local port.
You can plug your own persistent notebooks as volume to ``/notebooks`` mount.
Example start of the minimal container::

    docker run -d \
        --name jupyter \
        -p 8888:8888 \
        -v ${PWD}:/notebooks \
        pshchelo/alpine-jupyter-minimal-py3

Extending image at run-time
---------------------------
The entrypoint to image is ``jupyter-notebook`` and the server is run
under the ``root`` user.

Together with Terminal available in Jupyter server, this gives you
possibility to run any shell command from inside the container, including
adding system packages with ``apk add``
or Python packages with ``python3 -m pip install``.
