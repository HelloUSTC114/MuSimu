#!/bin/bash



source ${ROOTSYS}/bin/thisroot.sh
source ~/Geant4/bin/geant4.sh
source ~/cry_v1.7/setup

cd /home/john/Codes/Simu-build

OutDir=/data/John/result-PhotonYielding-Single/
ExeDir=macJohn/PhotonYielding-SingleStrip/exe/

mkdir $OutDir   2>/dev/null
OutROOTDir=$OutDir/ROOTOut/
mkdir $OutROOTDir   2>/dev/null

Geant4Out=$OutDir/Geant4Out/
mkdir $Geant4Out   2>/dev/null

DoPhotonYielding()
{
    # for dir in `ls ${ExeDir}/GDML/`
    for dir in ${ExeDir}/GDML/*
    do
        # echo ${dir##*/}
        # echo $dir
        ReseachDir=${dir##*/}/
        mkdir $OutROOTDir/$ReseachDir 2>/dev/null
        mkdir $Geant4Out/$ReseachDir 2>/dev/null
        
        echo $(date) >>RunLog.txt
        echo Groove2-$1, Running: $2 >>RunLog.txt
        echo >>RunLog.txt
        
        if [[ -d $dir ]]; then
            echo "Processing Dir: " $ReseachDir
            for file in $dir/*.gdml
            do
                GDMLFileName=`basename $file`
                echo "Processing File: " $GDMLFileName
                mkdir $OutROOTDir/$ReseachDir/$GDMLFileName/ 2>/dev/null
                mkdir $Geant4Out/$ReseachDir/$GDMLFileName/ 2>/dev/null
                
                ./CRTest $file $dir/../../mac/PduPhotonYield.mac $OutROOTDir/$ReseachDir/$GDMLFileName/Process-$1-$2.root $(expr $1 \* $2) 2>&1 1>$Geant4Out/$ReseachDir/$GDMLFileName/Process-$1-$2.out
                # if [[ -f $dir/../../mac/PduPhotonYield.mac ]]; then
                #     echo yes
                # fi
                # echo $OutROOTDir/$ReseachDir/$GDMLFileName/Process-$1.root
                # echo `dirname $file`
                # echo `basename $file`
            done
        fi
    done
}


# export LD_LIBRARY_PATH
for ((i = 0; i < 50; i++)); do
    echo RUN $i begins now -------- >> RunLog.txt
    # DoGroove1 $i &
    # DoGroove2 $i &
    # DoResolution $i 1 &
    # DoResolution $i 2 &
    # DoResolution $i 3 &
    # DoResolution $i 4 &
    
    for (( j = 0; j < 24; j++ ));
    do
        DoPhotonYielding $i $j & >> RunLog.txt
    done
    wait
    echo RUN $i ends now -------- >> RunLog.txt
done
