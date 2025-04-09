#!/bin/bash
#SBATCH -t 0:30:00  # time requested in hour:minute:second
#SBATCH --mem=4G
#SBATCH --gres=gpu:1
#SBATCH --constraint=a6000
#SBATCH --partition=compsci-gpu
#SBATCH --output=slurm_%j.out
#srun source .pt2/bin/activate
#srun virtualenv --no-download $SLURM_TMPDIR/env

srun hostname
srun date
# Define a writable directory for the virtual environment
export VENV_DIR=$HOME/pt3
mkdir -p $VENV_DIR

source $HOME/pt3/bin/activate
srun python3 -m venv $VENV_DIR
srun bash -c "source $VENV_DIR/bin/activate && pip3 install -r ./requirements/pt2.txt"
# Activate and install dependencies within the same shell session
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/cat_gral.png --num_frames=25"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/cat_gral.png --num_frames=50"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/duke_basketball.png --num_frames=25"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/custom_test/driving_v2.png --num_frames=35 --output_folder=outputs/simple_video_sample/svd_xt/driving"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/custom_test/2192313690.png --num_frames=35 --output_folder=outputs/simple_video_sample/svd_xt/duke_dunk"

# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/custom_test/motocross_gen.png --num_frames=35 --output_folder=outputs/simple_video_sample/svd_xt/motocross_1"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/custom_test/supercross_gen.png --num_frames=35 --output_folder=outputs/simple_video_sample/svd_xt/motocross_2"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/custom_test/dog_paw.png --num_frames=35 --output_folder=outputs/simple_video_sample/svd_xt/dog_motion"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/custom_test/duke_dog.png --num_frames=35 --output_folder=outputs/simple_video_sample/svd_xt/duke_dog"
# srun bash -c "source $VENV_DIR/bin/activate && python scripts/sampling/simple_video_sample.py --version=svd_xt --input_path=assets/custom_test/paragliding.png --num_frames=35 --output_folder=outputs/simple_video_sample/svd_xt/paragliding"

srun bash -c "source $VENV_DIR/bin/activate && python transform_togif.py"

