#!/bin/bash
#
# SLURM resource specifications
# (use an extra '#' in front of SBATCH to comment-out any unused options)
#
#SBATCH --job-name=4_15binary_10   # shows up in the output of 'squeue'
#SBATCH --time=11:59:59       # specify the requested wall-time
#SBATCH --partition=astro_short  # specify the partition to run on
#SBATCH --nodes=3               # number of nodes allocated for this job
#SBATCH --ntasks-per-node=20    # number of MPI ranks per node
#SBATCH --cpus-per-task=1       # number of OpenMP threads per MPI rank
##SBATCH --exclude=<node list>  # avoid nodes (e.g. --exclude=node786)
#SBATCH -o test_out                                                                                                                                          
#SBATCH -e test_err    


# Load default settings for environment variables
source /users/software/astro/startup.d/modules.sh

# If required, replace specific modules
# module unload intelmpi
# module load mvapich2

# When compiling remember to use the same environment and modules


EXE="PG_AccSpin"
###EXE="Gadget2_SynchDt"                                                      
### ARGS is optional. If you don't need it simply leave it empty. YOU ALWAYS NEEd THIS ONE                   
ARGS="/groups/astro/sophies/gadget2/paramterfiles/4_15binary_10.tex"
### INFILE = 1 when restarting gadget from restart files, nothing when you start with IC                     
INFILE=""



# Execute the code
srun  $EXE $ARGS $INFILE