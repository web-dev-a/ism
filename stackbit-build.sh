#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e9092a363f2b70019f6c2fb/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e9092a363f2b70019f6c2fb
curl -s -X POST https://api.stackbit.com/project/5e9092a363f2b70019f6c2fb/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e9092a363f2b70019f6c2fb/webhook/build/publish > /dev/null
