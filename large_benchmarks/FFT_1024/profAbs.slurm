#!/bin/bash
#SBATCH --time=72:00:00
#SBATCH --partition=soc-kp
#SBATCH --account=soc-kp
#SBATCH -N 1 
#SBATCH -J fftprofAbs_1024pt_sat_abs-serial-sim
#SBATCH -o fftprofAbs_1024pt_sat-abs-serial-sim.log
#SBATCH -e fftprofAbs_1024pt_sat-abs-serial-sim.log
#set CC=/uufs/chpc.utah.edu/sys/installdir/gcc/5.4.0/bin/gcc
#set CXX=/uufs/chpc.utah.edu/sys/installdir/dcc/5.4.0/bin/g++
source /uufs/chpc.utah.edu/common/home/u1014840/local_python3.8


fname="fft_1024pt_sat.txt"

set -x

for depth in {8..25}
do
	echo "$depth"
	python3 ../../src/satire.py --std --file $fname --enable-abstraction --mindepth ${depth} --maxdepth ${depth} --logfile fix_${depth}.log --outfile fix_${depth}.txt
done
exit
