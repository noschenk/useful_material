# SLURM notes

Example file to run R code (after having set up R on the cluster): 
```
#!/bin/sh
#SBATCH --mail-user=<enter email address>
#SBATCH --mail-type=end,fail

#SBATCH --mem-per-cpu=8G
#SBATCH --time=10:00:00
#SBATCH --workdir=.
#SBATCH --job-name="testingR"

# change
#SBATCH --output=R.out
#SBATCH --error=R.err

############################# execute code here################################
module load vital-it
module load R/latest

R CMD BATCH --no-save -no-restore foo.R
```
where `foo.R` is the R file to run.


| code                                                   |      explanation                |
|--------------------------------------------------------|---------------------------------|
| `squeue --user=<your username>`                        |  monitor your job               |
| `sbatch script.sh`                                     |  submit a script                |
| `scp ~/dir/file01 <username>@submit.unibe.ch:<folder>` | upload file to cluster. Run from local.       |
| `scp <username>@submit.unibe.ch:bar/file01 .`          | download files from cluster. Run from local.  |
