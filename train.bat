@echo off
setlocal enableextensions

set PYTHONPATH=.
set PATH_TO_AVA_TXT=C:\TEMP\MLData\AVA_dataset\AVA.txt
set PATH_TO_IMAGES=C:\TEMP\MLData\AVA_dataset\images\
set PATH_TO_CSV=C:\TEMP\MLData\AVA_dataset\
set BATCH_SIZE=16
set NUM_WORKERS=8
set NUM_EPOCH=50
set INIT_LR=0.0001
set EXPERIMENT_DIR_NAME=C:\TEMP\MLData\AVA_experiment_dir\

REM ------------  Get image score

python nima/cli.py get-image-score  --path_to_model_state %EXPERIMENT_DIR_NAME%\best_state.pth ^
                               --path_to_image %PATH_TO_IMAGES%\823448.jpg

REM  -----------  Train model

REM python nima/cli.py train-model --path_to_save_csv %PATH_TO_CSV% ^
REM                                --path_to_images %PATH_TO_IMAGES% ^
REM                                --experiment_dir %EXPERIMENT_DIR_NAME% ^
REM                                --num_workers %NUM_WORKERS%
REM REM                                 --batch_size %BATCH_SIZE% ^
REM REM                                 --num_epoch %NUM_EPOCH% ^
REM REM                                 --init_lr %INIT_LR% ^
REM REM 
REM ----------- Use tensorboard to tracking training progress

REM tensorboard --logdir .
REM  ----------- Validate model on val and test datasets

REM python nima/cli.py validate-model --path_to_model_state %EXPERIMENT_DIR_NAME%\best_state.pth ^
REM                                     --path_to_save_csv %PATH_TO_CSV% ^
REM                                     --path_to_images %PATH_TO_IMAGES% ^
REM                                     --num_workers %NUM_WORKERS%
REM REM                                     --batch_size $BATCH_SIZE \

REM  -----------  Clean and prepare dataset

REM python nima/cli.py prepare-dataset --path_to_ava_txt %PATH_TO_AVA_TXT% ^
REM                                     --path_to_save_csv %PATH_TO_CSV% ^
REM                                     --path_to_images %PATH_TO_IMAGES%

REM python nima/cli.py validate-model --path_to_model_state %EXPERIMENT_DIR_NAME%\best_state.pth ^

REM ------------------------------------------

REM (nima_pytorch) C:\Users\dholm\Documents\python\nima.pytorch>python nima/cli.py train-model --help
REM Usage: cli.py train-model [OPTIONS]
REM 
REM Options:
REM   --path_to_save_csv PATH  where save train.csv|val.csv|test.csv  [required]
REM   --path_to_images PATH    images directory  [required]
REM   --experiment_dir PATH    directory name to save all logs and weight
REM                            [required]
REM   --model_type TEXT        res net model type
REM   --batch_size INTEGER     batch size
REM   --num_workers INTEGER    number of reading workers
REM   --num_epoch INTEGER      number of epoch
REM   --init_lr FLOAT          initial learning rate
REM   --drop_out FLOAT         drop out
REM   --optimizer_type TEXT    optimizer type
REM   --seed INTEGER           random seed
REM   --help                   Show this message and exit.

REM 
REM (nima_pytorch) C:\Users\dholm\Documents\python\nima.pytorch>python nima\cli.py --help
REM Usage: cli.py [OPTIONS] COMMAND [ARGS]...
REM 
REM Options:
REM   --help  Show this message and exit.
REM 
REM Commands:
REM   get-image-score  Get image scores
REM   prepare-dataset  Parse, clean and split dataset
REM   run-web-api      Start server for model serving
REM   train-model      Train model
REM   validate-model   Validate model
REM 
REM (nima_pytorch) C:\Users\dholm\Documents\python\nima.pytorch>python nima\cli.py prepare-dataset --help 
REM Usage: cli.py prepare-dataset [OPTIONS]
REM 
REM Options:
REM   --path_to_ava_txt PATH   origin AVA.txt file  [required]
REM   --path_to_save_csv PATH  where save train.csv|val.csv|test.csv  [required]
REM   --path_to_images PATH    images directory  [required]
REM   --train_size FLOAT       train dataset size
REM   --num_workers INTEGER    num workers for parallel processing
REM   --help                   Show this message and exit.

REM (nima_pytorch) C:\Users\dholm\Documents\python\nima.pytorch>python nima/cli.py get-image-score --help
REM Usage: cli.py get-image-score [OPTIONS]
REM 
REM Options:
REM   --path_to_model_state PATH  path to model weight .pth file  [required]
REM   --path_to_image PATH        image   [required]
REM   --help                      Show this message and exit.
REM   