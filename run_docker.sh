#/bin/bash
docker run --rm -ti -p 8888:8888 -v $(pwd):/root okuisatoshi/jupyter-notebook
