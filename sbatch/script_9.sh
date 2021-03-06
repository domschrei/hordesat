#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_9_600s_log
#SBATCH --error=horde_103x5x4_9_600s_err
#SBATCH --job-name=horde_103x5x4_9_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/factoring87654321x12345678.cnf ../sat2018/gto_p60c241.cnf ../sat2018/newton_3_4_true-unreach-call.i.cnf ../sat2018/exam_flat_0.04_2018_3.cnf ../sat2018/ae_rphp095_04.cnf ../sat2018/T84.2.0.cnf ../sat2018/e_rphp065_04.cnf ../sat2018/8-4-9.cnf ../sat2018/dist4.c.cnf ../sat2018/TimetableCNFEncoding_6_UNKNOWN.cnf ../sat2018/ex145_11.cnf ../sat2018/sted5_0x0-50.cnf ../sat2018/sted5_0x24204-70.cnf ../sat2018/sted5_0x0-60.cnf ../sat2018/ax-d-4-7-5.cnf ../sat2018/quadratic_loose_error.c.cnf ../sat2018/cms-scheel-md5-families-r24-c11-p1-4-6-9-10-11-13-15-17-18-19.cnf ../sat2018/T93.2.0.cnf ../sat2018/avg_true-unreach-call.i.cnf ../sat2018/course_flat_0.12_2018_3_5.cnf ../sat2018/ex157_10.cnf ../sat2018/Nb52T6.cnf ../sat2018/exam0.04_2018_3.cnf ../sat2018/sted5_0x0-70.cnf ../sat2018/20180322_164224543_p_cnf_320_1120.cnf ../sat2018/T122.2.0.cnf ../sat2018/lei450-05b-05.cnf ../sat2018/frb35-17-5_ext.cnf ../sat2018/courses_flat_0.12_2017_9.cnf ../sat2018/ex095_8.cnf ../sat2018/CNP-5-1700.cnf ../sat2018/sted5_0x1e3-60.cnf ../sat2018/pals_lcr.8_overflow_false-unreach-call.ufo.UNBOUNDED.pals.c.cnf ../sat2018/course_flat_0.12_2018_3_3.cnf ../sat2018/apn-sbox6-cut4-helpbox29.cnf ../sat2018/Problem14_label48_true-unreach-call.c.cnf ../sat2018/ex175_17.cnf ../sat2018/ex175_18.cnf ../sat2018/cms-scheel-md4-families-r24-c5-p5-13-16-17-19.cnf ../sat2018/cms-scheel-md4-families-r24-c5-p0-5-11-13-18.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished