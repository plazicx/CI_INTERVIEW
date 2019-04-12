#! /bin/bash
#--------------------------------------------------------------------------------
##SBATCH -p Lewis
#SBATCH -p hpc4 
#SBATCH --job-name=hello_R  # name for the job
#SBATCH --cpus-per-task=2             # number of cores
#SBATCH --mem=2G                      # total memory
#SBATCH --time 0-00:15                # time limit in the form days-hours:minutes
##SBATCH --mail-user=username@missouri.edu  # email address for notifications
##SBATCH --mail-type=FAIL,END          # email types

##SBATCH --partition General           # max of 1 node and 4 hours; use `Lewis` for larger jobs
#--------------------------------------------------------------------------------

echo "### Starting at: $(date) ###"

## Module Commands
# 'use module avail r/' to find the latest version
module load r/r-3.5.1-python-2.7.14-tk
module list

## Run the R script
SCRIPT='hello.R'
srun Rscript ${SCRIPT}

echo "### Ending at: $(date) ###"
