#!/bin/bash

set -e

PROJECT_PATH=$(pwd)/packages

poetry run pip install -U "jax[cuda12]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
poetry run pip install flax optax
