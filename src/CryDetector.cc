/**
*   FILE : CRTest/src/CryDetector.cc
*   Brief: Implementation of class CryDetector
*/
#undef __x86_64__

#include "CryDetector.hh"

#include "G4LogicalVolume.hh"

CryDetector::CryDetector()
    : fTotalBox(NULL)
{}

CryDetector::~CryDetector()
{
    delete fTotalBox;
}
