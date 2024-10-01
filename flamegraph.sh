#!/usr/bin/env bash

set -euo pipefail
set -x

data=$1

export PATH=$PATH:$(pwd)/FlameGraph
perf script -i $data | stackcollapse-perf.pl | flamegraph.pl > $data.svg
