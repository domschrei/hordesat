#!/bin/bash
#SBATCH --nodes=10
#SBATCH --ntasks=48
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_test_600s_log
#SBATCH --error=horde_test_600s_err
#SBATCH --job-name=horde_test_600s_log
#SBATCH --partition=normal
#SBATCH --time=1:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances=$(cat sbatch/instances_1|tr '\n' ' ')
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished
