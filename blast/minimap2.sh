#!/bin/sh
# Slurm options

#SBATCH --mail-user=noelle.schenk@students.unibe.ch
#SBATCH --mail-type=fail,end

#SBATCH --job-name="tracey_blast"

# Other options
##SBATCH --cpus-per-task=6

# Runtime and memory
#SBATCH --mem-per-cpu=130G
#SBATCH --time=08:00:00
#SBATCH --tmp=8G

# working directory
# %j is the job ID and %a is the array job number (array task ID)
#SBATCH --workdir=.
#SBATCH --output=%j.out
#SBATCH --error=%j.err

############################# execute code here################################ 

module load vital-it
module load UHTS/Analysis/minimap2/2.0rc1


# makeblastdb -in /gpfs/homefs/ips/ns12a545/opt_chr2ID/data/EXP_REFINEFINAL1_bppAdjust_cmap_P_EXSERTA_contigs_v1_1_3_fasta_NGScontigs_HYBRID_SCAFFOLD.fasta -dbtype nucl -parse_seqids  

minimap2 -a exserta.mmi noelle_find_traceys_qtl.fasta > tracey.sam
