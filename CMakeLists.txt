cmake_minimum_required(VERSION 2.8.9)
project(Compare)

#	Adding compiler optimizations

#SET(CMAKE_C_COMPILER /usr/bin/clang)
#SET(CMAKE_CXX_COMPILER /usr/bin/clang++)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -std=c++14 -msse4.2 -mfma -DNDEBUG")

#	Ckecking for packages

#find_package(GBenchmark REQUIRED)

#	Adding includes & Linking

## You might wanna change that
include_directories(
	"include"
	"ext/iaca-lin64/include"
	"ext/boost.simd/include"
	"ext/boost_1_64_0"
)

## You might wanna change that
link_directories(
	"ext/iaca-lin64/lib"
)
#link_libraries("derp")

#	Adding sources

#	Getting a list of the source directories
file(GLOB SOURCE_DIRS "src__*")

foreach(SRCDIR ${SOURCE_DIRS})
	#	Splitting directory's name into a list that will contain the name of the executable
	string(REPLACE "__" ";" SRCDIR_PARSED ${SRCDIR})
	list(GET SRCDIR_PARSED 1 EXEC_NAME)

	#	Getting sources...
	file(GLOB_RECURSE SOURCES "${SRCDIR}/*.cpp")

	add_executable("prog_${EXEC_NAME}" ${SOURCES})
endforeach(SRCDIR)
