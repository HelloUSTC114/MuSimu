/**
*   FILE : CRTest/src/TrackingAction.cc
*   Brief: Implementation of class TrackingAction
*/
#undef __x86_64__

#include "TrackingAction.hh"

#include "Analysis.hh"

TrackingAction::TrackingAction()
{}

TrackingAction::~TrackingAction(){
	G4cout << "[-] INFO - TrackingAction deleted. " << G4endl;
}

void TrackingAction::PreUserTrackingAction(const G4Track* theTrack){

}

void TrackingAction::PostUserTrackingAction(const G4Track* theTrack){

}