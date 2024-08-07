#!/bin/sh
#
# Copyright (c) 2024 EMSTONE, All rights reserved.
#

set -e

CURDIR=$(cygpath -w $(realpath $(dirname ${0})))
GVSBUILD_DIR=${CURDIR}
DOCKER_DIR=${GVSBUILD_DIR}/docker
DOCKER_DIST=windows
DOCKER_TAG=gvsbuild-${DOCKER_DIST}
DOCKER_GVSBUILD_DIR=$(cygpath -w /c/git/gvsbuild)
DOCKER_GVSBUILD_SRC_VOL=gvsbuild-src
DOCKER_GVSBUILD_SRC_DIR=$(cygpath -w /c/gtk-build/src)
DOCKER_GVSBUILD_TOOLS_VOL=gvsbuild-tools
DOCKER_GVSBUILD_TOOLS_DIR=$(cygpath -w /c/gtk-build/tools)

check_fancy_output() {
  TPUT=/usr/bin/tput
  EXPR=/usr/bin/expr
  if [ "x$TERM" != "xdumb" ] && [ -x $TPUT ] && [ -x $EXPR ] && $TPUT hpa 60 >/dev/null 2>&1; then
    RED=$($TPUT setaf 1)
    YELLOW=$($TPUT setaf 3)
    NORMAL=$($TPUT op)
  else
    RED=""
    YELLOW=""
    NORMAL=""
  fi
}
check_fancy_output

ECHO() {
  echo "${RED}GVSBUILD_:${YELLOW} ${1} ...${NORMAL}"
}

docker_image() {
  ECHO "Build '${DOCKER_TAG}' docker image '${DOCKER_TAG}'"
  docker build \
    -t ${DOCKER_TAG} \
    -f ${DOCKER_DIR}/Dockerfile.${DOCKER_DIST} \
    --no-cache \
    ${DOCKER_DIR}

  docker volume create ${DOCKER_GVSBUILD_SRC_VOL}
  docker volume create ${DOCKER_GVSBUILD_TOOLS_VOL}
}

docker_build() {
  ECHO "Build GVSBuild with docker image '${DOCKER_TAG}'"

  docker run --rm -t \
    --cpu-count ${NUMBER_OF_PROCESSORS} \
    --cpus ${NUMBER_OF_PROCESSORS} \
    --memory 16384m \
    -v ${DOCKER_GVSBUILD_SRC_VOL}:${DOCKER_GVSBUILD_SRC_DIR} \
    -v ${DOCKER_GVSBUILD_TOOLS_VOL}:${DOCKER_GVSBUILD_TOOLS_DIR} \
    -v ${GVSBUILD_DIR}:${DOCKER_GVSBUILD_DIR} \
    ${DOCKER_TAG} ${DOCKER_GVSBUILD_DIR} x86

  docker run --rm -t \
    --cpu-count ${NUMBER_OF_PROCESSORS} \
    --cpus ${NUMBER_OF_PROCESSORS} \
    --memory 16384m \
    -v ${DOCKER_GVSBUILD_SRC_VOL}:${DOCKER_GVSBUILD_SRC_DIR} \
    -v ${DOCKER_GVSBUILD_TOOLS_VOL}:${DOCKER_GVSBUILD_TOOLS_DIR} \
    -v ${GVSBUILD_DIR}:${DOCKER_GVSBUILD_DIR} \
    ${DOCKER_TAG} ${DOCKER_GVSBUILD_DIR} x64
}

docker_console() {
  ECHO "Run console in docker image '${DOCKER_TAG}'"
  winpty docker run --rm -it \
    --cpu-count ${NUMBER_OF_PROCESSORS} \
    --cpus ${NUMBER_OF_PROCESSORS} \
    --memory 16384m \
    --entrypoint cmd \
    -v ${DOCKER_GVSBUILD_SRC_VOL}:${DOCKER_GVSBUILD_SRC_DIR} \
    -v ${DOCKER_GVSBUILD_TOOLS_VOL}:${DOCKER_GVSBUILD_TOOLS_DIR} \
    -v ${GVSBUILD_DIR}:${DOCKER_GVSBUILD_DIR} \
    ${DOCKER_TAG}
}

docker_clear() {
  ECHO "Run clear docker image '${DOCKER_TAG}'"
  docker rmi -f $(docker images -q)
}

help() {
  PROG=$(basename ${0})
  echo "Usage:"
  echo " ${YELLOW}${PROG} ${RED}docker_image ${NORMAL} # Build docker image"
  echo "  ${YELLOW}${PROG} ${RED}docker_build  ${NORMAL} # Build GVSBuild"
  echo "  ${YELLOW}${PROG} ${RED}docker_console  ${NORMAL} # Run docker console"
  echo "  ${YELLOW}${PROG} ${RED}docker_clear  ${NORMAL} # Run docker image clear"
  exit 1
}

[ $# -eq 0 ] && help

hash ${1} &
>/dev/null || help
${1}

exit 0
