# Advanced informatics

This is a repo for week 7 lab for ecoevo283.

[Home](https://github.com/Javelarb/Advanced_Informatics_2021)

I began by running the code in the BioinformaticsCourse_2021.txt document to build indexed ref genomes.  
I encountered an error where the original CreateSequenceDictionary.jar directory was missing.  
The actualy file location is in /opt/apps/... and not /data/apps/...  

Everything else went smoothly for the DNAS qalignment.  
I just needed to chance the out directory on the samplename variable.

See DNAalignment.sh.  

For the RNA alignment, there were a few issues with the provided code.  
First, the hisat2 command needed curly braces around the input variable.  
Then, a '-o' flag was needed for sorting the bam file.  
Lastly, the output for the sort bam command is not consistent with the next input in the index command.  

See RNAalignment.sh.  

ATACseq went smoothly.  

See ATACalignment.sh
