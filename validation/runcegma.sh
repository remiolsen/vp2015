#! /bin/bash -l
set -e
#SBATCH -A a2012043
#SBATCH -o abyss_cegma.out
#SBATCH -e abyss_cegma.err
#SBATCH -J abyss_cegma.job
#SBATCH -p node -n 4
#SBATCH -t 1-00:00:00
#SBATCH --mail-user remi-andre.olsen@scilifelab.se
#SBATCH --mail-type=ALL
#SBATCH --qos=seqver

module load bioinfo-tools
module load cegma/2.4.010312
export CEGMA="/sw/apps/bioinfo/cegma/2.4.010312/milou/"
export PERL5LIB="$CEGMA/lib"
export WISECONFIGDIR="/sw/apps/bioinfo/wise2/2.2.0/milou/wisecfg/"
cd /gulo/proj_nobackup/a2012043/private/projects/denovo/V.Passoth_13/07-CEGMA/abyss
cegma -o abyss -g V.Passoth_13.scf.dna
