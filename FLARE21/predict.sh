# !/bin/bash -e

export nnUNet_raw_data_base="$PWD"
export RESULTS_FOLDER="$PWD/datasets/"

nnUNet_predict -i "/workspace/inputs/"  -o "/workspace/outputs/"  -t Task000_FLARE21Baseline -f all --disable_tta -tr nnUNetTrainerV2 -m 3d_fullres
