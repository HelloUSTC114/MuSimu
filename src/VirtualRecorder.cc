/**
 *   FILE : CRTest/src/VirtualRecorder.cc
 *   Brief: Implementation of class VirtualRecorder
 */
#undef __x86_64__

#include "VirtualRecorder.hh"

#include "G4RootAnalysisManager.hh"
#include "G4Track.hh"

#include "globals.hh"
#include <vector>

VirtualRecorder *VirtualRecorder::fgInstance = NULL;

VirtualRecorder::VirtualRecorder()
	: fFirstColID(-1)
{
}

VirtualRecorder *VirtualRecorder::Instance()
{
	if (!fgInstance)
		fgInstance = new VirtualRecorder;
	return fgInstance;
}

VirtualRecorder::~VirtualRecorder()
{
}
