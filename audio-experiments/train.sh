#!/bin/bash
#SBATCH --job-name=aibo-baseline
#SBATCH --output=logs/aibo_baseline_%j.out
#SBATCH --error=logs/aibo_baseline_%j.err
#SBATCH --time=30:10:00
#SBATCH --partition=dfl
#SBATCH --nodelist=chi-gpu5
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --gres=gpu:rtx3090:1


VENV_BIN="/home/ge62niq/data/chi-gpu1/ge62niq/personalized_ser/.venv310/bin"
CONF_DIR="/home/ge62niq/data/chi-gpu1/ge62niq/ser-progress-replication/audio-experiments/conf"
export PYTHONPATH=/home/ge62niq/data/chi-gpu1/ge62niq/ser-progress-replication/audio-experiments:$PYTHONPATH

"${VENV_BIN}/autrainer" train --config-dir "${CONF_DIR}" --config-name aibo.wav