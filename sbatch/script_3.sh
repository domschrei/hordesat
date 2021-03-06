#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_3_600s_log
#SBATCH --error=horde_103x5x4_3_600s_err
#SBATCH --job-name=horde_103x5x4_3_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/ae_rphp055_04.cnf ../sat2018/satcoin-genesis-SAT-64.cnf ../sat2018/20180322_164226378_p_cnf_320_1120.cnf ../sat2018/Problem14_label57_false-unreach-call.c.cnf ../sat2018/Nb8T60.cnf ../sat2018/gto_p60c231_1.cnf ../sat2018/CNP-5-1000.cnf ../sat2018/20180326_095804936_p_cnf_320_1120.cnf ../sat2018/TimetableCNFEncoding_10_UNKNOWN.cnf ../sat2018/CNP-5-1800.cnf ../sat2018/si2-r001-m200-00.cnf ../sat2018/gto_p60c233.cnf ../sat2018/TimetableCNFEncoding_17_UNKNOWN.cnf ../sat2018/gto_p60c231.cnf ../sat2018/mchess_16.cnf ../sat2018/course0.12_2018_3_1.cnf ../sat2018/sdiv25prop.cnf ../sat2018/ecarev-110-1031-23-40-7.cnf ../sat2018/satcoin-genesis-SAT-5.cnf ../sat2018/less-cy-caa.rules.4-9.cnf ../sat2018/Problem14_label19_true-unreach-call.c.cnf ../sat2018/sdiv30prop.cnf ../sat2018/Nb39T6.cnf ../sat2018/Nb42T6.cnf ../sat2018/apn-sbox6-cut5-helpbox23.cnf ../sat2018/uniqinv46prop.cnf ../sat2018/ex065_25.cnf ../sat2018/sted1_0x24204-350.cnf ../sat2018/filter_iir_true-unreach-call.c.cnf ../sat2018/Nb51T6.cnf ../sat2018/sdiv16prop.cnf ../sat2018/udiv35prop.cnf ../sat2018/Karatsuba7654321x1234567.cnf ../sat2018/ecarev-110-4099-22-30-2.cnf ../sat2018/TimetableCNFEncoding_8_UNKNOWN.cnf ../sat2018/queen15_15.col.15.cnf ../sat2018/satcoin-genesis-SAT-8192.cnf ../sat2018/6-5-6.cnf ../sat2018/sdiv40prop.cnf ../sat2018/udiv40prop.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished