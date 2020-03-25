#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_8_600s_log
#SBATCH --error=horde_103x5x4_8_600s_err
#SBATCH --job-name=horde_103x5x4_8_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/cannonball-opt-y.rules.4-10.cnf ../sat2018/mod8-abd-yad.rules.7-7.cnf ../sat2018/20180321_140827428_p_cnf_320_1120.cnf ../sat2018/gto_p60c234.cnf ../sat2018/bibd-8-70-35-4-15_glb.cnf ../sat2018/CNP-5-900.cnf ../sat2018/20180326_095804286_p_cnf_320_1120.cnf ../sat2018/cms-scheel-md4-families-r24-c4-p4-9-13-18.cnf ../sat2018/sted5_0x1e3-40.cnf ../sat2018/Nb8T63.cnf ../sat2018/gto_p60c343.cnf ../sat2018/20180321_110707239_p_cnf_320_1120.cnf ../sat2018/Nb37T6.cnf ../sat2018/le450_25c.col.25.cnf ../sat2018/20180322_164241329_p_cnf_320_1120.cnf ../sat2018/queen8-8-9.cnf ../sat2018/e_rphp065_05.cnf ../sat2018/Problem14_label14_false-unreach-call.c.cnf ../sat2018/dist9.c.cnf ../sat2018/5or7mod8.rules.7-7.cnf ../sat2018/T62.2.0.cnf ../sat2018/a_rphp065_04.cnf ../sat2018/CNP-5-300.cnf ../sat2018/cms-scheel-md5-families-r24-c7-p1-5-6-12-16-18-19.cnf ../sat2018/CNP-5-0.cnf ../sat2018/apn-sbox6-cut3-helpbox29.cnf ../sat2018/20180321_110706599_p_cnf_320_1120.cnf ../sat2018/course_flat_0.12_2018_3.cnf ../sat2018/T86.2.0.cnf ../sat2018/apn-sbox6-cut5-helpbox28.cnf ../sat2018/ex025_19.cnf ../sat2018/bx-d-4-7-8.cnf ../sat2018/ex051_9.cnf ../sat2018/a_rphp085_04.cnf ../sat2018/dist5.c.cnf ../sat2018/CNP-5-600.cnf ../sat2018/ex045_7.cnf ../sat2018/pals_floodmax.5_overflow_false-unreach-call.ufo.UNBOUNDED.pals.c.cnf ../sat2018/CNP-5-400.cnf ../sat2018/school1_nsh.col.14.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished