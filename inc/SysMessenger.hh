/*
 *   File : CRTest/inc/SysMessenger.hh
 *
 *   Brief: Definition of User Interface in G4 session
 *
 *   Interact with RunManager
 *   SysConstruction
 *       Geometry, Material, Limit, ...
 *   CryDetector
 *       Component, ...
 *   Generator
 *       Mode, PrimaryVertex, ...
 *   PhysicsList
 *       Options
 *   Run & Event Action
 *       Data Format
 *
 */
#ifndef CRTest_SysMessenger_h
#define CRTest_SysMessenger_h
#undef __x86_64__

#include "G4UImessenger.hh"
#include <G4String.hh>

class G4RunManager;
class G4UIdirectory;
class G4UIcommand;
class G4UIcmdWithABool;
class G4UIcmdWithAString;
class G4UIcmdWithoutParameter;

class SysMessenger : public G4UImessenger
{
public:
    SysMessenger(G4RunManager *);
    virtual ~SysMessenger();

public:
    virtual G4String GetCurrentValue(G4UIcommand *);
    virtual void SetNewValue(G4UIcommand *, G4String);

private:
    G4RunManager *fRunManager;

    G4UIdirectory *fCRTestDir;
    G4UIdirectory *fGeomDir;
    G4UIdirectory *fGeneratorDir;

    G4UIcmdWithAString *fGeneratorType;
    G4UIcmdWithABool *fTriggerCmd;
    G4UIcmdWithAString *fTiggerRange;

    G4UIcmdWithAString *fGdmlFile;
    G4UIcmdWithAString *fMaterialCmd;
    G4UIcmdWithAString *fSkinCmd;
    G4UIcmdWithoutParameter *fMatSkinDumpCmd;
    G4UIcmdWithoutParameter *fSurfaceDumpCmd;
};

#endif // CRTest_SysMessenger_h