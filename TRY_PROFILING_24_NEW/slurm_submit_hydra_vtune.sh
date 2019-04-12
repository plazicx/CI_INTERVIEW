#! /bin/bash

#SBATCH -p Lewis  # use the Lewis partition
#SBATCH -J saving_the_world  # give the job a custom name
#SBATCH -o results-%j.out  # give the job output a custom name
#SBATCH -t 0-02:00  # two hour time limit

#SBATCH -N 1  # number of nodes
#SBATCH -n 24  # number of cores (AKA tasks)

# Commands here run only on the first core
echo "$(hostname), reporting for duty."

module load intel/intel-2016-update2
# Commands with srun will run on all cores in the allocation
srun echo "Let's save the world!"

#export VT_PCTRACE=1

#NPROCS=`srun --nodes=${SLURM_MNODES} bash -c 'hostname' | wc -l`
#echo NPROCS=$NPROCS
#export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
#srun -n $NPROCS /projects/zigor/BINS_sipahi/vasp_intel_mpi > mpi-output-5GrL-2-6
#srun -n $NPROCS /user/predragl/BINS/vasp_5.2.12.11_no_SOC.exe > mpi-output-5GrL-2-6
#srun -n $NPROCS /user/predragl/BINS/vasp_new_slurm  > mpi-output-5GrL-2-6

#srun -n $NPROCS rhp_Lewis.exe 
#export I_MPI_PROCESS_MANAGER=mpd

NPROCS=`srun --nodes=${SLURM_MNODES} bash -c 'hostname' | wc -l`
echo NPROCS=$NPROCS


#mpirun -n 4 ./rhp_Lewis.exe  - some problem with this
#mpirun -bootstrap slurm -n 8 ./vdw.exe input_Xe_Layer_3.5 
export AMPLXE_MORE_PIN_OPTIONS='-ifeellucky'
mpiexec.hydra -bootstrap slurm -n $NPROCS amplxe-cl -collect hotspots -r profile.out -- ./vdw_lewis_intel-debug.exe input_Xe_Layer_3.5 
#mpiexec.hydra -bootstrap slurm -n 8 ./vdw.exe input_Xe_Layer_3.5 
