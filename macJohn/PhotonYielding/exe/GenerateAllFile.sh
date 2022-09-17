#!/bin/bash

echo "[workDir(\`pwd\`)] [srcDir(workDir/../src)]"

workDir=`pwd`
srcDir=$workDir/../src/

if [[ $# -ge 2 ]]; then
    workDir=$1
    srcDir=$2
fi

rm -rf $workDir/GDML 2> /dev/null
mkdir $workDir/GDML 2> /dev/null

# Generate Depth research gdml files for double grooves
subDir=$workDir/GDML/DepthDouble
rm -rf $subDir 2> /dev/null
mkdir $subDir 2> /dev/null
echo Generating :Folder: $subDir

for offset in 1 2 3 4 5
do
    for depth in 1.4 1.6 1.8 2.0 2.2 2.4
    do
        echo
        filename=Omega-EJ-Double-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
        echo $filename
        $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Omega EJ Double
        
    done
done




# Generate Depth research gmdl files for double grooves
subDir=$workDir/GDML/DepthSingle
rm -rf $subDir 2> /dev/null
mkdir $subDir 2> /dev/null
echo Generating :Folder: $subDir

for offset in 1
do
    for depth in 1.4 1.6 1.8 2.0 2.2 2.4
    do
        echo
        filename=Omega-EJ-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
        echo $filename
        $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Omega EJ Single
        
        echo
        filename=Round-EJ-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
        echo $filename
        $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Round EJ Single
        
    done
done



# Generate Single/EJ/Omega research gdml files

subDir=$workDir/GDML/Structure-Coupling-GrooveShape
rm -rf $subDir 2> /dev/null
mkdir $subDir 2> /dev/null
echo Generating :Folder: $subDir

depth=1.8
offset=1

# Single
echo
filename=Omega-Air-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
echo $filename
$workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Omega Air Single

echo
filename=Omega-EJ-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
echo $filename
$workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Omega EJ Single

echo
filename=Round-Air-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
echo $filename
$workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Round Air Single

echo
filename=Round-EJ-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
echo $filename
$workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Round EJ Single



for offset in 1 2 3 4 5
do
    for depth in 1.8
    do
        
        # Double
        echo
        filename=Omega-Air-Double-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
        echo $filename
        $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Omega Air Double
        
        echo
        filename=Omega-EJ-Double-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
        echo $filename
        $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Omega EJ Double
        
        echo
        filename=Round-Air-Double-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
        echo $filename
        $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Round Air Double
        
        echo
        filename=Round-EJ-Double-Width-1.2mm-Depth-${depth}mm-OmegaGap-0.6mm-Offset-${offset}mm.gdml
        echo $filename
        $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth 0.6 $offset Round EJ Double
        
        
        
    done
done


# Generate Groove Gap research files for single groove

subDir=$workDir/GDML/OmegaGap
rm -rf $subDir 2> /dev/null
mkdir $subDir 2> /dev/null
echo Generating :Folder: $subDir

offset=1
depth=1.8

for omegaGap in 0.2 0.4 0.6 0.8 1.0 1.2
do
    echo
    filename=Omega-EJ-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-${omegaGap}mm-Offset-${offset}mm.gdml
    echo $filename
    $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth ${omegaGap} $offset Omega EJ Single
done


# Generate Bar length research files for double groove

subDir=$workDir/GDML/BarLength
rm -rf $subDir 2> /dev/null
mkdir $subDir 2> /dev/null
echo Generating :Folder: $subDir

offset=1
depth=1.8
omegaGap=0.6

for barLength in 100 200 300 400 500 600 700 800 900 1000
do
    echo
    filename=Omega-EJ-Single-Width-1.2mm-Depth-${depth}mm-OmegaGap-${omegaGap}mm-Offset-${offset}mm-BarLength-${barLength}mm.gdml
    echo $filename
    $workDir/ExecFolder/GenerateGDML.sh $subDir/$filename $srcDir 1.2 $depth ${omegaGap} $offset Omega EJ Single ${barLength}
    
done

