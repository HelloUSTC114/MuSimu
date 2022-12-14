/*
 *   File : CRTest/inc/VirtualRecorder.hh
 *   Brief: link Analysis & G4VSensitiveDetector
 *   Description:
 *       Recorder virtual base
 *	John: Base class for a recorder.
 *	Different from VirtualSD, which only records information related to SD, that is hits information
 *	Can record everything user want to recrod
 *	Is called after each step is over
 */

#ifndef CRTest_VirtualRecorder_h
#define CRTest_VirtualRecorder_h
#undef __x86_64__

#include <G4Types.hh>

class G4RootAnalysisManager;
class G4Track;

class VirtualRecorder
{

public:
	VirtualRecorder();
	virtual ~VirtualRecorder();

public:
	static VirtualRecorder *Instance();

	virtual void Reset(){};
	virtual void Print(){};

public: // for class Analysis
	virtual void CreateEntry(
		G4int ntupleID, G4RootAnalysisManager *){};
	virtual void FillEntry(
		G4int ntupleID, G4RootAnalysisManager *){};

	virtual G4bool Record(const G4Track *) { return true; };

protected:
	G4int fFirstColID;

public:
	static VirtualRecorder *fgInstance;
};

#endif /*CRTest_VirtualRecorder_h*/