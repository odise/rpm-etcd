#!/bin/sh -e

# Copied that one from the CoreOS/etcd repo and modified it.

VER=$1

function build {
  proj=${1}
  ver=${2}

  if [ ! -d ${proj} ]; then
    git clone https://github.com/coreos/${proj}
  fi

  cd ${proj}
  git checkout master
  git fetch --all
  git reset --hard origin/master
  git checkout $ver
  ./build
  cd -
}

function package {
  proj=${1}
  target=${2}

  ccdir="${proj}/bin/${GOOS}_${GOARCH}"
  if [ -d ${ccdir} ]; then
    cp ${ccdir}/${proj}* ${target}
  else
    cp ${proj}/bin/${proj} ${target}
  fi

  cp ${proj}/README.md ${target}/README-${proj}.md
}

mkdir release
cd release

for i in linux; do
  export GOOS=${i}
  export GOARCH="amd64"

  build etcd ${VER}
  build etcdctl ${VER}

  TARGET="etcd-v${VER}-${GOOS}-${GOARCH}"
  mkdir ${TARGET}

  package etcd ${TARGET}
  package etcdctl ${TARGET}

  if [ ${GOOS} == "linux" ]; then
    tar cvvfz ${TARGET}.tar.gz ${TARGET}
  else
    zip -r ${TARGET}.zip ${TARGET}
  fi
done
