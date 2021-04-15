# FLARE21 nnUNet Baseline

The official baseline model for ["MICCAI 2021 FLARE Challenge: Fast and Low GPU memory Abdominal oRgan sEgmentation"](https://flare.grand-challenge.org/FLARE21/), derived from [nnUNet](https://github.com/MIC-DKFZ/nnUNet) [1].

## Usage

### 1. Download pretrained models

Download models from 
* [Baidu Yun](https://pan.baidu.com/s/1lShlwCGUw6QieXUAIm2ZXg), password: ecio.
* [Zenodo]()

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

### 4. Reference

[1] Isensee, Fabian, Paul F Jaeger, Simon A A Kohl, Jens Petersen, and Klaus H Maier-Hein. 2021. “nnU-Net: A Self-Configuring Method for Deep Learning-Based Biomedical Image Segmentation.” Nature Methods 18 (2): 203–11.
