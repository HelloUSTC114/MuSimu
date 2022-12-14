/**
*   FILE : CRTest/src/ActionRegister.cc
*   Brief: Implementation of class ActionRegister
*/
#undef __x86_64__
#include "ActionRegister.hh"

#include "Generator.hh"
#include "PduGenerator.hh"
#ifdef __LINUX__
#include "CryGenerator.hh"
#endif

#include "RunAction.hh"
#include "EventAction.hh"
#include "StackAction.hh"
#include "TrackingAction.hh"
#include "StepAction.hh"

ActionRegister::ActionRegister()
    : G4VUserActionInitialization()
{}

ActionRegister::~ActionRegister()
{}

void ActionRegister::BuildForMaster() const
{
    SetUserAction(new RunAction);
}

void ActionRegister::Build() const
{
    SetUserAction(new Generator);
    SetUserAction(new RunAction);
    SetUserAction(new EventAction);
    SetUserAction(new StackAction);
	SetUserAction(new TrackingAction);
	SetUserAction(new StepAction);
}