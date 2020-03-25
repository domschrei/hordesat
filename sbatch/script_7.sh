#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_7_600s_log
#SBATCH --error=horde_103x5x4_7_600s_err
#SBATCH --job-name=horde_103x5x4_7_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/T116.2.0.cnf ../sat2018/gto_p60c239.cnf ../sat2018/full-by-za.rules.5-7.cnf ../sat2018/cz-3-7-7.cnf ../sat2018/a_rphp045_05.cnf ../sat2018/sted1_0x0-350.cnf ../sat2018/ecarev-110-1031-23-40-3.cnf ../sat2018/satcoin-genesis-SAT-3.cnf ../sat2018/ramsey-30-4.cnf ../sat2018/C3-2-31.cnf ../sat2018/TimetableCNFEncoding_4_UNKNOWN.cnf ../sat2018/gto_p60c295.cnf ../sat2018/commutativity.c.cnf ../sat2018/20180321_140826713_p_cnf_320_1120.cnf ../sat2018/gto_p60c238.cnf ../sat2018/ex187_10.cnf ../sat2018/course0.12_2018_3_5.cnf ../sat2018/factoring94418953x321534781.cnf ../sat2018/8-4-10.cnf ../sat2018/mchess_18.cnf ../sat2018/CNP-5-1500.cnf ../sat2018/T117.2.0.cnf ../sat2018/uniqinv40prop.cnf ../sat2018/course0.12_2018_3_3.cnf ../sat2018/si2-m4Dr2-m256-08.cnf ../sat2018/7-5-6.cnf ../sat2018/apn-sbox6-cut3-helpbox30.cnf ../sat2018/20180322_164223076_p_cnf_320_1120.cnf ../sat2018/e_rphp035_05.cnf ../sat2018/gto_p50c291.cnf ../sat2018/quadratic_tight_error.c.cnf ../sat2018/dist8.c.cnf ../sat2018/cms-scheel-md5-families-r24-c5-p2-7-8-15-19.cnf ../sat2018/by-alt-5-7.cnf ../sat2018/magicSquare-9_glb.cnf ../sat2018/school1.col.14.cnf ../sat2018/10-3-13.cnf ../sat2018/apn-sbox6-cut3-helpbox28.cnf ../sat2018/20180321_140824282_p_cnf_320_1120.cnf ../sat2018/apn-sbox5-cut4-symmbreak.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished