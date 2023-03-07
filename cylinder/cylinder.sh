#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH -p single
#SBATCH -A loni_proteus01s
#SBATCH -o o.out # optional, name of the stdout, using the job number (%j) and the first node (%N)
#SBATCH -e e.err # optional, name of the stderr, using job and first node values
#SBATCH -J cylinder

date
export WORKDIR=/work/$USER

module purge
module load proteus/1.8.1

mkdir -p $WORKDIR/$SLURM_JOB_NAME.$SLURM_JOBID
cd $WORKDIR/$SLURM_JOB_NAME.$SLURM_JOBID
cp $SLURM_SUBMIT_DIR/*.py .
cp $SLURM_SUBMIT_DIR/*.sh .

parun --TwoPhaseFlow cylinder.py -l 5 -C "he=0.1"

date

exit 0
