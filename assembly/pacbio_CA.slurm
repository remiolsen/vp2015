#! /bin/bash -l
set -e
#SBATCH -A a2012043
#SBATCH -o pacbio_CA.out
#SBATCH -e pacbio_CA.err
#SBATCH -J pacbio_CA.job
#SBATCH -p node -n 16 -C mem256GB
#SBATCH -t 3-00:00:00
#SBATCH --mail-user remi-andre.olsen@scilifelab.se
#SBATCH --mail-type=ALL
#SBATCH --qos=seqver

source activate DeNovoPipeline
module load bioinfo-tools
module load cabog/8.1
module load AMOS/3.0.0
runCA -p asm -d asm -s asm.spec ec_pacbio.frg
