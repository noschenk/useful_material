#!/bin/sh
# Slurm options

# Runtime and memory
#SBATCH --mem-per-cpu=130G
#SBATCH --time=08:00:00
#SBATCH --tmp=8G

############################# execute code here################################ 

module load vital-it
module load UHTS/Analysis/minimap2/2.0rc1

# makeblastdb -in genome.fasta -dbtype nucl -parse_seqids  

minimap2 -a genome.mmi query.fasta > alignment.sam
