@echo off
setlocal enableextensions

set PYTHONPATH=%PYTHONPATH%;.

cmd /k "conda activate nima_pytorch"

REM python nima\cli.py get-image-score --path_to_model_weight pretrain-model.pth --path_to_image test.jpg
REM python nima\cli.py get-image-score --path_to_model_state pretrain-model.pth --path_to_image test.jpg