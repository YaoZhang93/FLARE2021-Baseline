# FLARE21 nnUNet Baseline

The official baseline model for ["MICCAI 2021 FLARE Challenge: Fast and Low GPU memory Abdominal oRgan sEgmentation"](https://flare.grand-challenge.org/FLARE21/), derived from [nnUNet](https://github.com/MIC-DKFZ/nnUNet) [1].

## Usage

### 1. Download pretrained models

Download models from 
* [Baidu Yun](https://pan.baidu.com/s/1lShlwCGUw6QieXUAIm2ZXg), password: ecio.
* [Google Drive](https://drive.google.com/file/d/1Ox8AjFc_SrJm7waGYzsBbhMfJ0OJoKiY/view?usp=sharing)

### 2. Setup models

```shell
git clone https://github.com/YaoZhang93/FLARE21nnUNetBaseline.git
cp ./FLARE21nnUNetBaseline/nnUNet.zip ./FLARE21/nunet/data/RESULTS_FOLDER/
cd ./FLARE21/nunet/data/RESULTS_FOLDER/
unzip nnUNet.zip
cd ../..
```

### 3. Inference

```shell
python inference/predict_simple.py -i INPUT_FOLDER -o OUTPUT_FOLDER -t Task000_FLARE21Baseline -m CONFIGURATION
```

* `INPUT_FOLDER` is the folder path that contains nii files for testing
* `OUTPUT_FOLDER` is the folder path for the predictions of the baseline model
* `CONFIGUREATION` should be `2d` or `3d_fullres` referring to 2D or 3D models, respectively.

For more usage, please refer to [the repositry of nnUNet](https://github.com/MIC-DKFZ/nnUNet).

### 4. Get the number of parameters

```shell
python get_params.py -m CONFIGURATION
```

* `CONFIGURATION` should be `2d` or `3d_fullres` referring to 2D or 3D models, respectively.

The output for `2d` should be:

>Total params: 41,268,192
>
>Trainable params: 41,268,192
>
>Non-trainable params: 0

The output for `3d_fullres` should be:

>Total params: 30,787,584
>
>Trainable params: 30,787,584
>
>Non-trainable params: 0

We use `torchsummary`  to get the summary of the model.  A simple usage is

```python
from torchsummary import summary

# The input_size of the baseline model is 1*80*192*160
summary(model, input_size)
```

Please refer to [pytorch-summary](https://github.com/sksq96/pytorch-summary) for more details. 

We encourage the participants to use it for the analysis of the models. `get_params.py` could be an example to adapt it to your own model.

### 5. Get the number of FLOPs

```shell
python get_flops.py -m CONFIGURATION
```

* `CONFIGURATION` should be `2d` or `3d_fullres` referring to 2D or 3D models, respectively.

The output for `2d` should be:

>Total FLOPs: 61307143168

The output for `3d_fullres` should be:

>Total FLOPs: 590861472000

We use `fvcore`  to get the FLOPs of the model.  A simple usage is

```python
from fvcore import FlopCountAnalysis

# The input_size of the baseline model is 1*1*80*192*160
inputs = (torch.randn(input_size),)
flops = FlopCountAnalysis(model, inputs)
```

Please refer to [fvcore document](https://detectron2.readthedocs.io/en/latest/modules/fvcore.html#fvcore.nn.FlopCountAnalysis) for more details. 

We encourage the participants to use it for the analysis of the models. `get_flops.py` could be an example to adapt it to your own model.

### 6. Submission

First, compress the segmentation results by

```shell
zip -r TeamNameVal1.zip OUTPUT_FOLDER
```

> `FLARE21/BaselineVal1.zip` is an example generated by the baseline model.

Then, submit the results on [FLARE21 submission page](https://flare.grand-challenge.org/evaluation/challenge/submissions/create/).

### 7. Reference

[1] Isensee, Fabian, Paul F Jaeger, Simon A A Kohl, Jens Petersen, and Klaus H Maier-Hein. 2021. “nnU-Net: A Self-Configuring Method for Deep Learning-Based Biomedical Image Segmentation.” Nature Methods 18 (2): 203–11.
