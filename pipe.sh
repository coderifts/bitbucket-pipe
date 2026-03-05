#!/bin/bash
set -e

CODERIFTS_API_KEY=${CODERIFTS_API_KEY:?'CODERIFTS_API_KEY variable missing.'}
BASE_BRANCH=${BASE_BRANCH:-main}
FAIL_ON_BREAKING=${FAIL_ON_BREAKING:-true}

npm install -g coderifts@latest
coderifts check --base "$BASE_BRANCH" --fail "$FAIL_ON_BREAKING"
