#!/bin/bash

CUDA_VISIBLE_DEVICES=0,1,2,3 python -m torch.distributed.launch --nproc_per_node=4 --master_port=1510 --use_env main.py --model deit_robust_tiny_patch16_224 --batch-size 48 --data-path /home/tongzheng/imagenet --output_dir ./files_robust_0.1 --use_wandb 0 --project_name 'robust' --job_name imagenet_deit_robust --finetune ./files_robust_0.1/checkpoint.pth --eval 1 --inc_path /home/tongzheng/imagenet-c

CUDA_VISIBLE_DEVICES=0,1,2,3 python -m torch.distributed.launch --nproc_per_node=4 --master_port=1511 --use_env main.py --model deit_robust_tiny_patch16_224 --batch-size 48 --data-path /home/tongzheng/imagenet --output_dir ./files_robust_0.4 --use_wandb 0 --project_name 'robust' --job_name imagenet_deit_robust --finetune ./files_robust_0.4/checkpoint.pth --eval 1 --inc_path /home/tongzheng/imagenet-c

CUDA_VISIBLE_DEVICES=0,1,2,3 python -m torch.distributed.launch --nproc_per_node=4 --master_port=1512 --use_env main.py --model deit_robust_tiny_patch16_224 --batch-size 48 --data-path /home/tongzheng/imagenet --output_dir ./files_robust_1.0 --use_wandb 0 --project_name 'robust' --job_name imagenet_deit_robust --finetune ./files_robust_1.0/checkpoint.pth --eval 1 --inc_path /home/tongzheng/imagenet-c