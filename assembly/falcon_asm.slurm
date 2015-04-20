#! /bin/bash -l
set -e
#SBATCH -A a2012043
#SBATCH -o falcon_asm.out
#SBATCH -e falcon_asm.err
#SBATCH -J falcon_asm.job
#SBATCH -p node -n 16
#SBATCH -t 2-00:00:00
#SBATCH --mail-user remi-andre.olsen@scilifelab.se
#SBATCH --mail-type=ALL
#SBATCH --qos=seqver
source activate DeNovoPipeline
cd /proj/a2012043/private/nobackup/projects/denovo/V.Passoth_13/04-pacbio/falcon
~/anaconda/envs/DeNovoPipeline/bin/falcon_overlap.py --min_len 4000 --n_core 15 --d_core 1 /proj/a2012043/INBOX/V.Passoth_13/V.Passoth_PacBio/corrected.fasta > preads.ovlp
~/anaconda/envs/DeNovoPipeline/bin/falcon_asm.py preads.ovlp /proj/a2012043/INBOX/V.Passoth_13/V.Passoth_PacBio/corrected.fasta
