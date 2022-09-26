from nima.inference_model import InferenceModel

import argparse
from ast import arg
from genericpath import isdir
# from genericpath import isdir
# import json
from os import path, listdir, makedirs, stat
from pathlib import Path
# import re
# import shutil
# import tarfile
# import zipfile
# import zlib
# import errno
import datetime

r"""
List contents of folder recursively to an output file
Author: Dan Holmdahl

Examples:
    python logscan.py -sn 007516 009437 006104 016008 004696 004886 004886 010824 007212 010724 010613
"""

def parse_args():
    parser = argparse.ArgumentParser(description='Score images folder')
    parser.add_argument('-i', '--input', required=True, help='Input folder')
    parser.add_argument('-o', '--output', required=True, help='Output file')

    return parser

# def glob_re(path, regex="", glob_mask="**/*") -> list:
#     "Return files in path matching regular expression"
#     p = Path(path)
#     return [f for f in p.glob(glob_mask) if (f.is_dir() and re.search(regex, str(f)))]

if __name__ == "__main__":
    parser = parse_args()
    args = parser.parse_args()
    time_str = lambda t : datetime.datetime.fromtimestamp(t).strftime("%Y-%m-%d %H:%M:%S")

    # Extract logs only from zip/tgz file(s)
    p = Path(args.input)
    if not p.exists() or not p.is_dir():
        print(f"input folder not found or not a folder")
        parser.print_help()

    path_model = 'C:\\TEMP\\MLData\\AVA_experiment_dir\\best_state.pth'
    model = InferenceModel(path_to_model_state=path_model)

    with open(args.output, 'w') as f:
        f.write(f"------ Scores for {p.resolve()}\n")
        for file in p.glob("**/*.jpg"):
            if path.isfile(file):
                stats = stat(file)
                result = model.predict_from_file(file)
                #f.write(f"{path.relpath(file, args.input)} - {time_str(stats.st_mtime)} - {stats.st_size}\n")
                f.write(f'{result["mean_score"]} - {file} - {time_str(stats.st_mtime)} - {stats.st_size}\n')
        


