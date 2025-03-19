#!/bin/bash

foamCleanTutorials

fluent3DMeshToFoam ascii.msh | tee log.meshconvert

mirrorMesh -noFunctionObjects

checkMesh -writeSets | tee log.checkmesh

foamToVTK -faceSet nonOrthoFaces | tee log.foamtovtk1

foamToVTK -pointSet unusedPoints | tee log.foamtovtk2

paraFoam -builtin