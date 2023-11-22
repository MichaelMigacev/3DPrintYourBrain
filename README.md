# 3DPrintYourBrain
### 3D Print Your Brain from T1 weighted MRI data
#### This guide aims to be the complete tutorial on how to get your T1 weighted image from a ".nii.gz" format into a handy ".stl" file format. I have tried my best to make the script run on every OS.
Despite my occasional genius I would not have gotten as far as I did, without the help of people that came before me. So as a responsible developer I think it only tell you check out these repositories as they have assisted my each in their own unique way.
LINK TO THE GITHUB REPOS
#### Used Tools will be:
- Docker Desktop
- Freesurfer
- FSL
- Meshlab
- and a *cool* bash scrip tieing it all together

## Table of Contents
1. Installing Docker Desktop
2. Pulling the Docker Image
3. Downloading the Freesurfer Licence
4. Pulling the Repository
5. Setting up the files
6. Running the container
7. Running/Setting up the script
8. Using Meshlab

### 1. Installing Docker Desktop
See that in the [wiki!](https://github.com/MichaelMigacev/3DPrintYourBrain/wiki#installing-docker-desktop "wiki page")
### 2. Pulling the Docker Image
Image name:
```
michamigacev/printyourbrain
```
Details in [wiki!](https://github.com/MichaelMigacev/3DPrintYourBrain/wiki#pulling-the-docker-image "wiki page")
### 3. Downloading the Freesurfer License
Freesurfer only runs with a license, but fret not! The license is free to obtain. \
[Here](https://surfer.nmr.mgh.harvard.edu/registration.html "link to the license") you can get one!
Make sure to remember where you saved it, it is going to come in handy later.
### 4. Pulling the repository
Create a place on your PC where you want to have the repository\
and pull this repository on your local machine.
```
git clone https://github.com/MichaelMigacev/3DPrintYourBrain
```
### 5. Setting up your files
Because a script will be running it is impoortant to replicate the intended folder structure like this:
```
3DPrintYourBrain
│   README.md
│   LICENSE
│
└───pyb_mount
|   └───Scripts
│       │   Script.sh # this is the script, instructions inside of it!
│     
|   └───subject00X # your subject
|       |
|       └───input # this is where you put your '*****T1w.nii.gz' file
|           |   *****T1w.nii.gz # your T1 image (please replicate the ending or edit the script)
|       └───output # this is where your future output will be
```


