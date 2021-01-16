# ┌──────────────────────────────────────────────────────────────────┐
# │            Define Cmake Version + main project                   │
# └──────────────────────────────────────────────────────────────────┘
cmake_minimum_required(VERSION 3.13.0 FATAL_ERROR)

#main project name, e.g. in VS is a .sln file
project(mainCodetemplate)
# Set version number
set(VERSION_MAJOR "0")
set(VERSION_MINOR "1")
set(VERSION_PATCH "1b")
set(VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")
set(VERSIONApp1 "${VERSION}" CACHE STRING "VERSIONApp1")

# ┌──────────────────────────────────────────────────────────────────┐
# │                    Include targets                               │
# └──────────────────────────────────────────────────────────────────┘
#BEGIN: [oehmu]
	#->.exe  Targets Project called gfApp1e="App1"
	#        MAIN APPLICATION called App1
	if(miniSim_BUILD_App1EXE)
		add_subdirectory(src/App1)
	endif(miniSim_BUILD_App1EXE)
#END: [oehmu]