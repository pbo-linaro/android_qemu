#!/usr/bin/env bash

set -euo pipefail

data=$1
time_ms=$(perf report -i $data --stdio --header-only | grep duration | sed -e 's/.*: //' -e 's/\..*//')
time_s=$((time_ms / 1000))
min=$((time_s / 60))
sec=$((time_s % 60))
echo "${min}m, ${sec}s (total ${time_s}s)"
perf report -i $data -g none --stdio | grep -v '^#' | head -n 30
