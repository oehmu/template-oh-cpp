#!/bin/bash

case $1 in
    1)
        whatGenerate="-DminiSim_BUILD_App1EXE:BOOL=true"
        pathWork='../build_Dx64b000v2017'
        #-->logs ouput file names
        logGenerate='log.bs01.Generate'
        logReview='log.bs01.Generate.Dx64b000v2017'
        ;;
    2)
        whatGenerate="-DminiSim_BUILD_App1EXE:BOOL=true"
        pathWork='../build_Dx64b000v2019'
        #-->logs ouput file names
        logGenerate='log.bs01.Generate'
        logReview='log.bs01.Generate.Dx64b000v2019'
        ;;
    -h)
        echo ""
        echo "./bs01_Generate.bash for build_Dx64b000v2017/ [option] "
        echo ""
        echo "  [option]"
        echo "           1 : App1.exe MSVC2017"
        echo "           2 : App1.exe MSVC2019"
        exit
        ;;
    *)
        echo "ERROR: not a valid parameter"
        exit 1
        #print help here
        ;;
esac
echo ">>>>>>>>>>>>>>>>>>>>$1 $whatGenerate<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo ""


#------------------------------------------------------------------------
#-->Input: Define folder where cmake is going to 
#          store the generated solution.

currentPath=$(pwd)
#------------------------------------------------------------------------
#--> BEGIN: GENERATE project
cd $pathWork
pwd
Objetivo="TEST01 cmake Generate solution $pathWork"
echo "#-->BEGIN: $Objetivo"
echo "    ...."

#--> Use CMake to generate VS project(s)

# MSVC2017
if [ "$1" -eq "1" ]; then
    cmake -G "Visual Studio 15 2017 Win64" $whatGenerate .. > $pathWork/$logGenerate
fi

# MSVC2019
if [ "$1" -eq "2" ]; then
    cmake -G "Visual Studio 16 2019" -A x64 $whatGenerate .. > $pathWork/$logGenerate
fi

echo " "
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "[ms] [$DATE] $pathWork - GENERATE {$whatGenerate} for Visual Studio" >> ../manageBuilds/logs/$logReview
echo "#-->END  : $Objetivo"
#--> END: GENERATE project
#------------------------------------------------------------------------
echo ""
#------------------------------------------------------------------------
echo "#--> Any ERRORS in TEST01?"
cat $logGenerate | grep Error*
#------------------------------------------------------------------------
