# CRTest CMakeLists.txt
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# Setup the project
cmake_minimum_required(VERSION 2.6 FATAL_ERROR)
set(CMAKE_BUILD_TYPE Debug)
project(CRTest)

# Find Geant4 package
find_package(Geant4 REQUIRED ui_all vis_all)
find_package(ROOT REQUIRED COMPONENTS Core)

# Setup include directories for project
include(${Geant4_USE_FILE})
include(${ROOT_USE_FILE})

# Locate source and headers for project
include_directories(${PROJECT_SOURCE_DIR}/inc
#    ${Geant4_INCLUDE_DIR}
	)
file(GLOB sources ${PROJECT_SOURCE_DIR}/src/*.cc)
file(GLOB headers ${PROJECT_SOURCE_DIR}/inc/*.hh)


link_libraries(${Geant4_LIBRARIES}
                ROOT::Core
                ROOT::RIO
                ROOT::Geom
                ROOT::Gpad
                ROOT::Graf3d
                ROOT::Graf
                ROOT::Gui
                ROOT::Hist
                ROOT::MathCore
                ROOT::Matrix
                ROOT::Minuit
                ROOT::Minuit2
                ROOT::Rint
                ROOT::TMVA
                ROOT::Tree
                ROOT::TreeViewer
                ROOT::XMLIO
            )


# Add the executable, and link it to the libraries
add_executable(${PROJECT_NAME} CRTest.cxx ${sources} ${headers})
set(CMAKE_INCLUDE_DIRECTORIES_BEFORE ON)

#add_executable(testJohn testJohn.cpp ${sources} ${headers})

# Add program to the project targets
# add_custom_target(LINK_MAC COMMAND ln -s -f ${PROJECT_SOURCE_DIR}/mac . )
# add_custom_target(LINK_MACJohn COMMAND ln -s -f ${PROJECT_SOURCE_DIR}/macJohn . )
# add_custom_target(RUNSH COMMAND ln -s -f ${PROJECT_SOURCE_DIR}/*.sh . )
# add_dependencies(${PROJECT_NAME} LINK_MAC LINK_MACJohn RUNSH)
