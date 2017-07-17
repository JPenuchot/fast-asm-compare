#!/bin/bash
##
## Managing default directories, args etc...

ORIGIN=$(pwd)

DEFAULT_CMAKE_BUILD_DIR=".build"
DEFAULT_BIN_DIR="bin"

# Intel IACA support

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${ORIGIN}/ext/iaca-lin64/lib/
export PATH=${PATH}:${ORIGIN}/ext/iaca-lin64/bin/

CMAKE_BUILD_DIR=${1}
BIN_DIR=${2}

if [ -z "${CMAKE_BUILD_DIR}" ]; then
	CMAKE_BUILD_DIR=${DEFAULT_CMAKE_BUILD_DIR}
fi

if [ -z "${BIN_DIR}" ]; then
	BIN_DIR=${DEFAULT_BIN_DIR}
fi

## Making sure target directories are there

if [ ! -d "$CMAKE_BUILD_DIR" ]; then
  mkdir ${CMAKE_BUILD_DIR}
fi

if [ ! -d "$BIN_DIR" ]; then
  mkdir ${BIN_DIR}
fi

# Cleaning stuff

rm ${BIN_DIR}/*

## *puts on sunglasses*

cd ${CMAKE_BUILD_DIR}

echo
echo "-= Aye let's build =-"
echo

cmake ${ORIGIN}
make
mv prog* ${ORIGIN}/${BIN_DIR}

cd ${ORIGIN}

# Building stuff

EXEC_LIST=$(ls ${BIN_DIR})

for DUMP_EXEC in ${EXEC_LIST}; do
	echo
	echo "=== Building and processing ${DUMP_EXEC}..."

	objdump -dC ${BIN_DIR}/${DUMP_EXEC} > ${BIN_DIR}/${DUMP_EXEC}.asm
	iaca -graph ${BIN_DIR}/${DUMP_EXEC}__ -o ${BIN_DIR}/${DUMP_EXEC}.iaca ${BIN_DIR}/${DUMP_EXEC}
done
