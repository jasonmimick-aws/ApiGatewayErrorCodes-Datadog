#!/usr/bin/env bash

STACK_NAME="${1:-"DatadogSimpleApiGateway"}"
STACK_TEMPLATE="${2:-"stack.yaml"}"
echo "Welcome to ${STACK_NAME} deployment!"
echo "We are initiating LAUNCH for ${STACK_TEMPLATE} right now.."

aws cloudformation create-stack \
--debug \
--stack-name "${STACK_NAME}" \
--template-body file://"${STACK_TEMPLATE}" \
--capabilities CAPABILITY_IAM


