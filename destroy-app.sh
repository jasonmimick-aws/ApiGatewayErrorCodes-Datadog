#!/usr/bin/env bash

STACK_NAME="${1:-"DatadogSimpleApiGateway"}"
STACK_TEMPLATE="${2:-"sample-application-cfn.yml"}"
echo "Welcome to ${STACK_NAME} deployment!"
echo "We are initiating DESTROY for ${STACK_TEMPLATE} right now.."

aws cloudformation delete-stack \
--debug \
--stack-name "${STACK_NAME}" \
#--template-body file://"${STACK_TEMPLATE}" \
#--capabilities CAPABILITY_IAM


