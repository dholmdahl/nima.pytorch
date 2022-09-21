@echo off
setlocal enableextensions

set PYTHONPATH=.
set PATH_TO_AVA_TXT=C:\TEMP\MLData\AVA_dataset\AVA.txt
set PATH_TO_IMAGES=C:\TEMP\MLData\AVA_dataset\images\
set PATH_TO_CSV=C:\TEMP\MLData\AVA_dataset\
set BATCH_SIZE=16
set NUM_WORKERS=2
set NUM_EPOCH=50
set INIT_LR=0.0001
set EXPERIMENT_DIR_NAME=C:\TEMP\MLData\AVA_experiment_dir\

REM  -----------  Clean and prepare dataset

python nima/cli.py prepare_dataset --path_to_ava_txt %PATH_TO_AVA_TXT% ^
                                    --path_to_save_csv %PATH_TO_CSV% ^
                                    --path_to_images %PATH_TO_IMAGES%

REM  -----------  Train model

REM python nima/cli.py train_model --path_to_save_csv $PATH_TO_CSV \
REM                                 --path_to_images $PATH_TO_IMAGES \
REM                                 --batch_size $BATCH_SIZE \
REM                                 --num_workers $NUM_WORKERS \
REM                                 --num_epoch $NUM_EPOCH \
REM                                 --init_lr $INIT_LR \
REM                                 --experiment_dir_name $EXPERIMENT_DIR_NAME
REM 
REM ----------- Use tensorboard to tracking training progress

REM tensorboard --logdir .
REM  ----------- Validate model on val and test datasets

REM python nima/cli.py validate_model --path_to_model_weight ./pretrain-model.pth \
REM                                     --path_to_save_csv $PATH_TO_CSV \
REM                                     --path_to_images $PATH_TO_IMAGES \
REM                                     --batch_size $BATCH_SIZE \
REM                                     --num_workers $NUM_EPOCH