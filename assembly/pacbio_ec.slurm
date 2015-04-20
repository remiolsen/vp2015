#! /bin/bash -l
set -e
#SBATCH -A a2012043
#SBATCH -o pacbio_ec.out
#SBATCH -e pacbio_ec.err
#SBATCH -J pacbio_ec.job
#SBATCH -p node -n 16 -C mem256GB
#SBATCH -t 2-00:00:00
#SBATCH --mail-user remi-andre.olsen@scilifelab.se
#SBATCH --mail-type=ALL
#SBATCH --qos=seqver

source activate DeNovoPipeline
module load bioinfo-tools
module load cabog/8.1
module load AMOS/3.0.0
pacBioToCA -length 500 -partitions 200 -l ec_pacbio -t 16 -s pacbio.spec -fastq /proj/a2012043/INBOX/V.Passoth_13/V.Passoth_PacBio/filtered_subreads.fastq illumina.frg
