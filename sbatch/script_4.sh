#!/bin/bash
#SBATCH --nodes=103
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=4
#SBATCH --output=horde_103x5x4_4_600s_log
#SBATCH --error=horde_103x5x4_4_600s_err
#SBATCH --job-name=horde_103x5x4_4_600s
#SBATCH --partition=normal
#SBATCH --time=7:00:00
module load mpi/impi/2019
module load compiler/gnu/7
export MPIRUN_OPTIONS='-binding domain='${SLURM_CPUS_PER_TASK}':compact -print-rank-map -envall'
instances="../sat2018/bibd-16-80-15-3-2_glb.cnf ../sat2018/udiv45prop.cnf ../sat2018/ae_rphp075_04.cnf ../sat2018/le450_15a.col.15.cnf ../sat2018/cms-scheel-md4-families-r24-c5-p0-7-10-15-19.cnf ../sat2018/apn-sbox6-cut4-helpbox28.cnf ../sat2018/e_rphp055_04.cnf ../sat2018/bx-d-4-7-6.cnf ../sat2018/huck.col.11.cnf ../sat2018/Problem11_label29_false-unreach-call.c.cnf ../sat2018/8-5-6.cnf ../sat2018/20180321_140823961_p_cnf_320_1120.cnf ../sat2018/satcoin-genesis-SAT-10.cnf ../sat2018/apn-sbox6-cut5-helpbox30.cnf ../sat2018/mchess_20.cnf ../sat2018/T90.2.0.cnf ../sat2018/CNP-5-1200.cnf ../sat2018/course0.16_2018_3_5.cnf ../sat2018/Nb49T6.cnf ../sat2018/pals_lcr-var-start-time.6_true-unreach-call.ufo.UNBOUNDED.pals.c.cnf ../sat2018/T107.2.0.cnf ../sat2018/less-cy-caa.rules.6-4.cnf ../sat2018/gto_p50c314_1.cnf ../sat2018/Cake_9_20.cnf ../sat2018/20180322_164226661_p_cnf_320_1120.cnf ../sat2018/pals_lcr-var-start-time.5_true-unreach-call.ufo.UNBOUNDED.pals.c.cnf ../sat2018/20180326_095801070_p_cnf_320_1120.cnf ../sat2018/bz-X-4-7-6.cnf ../sat2018/cms-scheel-md4-families-r24-c8-p2-3-4-5-7-12-16-19.cnf ../sat2018/gto_p60c243.cnf ../sat2018/cz-alt-3-7.cnf ../sat2018/cms-scheel-md4-families-r24-c5-p1-8-9-16-19.cnf ../sat2018/udiv46prop.cnf ../sat2018/ecarev-110-1031-23-40-6.cnf ../sat2018/factoring39916801x54018521.cnf ../sat2018/exams_flat_0.04_2017_9.cnf ../sat2018/TimetableCNFEncoding_16_UNKNOWN.cnf ../sat2018/CNP-5-100.cnf ../sat2018/9-4-9.cnf ../sat2018/satcoin-genesis-SAT-1024.cnf"
mpiexec.hydra --bootstrap slurm ${MPIRUN_OPTIONS} -n ${SLURM_NTASKS} ./hordesat -d=7 -e=1 -fd -c=4 -v=1 -i=1000 -t=600 $instances
echo finished