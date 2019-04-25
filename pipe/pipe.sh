#!/usr/bin/env bash
#
# Cloudfront create invalidation
#
# Required globals:
#   AWS_ACCESS_KEY_ID
#   AWS_SECRET_ACCESS_KEY
#   DISTRIBUTION_ID

source "$(dirname "$0")/common.sh"

# mandatory parameters
AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID:?'AWS_ACCESS_KEY_ID variable missing.'}
AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY:?'AWS_SECRET_ACCESS_KEY variable missing.'}
DISTRIBUTION_ID=${DISTRIBUTION_ID:?'DISTRIBUTION_ID variable missing.'}

info "Starting Cloudfront create invalidation..."

run aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION_ID} --paths '/*' 

if [[ "${status}" -eq 0 ]]; then
  success "Create Invalidation successful."
else
  fail "Create Invalidation failed."
fi
