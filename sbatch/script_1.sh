#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_1_600s_log
#SBATCH --error=horde_103x5x4_1_600s_err
#SBATCH --job-name=horde_103x5x4_1_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/gto_p60c235.cnf ../sat2018/gto_p50c314.cnf ../sat2018/ecarev-110-1031-23-40-5.cnf ../sat2018/gto_p50c312.cnf ../sat2018/mchess_19.cnf ../sat2018/sqrt_ineq_2.c.cnf ../sat2018/sdiv20prop.cnf ../sat2018/si2-b03m-m400-03.cnf ../sat2018/cms-scheel-md4-families-r24-c6-p2-4-9-16-17-19.cnf ../sat2018/ex009_10.cnf ../sat2018/Cake_9_19.cnf ../sat2018/courses_flat_0.16_2017_9.cnf ../sat2018/CNP-5-1900.cnf ../sat2018/course_flat_0.16_2018_3.cnf ../sat2018/udiv48prop.cnf ../sat2018/sted1_0x0-380.cnf ../sat2018/satcoin-genesis-SAT-4.cnf ../sat2018/frb35-17-5-mgd_ext.cnf ../sat2018/gto_p50c307.cnf ../sat2018/sted5_0x1e3-20.cnf ../sat2018/T105.2.0.cnf ../sat2018/Nb8T61.cnf ../sat2018/si2-b06m-m1000-03.cnf ../sat2018/T87.2.0.cnf ../sat2018/ex177_12.cnf ../sat2018/T103.2.0.cnf ../sat2018/ex179_11.cnf ../sat2018/e_rphp096_04.cnf ../sat2018/ecarev-110-4099-22-30-5.cnf ../sat2018/6-4-7.cnf ../sat2018/ex145_10.cnf ../sat2018/courses0.2_2017_9.cnf ../sat2018/mchess_17.cnf ../sat2018/CNP-5-1600.cnf ../sat2018/T82.2.0.cnf ../sat2018/cms-scheel-md4-families-r24-c5-p1-5-10-12-18.cnf ../sat2018/satcoin-genesis-SAT-512.cnf ../sat2018/satcoin-genesis-SAT-2048.cnf ../sat2018/dist7.c.cnf ../sat2018/assoc_mult_err_3.c.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished