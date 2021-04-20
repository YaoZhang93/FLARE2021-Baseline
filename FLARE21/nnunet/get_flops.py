import sys
sys.path.append('..')
import argparse
from batchgenerators.utilities.file_and_folder_operations import *
from nnunet.training.model_restore import load_model_and_checkpoint_files
from fvcore.nn.flop_count import _DEFAULT_SUPPORTED_OPS, FlopCountAnalysis, flop_count
import numpy as np
import torch
import os
join = os.path.join

parser = argparse.ArgumentParser()
parser.add_argument('-m', '--model', help="2d, 3d_lowres, 3d_fullres or 3d_cascade_fullres. Default: 3d_fullres", default="3d_fullres", required=False)
args = parser.parse_args()
model = args.model

model_path = join('./data/RESULTS_FOLDER/nnUNet', model, 'Task000_FLARE21Baseline/nnUNetTrainerV2__nnUNetPlansv2.1')
trainer, params = load_model_and_checkpoint_files(model_path, folds='all', checkpoint_name='model_final_checkpoint')
pkl_file = join(model_path, "all/model_final_checkpoint.model.pkl")
info = load_pickle(pkl_file)
if model == '2d' or model == '3d_lowres':
    patch_size = info['plans']['plans_per_stage'][0]['patch_size']
else:
    patch_size = info['plans']['plans_per_stage'][1]['patch_size']
patch_size = np.append(np.array(1), patch_size)

inputs = (torch.randn(tuple(np.append(np.array(1),patch_size))).cuda(),)
flops = FlopCountAnalysis(trainer.network, inputs)
print('Total FLOPs:', flops.total())
