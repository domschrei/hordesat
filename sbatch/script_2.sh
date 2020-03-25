#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_2_600s_log
#SBATCH --error=horde_103x5x4_2_600s_err
#SBATCH --job-name=horde_103x5x4_2_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/uniqinv45prop.cnf ../sat2018/bibd-19-57-9-3-1_glb.cnf ../sat2018/gto_p50c345.cnf ../sat2018/sted5_0x24204-60.cnf ../sat2018/mod8-bbd-zbd.rules.7-7.cnf ../sat2018/queen12_12.col.12.cnf ../sat2018/sted1_0x24204-330.cnf ../sat2018/20180322_164241842_p_cnf_320_1120.cnf ../sat2018/7-4-7.cnf ../sat2018/CNP-5-1100.cnf ../sat2018/apn-sbox6-cut5-helpbox29.cnf ../sat2018/gto_p50c311.cnf ../sat2018/satcoin-genesis-SAT-32.cnf ../sat2018/Nb29T6.cnf ../sat2018/course0.2_2018_3.cnf ../sat2018/Problem14_label55_true-unreach-call.c.cnf ../sat2018/by-X-2-7-100.cnf ../sat2018/sted5_0x0-40.cnf ../sat2018/Karatsuba4477457x5308417.cnf ../sat2018/ecarev-110-1031-23-40-1.cnf ../sat2018/uniqinv20prop.cnf ../sat2018/satcoin-genesis-SAT-256.cnf ../sat2018/a_rphp098_04.cnf ../sat2018/satcoin-genesis-SAT-4096.cnf ../sat2018/satcoin-genesis-SAT-128.cnf ../sat2018/TimetableCNFEncoding_20_UNKNOWN.cnf ../sat2018/cms-scheel-md5-families-r24-c4-p1-3-4-16.cnf ../sat2018/T77.2.0.cnf ../sat2018/8-4-8.cnf ../sat2018/CNP-5-1400.cnf ../sat2018/apn-sbox6-cut5-helpbox26.cnf ../sat2018/sqrt_ineq_3.c.cnf ../sat2018/ad-A-3-7-17.cnf ../sat2018/apn-sbox6-cut3-helpbox26.cnf ../sat2018/T125.2.0.cnf ../sat2018/ex039_33.cnf ../sat2018/Nb54T6.cnf ../sat2018/prime_119218851371.cnf ../sat2018/courses0.12_2017_9.cnf ../sat2018/6-4-6.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished