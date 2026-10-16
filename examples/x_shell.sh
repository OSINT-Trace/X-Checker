#!/usr/bin/env bash

# Verify by username or email
curl --request POST \
  --url https://api.osinttrace.com/v1/check/x \
  --header 'x-osint-key: YOUR_OSINT_KEY' \
  --header 'Content-Type: application/json' \
  --data '{"input":"target_handle"}'

# Or verify by phone number (E.164 format)
# curl --request POST \
#   --url https://api.osinttrace.com/v1/check/x \
#   --header 'x-osint-key: YOUR_OSINT_KEY' \
#   --header 'Content-Type: application/json' \
#   --data '{"input":"+14155552671"}'

# Alternative (API.Market):
# curl --request POST \
#   --url https://prod.api.market/api/v1/osint-trace-1/x-checker/check/x \
#   --header 'X-Api-Key: YOUR_API_KEY' \
#   --header 'Content-Type: application/json' \
#   --data '{"input":"target_handle"}'

# Alternative (RapidAPI):
# curl --request POST \
#   --url https://x-checker.p.rapidapi.com/check \
#   --header 'x-rapidapi-host: x-checker.p.rapidapi.com' \
#   --header 'x-rapidapi-key: YOUR_RAPIDAPI_KEY' \
#   --header 'Content-Type: application/json' \
#   --data '{"input":"target_handle"}'