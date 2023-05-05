# !/bin/bash -e

export nnUNet_raw_data_base="/workspace"
export RESULTS_FOLDER="/workspace/datasets/"

echo  "\e[91m start predict use FlareBaseline 3d... \e[0m"

nnUNet_predict -i "/workspace/inputs/"  -o "/workspace/outputs/"  -t Task000_FLARE21Baseline -f all --disable_tta -tr nnUNetTrainerV2 -m 3d_fullres
