#!/usr/bin/env bash

set -euo pipefail

data=$1

script_dir=$(dirname $(readlink -f $0))
export PATH=$PATH:$script_dir/FlameGraph
perf script -i $data | stackcollapse-perf.pl | flamegraph.pl > $data.svg
echo "see with:"
echo "firefox $data.svg"
