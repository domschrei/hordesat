#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_10_600s_log
#SBATCH --error=horde_103x5x4_10_600s_err
#SBATCH --job-name=horde_103x5x4_10_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/gto_p50c345_1.cnf ../sat2018/apn-sbox6-cut4-helpbox31.cnf ../sat2018/ex175_20.cnf ../sat2018/TimetableCNFEncoding_1_UNKNOWN.cnf ../sat2018/magicSquare-8_glb.cnf ../sat2018/apn-sbox5-cut5-symmbreak.cnf ../sat2018/queen8_12.col.12.cnf ../sat2018/sted1_0x0-330.cnf ../sat2018/apn-sbox5-cut3-symmbreak.cnf ../sat2018/ecarev-110-4099-22-30-7.cnf ../sat2018/CNP-5-500.cnf ../sat2018/T98.2.0.cnf ../sat2018/cms-scheel-md5-families-r24-c8-p0-3-5-6-14-16-18-19.cnf ../sat2018/prime_200560490131.cnf ../sat2018/apn-sbox6-cut4-helpbox26.cnf ../sat2018/Karatsuba6972593x13466917.cnf ../sat2018/9-4-10.cnf ../sat2018/sqrt_Householder_pseudoconstant_true-unreach-call.c.cnf ../sat2018/mchess_15.cnf ../sat2018/satcoin-genesis-SAT-9.cnf ../sat2018/Cake_8_16.cnf ../sat2018/sted1_0x1e3-100.cnf ../sat2018/20180322_164238439_p_cnf_320_1120.cnf ../sat2018/cms-scheel-md5-families-r24-c6-p1-4-6-13-14-18.cnf ../sat2018/queen14_14.col.14.cnf ../sat2018/satcoin-genesis-SAT-7.cnf ../sat2018/Problem11_label51_false-unreach-call.c.cnf ../sat2018/le450_25b.col.25.cnf ../sat2018/filter1_true-unreach-call.c.cnf ../sat2018/10-4-10.cnf ../sat2018/satcoin-genesis-SAT-16.cnf ../sat2018/terminator_03_true-unreach-call_true-termination.i.cnf ../sat2018/factoring29986577x29986577.cnf ../sat2018/20180321_140833987_p_cnf_320_1120.cnf ../sat2018/uniqinv25prop.cnf ../sat2018/cms-scheel-md5-families-r24-c5-p6-11-15-16-19.cnf ../sat2018/cz-d-4-7-5.cnf ../sat2018/e_rphp056_05.cnf ../sat2018/ortholatin-7.cnf ../sat2018/apn-sbox6-cut4-helpbox30.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished