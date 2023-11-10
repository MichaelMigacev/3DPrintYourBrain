#!/bin/bash

#=========================================================================================

# to make the script runnable:

# 1. Go into the directory of the script, should be home/Scripts

# 2. Activate the bash script by writing:
# chmod +x script.sh
# into your terminal

# 3. Specify the variables (right below this list)

# 4. run by writing:
# ./script.sh sub001 (folder of the subject)
# into your terminal

#==========================================================================================
# 1. Specify variables
#==========================================================================================

# Main folder for the whole project
export MAIN_DIR=/home

# Name of the subject
export subject=$1

# Path to the structural image (input folder)
cd $MAIN_DIR/${subject}/input/
if [ -z "$(find . -maxdepth 1 -name '*T1w.nii.gz*')" ]; then
    gzip struct.nii
fi
export subjT1=$MAIN_DIR/${subject}/input/*T1w.nii.gz

# Path to the subject (output folder)
export SUBJECTS_DIR=$MAIN_DIR/${subject}/output


#==========================================================================================
#2. Create Surface Model with FreeSurfer
#==========================================================================================

mkdir -p $SUBJECTS_DIR/mri/orig
mri_convert ${subjT1} $SUBJECTS_DIR/mri/orig/001.mgz
recon-all -subjid "output" -all -time -log logfile -nuintensitycor-3T -sd "$MAIN_DIR/${subject}/" -parallel

#==========================================================================================
#3. Create 3D Model of Cortical and Subcortical Areas
#==========================================================================================

mkdir $SUBJECTS_DIR/print

mris_convert $SUBJECTS_DIR/surf/lh.pial  $SUBJECTS_DIR/print/lh.stl

mris_convert $SUBJECTS_DIR/surf/rh.pial  $SUBJECTS_DIR/print/rh.stl

cd $SUBJECTS_DIR/mri

for i in 7 8 17 18 46 47 53 54
do
	mri_convert aseg.mgz subcortical$i.nii
	mri_binarize --i subcortical$i.nii --match $i --o bin.nii
	fslmaths subcortical$i.nii -mul bin.nii subcortical$i-c.nii
	fslmaths subcortical$i-c.nii -bin subcortical$i-bin.nii
	mri_tessellate subcortical$i-bin.nii.gz 1 subcortical$i
	mris_convert subcortical$i subcortical$i.stl
	mv rh.subcortical$i.stl $SUBJECTS_DIR/print/subcortical$i.stl
done



