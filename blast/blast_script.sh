#!/bin/sh
# Slurm options

#SBATCH --mail-user=noelle.schenk@students.unibe.ch
#SBATCH --mail-type=fail,end

#SBATCH --job-name="tracey_blast"

# Other options
#SBATCH --cpus-per-task=4

# Runtime and memory
#SBATCH --mem-per-cpu=10G
#SBATCH --time=04:00:00

# working directory
# %j is the job ID and %a is the array job number (array task ID)
#SBATCH --workdir=.
#SBATCH --output=%j.out
#SBATCH --error=%j.err

############################# execute code here################################ 
# NOTE: blasting is only for molecules <1kbp, if they are longer (and contain some repeats), the result
#  will mostly include alignments of the repeats to every possible genome location. Use minimap2 for 
#  long regions to align.

# load the required modules
module load vital-it
module load Blast/ncbi-blast/latest

# first make a data base
makeblastdb -in /gpfs/homefs/ips/ns12a545/opt_chr2ID/data/EXP_REFINEFINAL1_bppAdjust_cmap_P_EXSERTA_contigs_v1_1_3_fasta_NGScontigs_HYBRID_SCAFFOLD.fasta -dbtype nucl -parse_seqids  
# blast
blastn -db /gpfs/homefs/ips/ns12a545/opt_chr2ID/data/EXP_REFINEFINAL1_bppAdjust_cmap_P_EXSERTA_contigs_v1_1_3_fasta_NGScontigs_HYBRID_SCAFFOLD.fasta -query noelle_find_traceys_qtl.fasta -out results.out
