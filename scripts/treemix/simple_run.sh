#!/bin/bash
# generic submission file to configure for SGE
# Beginning of SGE Options (all options begin with '#$')
# Define shell to use for this job (/bin/sh here)
#$ -S /bin/sh
# Job name
#$ -N vitis_treemix
# Using current working directory (otherwise, you will have to use '#$ wd /path/to/run')
#$ -cwd
# job time limits (h_rt is required [s_rt == software time limit / h_rt == hardware time limit])
# time limit on small.q is 10:00:00
#$ -l s_rt=99:00:00
#$ -l h_rt=99:01:00
# choose to run on a specific queue
# (qconf -sql (to list queues) qconf -sq queue_name (to print informations on this queue))
#$ -q long.q
# Get a mail when the job begins, ends or is suspended
#$ -m ebs
#$ -M thomas.huber@evobio.eu
# Redirects the standard output to the named file.
#$ -o clusterlog/trmx_01
##$ -e clusterlog/pn_std.err
# merge standard and error outputs
#$ -j y
# choose a parallel environment and run on 60 slots (use $PE_HOSTFILE)
#$ -pe mpi 10
# Export all my environment variables into job runtime context
#$ -V
# other interesting options : -t n (for n tasks array), -sync y (to wait until job is finished),
# -v PATH (to export only PATH variable))
# ...
## for more informations "man qsub"

#you could export/change some environment variables before
#export LD_LIBRARY_PATH=/usr/lib64/:$LD_LIBRARY_PATH


TRMX="/home/thuber/softwares/treemix/treemix-1.13/src/treemix"
DATA="data/real_data/vitis/treemix/vitis_treemix.txt.gz"
$TRMX -i $DATA -root vitisusa2 -m 3 -o data/real_data/vitis/treemix/out1