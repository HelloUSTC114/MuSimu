#!/bin/bash
# source ~/root/bin/thisroot.sh
source ~/Geant4/bin/geant4.sh
source ~/cry_v1.7/setup

cd /home/john/Codes/Simu-build

OutDir=`pwd`/result-PhotonYielding/
mkdir $OutDir   2>/dev/null
OutROOTDir=$OutDir/ROOTOut/
mkdir $OutROOTDir   2>/dev/null

Geant4Out=$OutDir/Geant4Out/
mkdir $Geant4Out   2>/dev/null



for dir in macJohn/PhotonYielding/exe/GDML/*
do
    echo ${dir##*/}
    ReseachDir=${dir##*/}/
    mkdir $OutROOTDir/$ReseachDir 2>/dev/null
    mkdir $Geant4Out/$ReseachDir 2>/dev/null
    
    if [[ -d $dir ]]; then
        echo "Processing Dir: " $ReseachDir
        for file in $dir/*.gdml
        do
            GDMLFileName=`basename $file`
            echo "Processing File: " $GDMLFileName
            mkdir $OutROOTDir/$ReseachDir/$GDMLFileName/ 2>/dev/null
            mkdir $Geant4Out/$ReseachDir/$GDMLFileName/ 2>/dev/null
            
            ./CRTest $file $dir/../../mac/PduPhotonYield.mac $OutROOTDir/$ReseachDir/$GDMLFileName/Process-$1.root $1 2>&1 1>$Geant4Out/$ReseachDir/$GDMLFileName/Process-$1.out
            # if [[ -f $dir/../../mac/PduPhotonYield.mac ]]; then
            #     echo yes
            # fi
            # echo $OutROOTDir/$ReseachDir/$GDMLFileName/Process-$1.root
            # echo `dirname $file`
            # echo `basename $file`
        done
    fi
done