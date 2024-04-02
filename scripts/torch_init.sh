#!/bin/bash

set -e

PACKAGE_PATH="$(pwd)/packages"

poetry run pip install -U pip
poetry run pip install \
    --extra-index-url https://download.pytorch.org/whl/nightly/cu121 --pre \
    torch torchvision torchaudio torch-tensorrt torch-geometric torchinfo torchviz pytorch-memlab
poetry run pip install \
    -f https://data.pyg.org/whl/torch-2.2.0+cu121.html \
    pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv
poetry run pip install \
    --extra-index-url https://pypi.anaconda.org/rapidsai-wheels-nightly/simple \
    "cudf-cu12>=24.4.0a0,<=24.4" "dask-cudf-cu12>=24.4.0a0,<=24.4"  "cuml-cu12>=24.4.0a0,<=24.4" "cugraph-cu12>=24.4.0a0,<=24.4" "cuspatial-cu12>=24.4.0a0,<=24.4" "cuproj-cu12>=24.4.0a0,<=24.4" "cuxfilter-cu12>=24.4.0a0,<=24.4" "cucim-cu12>=24.4.0a0,<=24.4" "pylibraft-cu12>=24.4.0a0,<=24.4" "raft-dask-cu12>=24.4.0a0,<=24.4" "dask-cuda>=24.4.0a0,<=24.4"
poetry run pip install \
    deepspeed

git -C "$PACKAGE_PATH" clone https://github.com/NVIDIA/apex
poetry run pip install -v --disable-pip-version-check --no-cache-dir --no-build-isolation --config-settings "--build-option=--cpp_ext" --config-settings "--build-option=--cuda_ext" "$PACKAGE_PATH/apex/"
