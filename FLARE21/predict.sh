# !/bin/bash -e

export CUDA_VISIBLE_DEVICES=1
export nnUNet_raw_data_base="$PWD"
# path to preprocessing results
# export nnUNet_preprocessed="/home/an/nnUNet/datasets/Task101_preprocessed/"
# path to segmentation results
export RESULTS_FOLDER="$PWD/datasets/"

nnUNet_predict -i "/workspace/inputs/"  -o "/workspace/outputs/"  -t Task000_FLARE21Baseline -f all --disable_tta -tr nnUNetTrainerV2 -m 3d_fullres
