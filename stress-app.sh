#!/usr/bin/env bash
set -x
API_GATEWAY="${1}"
METHOD="${2:-POST}"
oha -m ${METHOD} -c 10 -q 10 --latency-correction --disable-keepalive "https://${API_GATEWAY}.execute-api.us-east-1.amazonaws.com/call"
