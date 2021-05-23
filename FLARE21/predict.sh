# !/bin/bash -e

export CUDA_VISIBLE_DEVICES=1
export nnUNet_raw_data_base="$PWD"
# 预处理文件输出目录
# export nnUNet_preprocessed="/home/an/nnUNet/datasets/Task101_preprocessed/"
# 结果目录
export RESULTS_FOLDER="$PWD/datasets/"

nnUNet_predict -i "/workspace/inputs/"  -o "/workspace/outputs/"  -t Task000_FLARE21Baseline -f all --disable_tta -tr nnUNetTrainerV2 -m 3d_fullres
