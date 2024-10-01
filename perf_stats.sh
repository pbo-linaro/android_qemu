#!/usr/bin/env bash

set -euo pipefail

data=$1
erf report -i $data -g none --stdio | grep -v '^#' | head -n 30
