#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_6_600s_log
#SBATCH --error=horde_103x5x4_6_600s_err
#SBATCH --job-name=horde_103x5x4_6_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/Nb45T6.cnf ../sat2018/ecarev-110-1031-23-40-2.cnf ../sat2018/ecarev-110-1031-23-40-8.cnf ../sat2018/apn-sbox6-cut3-helpbox31.cnf ../sat2018/sted5_0x24204-50.cnf ../sat2018/course_flat_0.12_2018_3_1.cnf ../sat2018/Nb44T6.cnf ../sat2018/CNP-5-200.cnf ../sat2018/udiv47prop.cnf ../sat2018/Nb13T165.cnf ../sat2018/a_rphp035_05.cnf ../sat2018/ex067_10.cnf ../sat2018/Nb27T6.cnf ../sat2018/le450_15c.col.15.cnf ../sat2018/ae_rphp045_05.cnf ../sat2018/commutativity3.c.cnf ../sat2018/cms-scheel-md4-families-r24-c6-p0-5-10-11-17-18.cnf ../sat2018/Nb13T166.cnf ../sat2018/T129.2.0.cnf ../sat2018/uniqinv30prop.cnf ../sat2018/sdiv17prop.cnf ../sat2018/T56.2.0.cnf ../sat2018/20180322_164245263_p_cnf_320_1120.cnf ../sat2018/20180326_095805836_p_cnf_320_1120.cnf ../sat2018/ecarev-110-4099-22-30-4.cnf ../sat2018/1mod8.rules.7-7.cnf ../sat2018/Nb14T194.cnf ../sat2018/a_rphp055_04.cnf ../sat2018/queen8_8.col.9.cnf ../sat2018/T96.2.0.cnf ../sat2018/cms-scheel-md5-families-r24-c7-p1-3-6-10-11-14-15.cnf ../sat2018/dist6.c.cnf ../sat2018/CNP-5-1300.cnf ../sat2018/assoc2.c.cnf ../sat2018/20180321_110704973_p_cnf_320_1120.cnf ../sat2018/Nb8T62.cnf ../sat2018/cms-scheel-md4-families-r24-c4-p6-13-17-19.cnf ../sat2018/ae_rphp056_05.cnf ../sat2018/uniqinv47prop.cnf ../sat2018/TimetableCNFEncoding_9_UNKNOWN.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished