#!/usr/bin/env bash
# Copyright (c) 2021-2022, NVIDIA Corporation & Affiliates. All rights reserved.
#
# This work is made available under the Nvidia Source Code License-NC.
# To view a copy of this license, visit
# https://github.com/NVlabs/FAN/blob/main/LICENSE

# CONFIG=$1
# CHECKPOINT=$2
# GPUS=$3
# PORT=${PORT:-29500}
# PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
# python -m torch.distributed.launch --nproc_per_node=$GPUS --master_port=$PORT \
#     $(dirname "$0")/test_city_c.py $CONFIG $CHECKPOINT --launcher pytorch ${@:4}

CUDA_VISIBLE_DEVICES=0,1,2,3 python -m torch.distributed.launch --nproc_per_node=4 --master_port=1234 \
test_city_c.py data/config/ade20k.py checkpoints/deit_elliptical-delta5/checkpoint.pth --eval mIoU  --results-file output/corrupt/
