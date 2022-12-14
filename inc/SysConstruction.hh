/*
 *   File : CRTest/inc/SysConstruction.hh
 *
 *   Brief: Definition of Detector System for simulationi
 *
 *   - Geometry
 *       - Solid
 *       - Logical Volume // Main Detector Object
 *       - Physical Volume // Placement instantce
 *   - Material
 *   - Sensitive Detector
 *   - Magnetic Field
 *   - Visual Attribute
 *   - Messenger
 *   - Limits
 */

#ifndef CRTest_SysConstruction_h
#define CRTest_SysConstruction_h
#undef __x86_64__

#include "G4VUserDetectorConstruction.hh"
#include "G4Types.hh"
class G4LogicalVolume;
class G4UserLimits;

class SysConstruction : public G4VUserDetectorConstruction
{

public:
    SysConstruction();
    virtual ~SysConstruction();

    virtual G4VPhysicalVolume *Construct();
    virtual void ConstructSDandField();

public: // User Interface
    G4bool SetSpacing(G4double);

private:
    // void ConstructMaterial();

protected:
    G4LogicalVolume *fWorld;
    G4LogicalVolume *fDetector;
    G4LogicalVolume *fTarget;

    G4UserLimits *fStepLimit;

private:
    G4double fPosZTarget;
    G4double fPosZDetector;
};

#endif // CRTest_SysConstruction_h
