#!/usr/bin/env bash
set -x
#API_GATEWAY="${1}"
API_GATEWAY=$(aws cloudformation describe-stacks --region us-east-1 --stack-name DatadogSimpleApiGateway | \
jq -r '.Stacks[0].Outputs[] | select(.OutputKey=="apiGatewayId") | .OutputValue')
HTTP_METHOD="${2:-POST}"
echo "Running stress test with HTTP_METHOD=${HTTP_METHOD} on APIGATEWAY=${API_GATEWAY}"
oha -m ${HTTP_METHOD} -c 10 -q 10 --latency-correction --disable-keepalive "https://${API_GATEWAY}.execute-api.us-east-1.amazonaws.com/call"
