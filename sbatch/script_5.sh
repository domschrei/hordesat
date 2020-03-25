#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_5_600s_log
#SBATCH --error=horde_103x5x4_5_600s_err
#SBATCH --job-name=horde_103x5x4_5_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/ae_rphp062_05.cnf ../sat2018/course_flat_0.2_2018_3.cnf ../sat2018/ex065_24.cnf ../sat2018/apn-sbox6-cut3-helpbox23.cnf ../sat2018/TimetableCNFEncoding_2_UNKNOWN.cnf ../sat2018/le450_25a.col.25.cnf ../sat2018/apn-sbox6-cut4-helpbox23.cnf ../sat2018/ae_rphp035_05.cnf ../sat2018/satcoin-genesis-SAT-8.cnf ../sat2018/T92.2.0.cnf ../sat2018/newton_3_6_false-unreach-call.i.cnf ../sat2018/cms-scheel-md4-families-r24-c5-p1-8-13-18-19.cnf ../sat2018/CNP-5-700.cnf ../sat2018/sdiv15prop.cnf ../sat2018/sted1_0x1e3-300.cnf ../sat2018/ex015_14.cnf ../sat2018/queen13_13.col.13.cnf ../sat2018/sted1_0x24204-380.cnf ../sat2018/si2-r001-m200-09.cnf ../sat2018/cms-scheel-md4-families-r24-c6-p1-9-13-16-18-19.cnf ../sat2018/TimetableCNFEncoding_3_UNKNOWN.cnf ../sat2018/ex177_13.cnf ../sat2018/patat-08-comp-3.cnf ../sat2018/Nb11T118.cnf ../sat2018/CNP-5-800.cnf ../sat2018/Problem14_label20_true-unreach-call.c.cnf ../sat2018/ramsey-32-4.cnf ../sat2018/a_rphp056_05.cnf ../sat2018/TimetableCNFEncoding_5_UNKNOWN.cnf ../sat2018/6-3-8.cnf ../sat2018/si2-b03m-m800-03.cnf ../sat2018/factoring54018521x562448657.cnf ../sat2018/full-cy-caa.rules.7-7.cnf ../sat2018/sted1_0x0-420.cnf ../sat2018/le450_15b.col.15.cnf ../sat2018/exams0.04_2017_9.cnf ../sat2018/course0.2_2018_3_5.cnf ../sat2018/dist10.c.cnf ../sat2018/sted1_0x1e3-200.cnf ../sat2018/full-ax-xa.rules.7-7.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished