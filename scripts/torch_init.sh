#!/bin/bash

set -e

PACKAGE_PATH="$(pwd)/packages"


poetry run pip install \
    --extra-index-url https://download.pytorch.org/whl/nightly/cu121 --pre \
    torch torchvision torchaudio torch-tensorrt torchinfo torchviz pytorch-memlab
poetry run pip install \
    deepspeed

git -C "$PACKAGE_PATH" clone https://github.com/NVIDIA/apex
poetry run pip install -v --disable-pip-version-check --no-cache-dir --no-build-isolation --config-settings "--build-option=--cpp_ext" --config-settings "--build-option=--cuda_ext" "$PACKAGE_PATH/apex/"
