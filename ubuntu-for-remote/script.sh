#!/bin/bash

sudo apt update
sudo snap install btop
sudo apt upgrade -y

sudo apt install -y build-essential \
  gcc \
  g++ \
  gdb \
  clang \
  make \
  ninja-build \
  cmake \
  autoconf \
  automake \
  locales-all \
  dos2unix \
  rsync \
  tar \
  python \
  python-dev \
  valgrind \
  llvm-9 \
  linux-tools-$(uname -r)

sudo sh -c 'echo 1 >/proc/sys/kernel/perf_event_paranoid'
sudo sh -c 'echo 0 >/proc/sys/kernel/kptr_restrict'
sudo sh -c 'echo kernel.perf_event_paranoid=1 >> /etc/sysctl.d/99-perf.conf'
sudo sh -c 'echo kernel.kptr_restrict=0 >> /etc/sysctl.d/99-perf.conf'
sudo sh -c 'sysctl --system'

