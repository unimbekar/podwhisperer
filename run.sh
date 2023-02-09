#!/bin/bash
#
export AWS_DEFAULT_REGION=us-east-1
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

aws cloudformation deploy --template ./whisper-image/template.yaml --stack-name whisper-image --tags file://./common-tags.json --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND

export REPOSITORY_URI=$(aws cloudformation describe-stacks --stack-name whisper-image --query "Stacks[0].Outputs[?ExportName=='whisper-model-image-repository-uri'].OutputValue" --output text )

