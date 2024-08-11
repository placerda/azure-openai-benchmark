#!/bin/bash

# This script runs a benchmark test using the specified parameters.
# Ensure the following environment variables are set before running the script:
# 
# AOAI_DEPLOYMENT: The deployment name for the benchmark.
# RATE: The rate at which the benchmark should run.
# CONTEXT_TOKENS: The number of context tokens to use.
# MAX_TOKENS: The maximum number of tokens to use.
# RETRY: The number of retries for the benchmark.
# AOAI_ENDPOINT: The endpoint URL for the benchmark.
# DURATION: The duration for which the benchmark should run.
# OPENAI_API_KEY: Your OpenAI API key.
#
# Example command to set environment variables and run the script:
# export AOAI_DEPLOYMENT="your_deployment_name"
# export RATE="your_rate_value"
# export CONTEXT_TOKENS="your_context_tokens_value"
# export MAX_TOKENS="your_max_tokens_value"
# export RETRY="your_retry_value"
# export AOAI_ENDPOINT="your_endpoint_url"
# export DURATION="your_duration_value"
# export OPENAI_API_KEY="your_openai_api_key"
# ./runtest.sh

# Source the parameters file
source benchmark.parameters

# Run the command
python -m benchmark.bench load \
  --deployment $AOAI_DEPLOYMENT \
  --rate $RATE \
  --shape-profile custom \
  --context-tokens $CONTEXT_TOKENS \
  --max-tokens $MAX_TOKENS \
  --retry $RETRY \
  $AOAI_ENDPOINT \
  --duration $DURATION \
  --output-format jsonl \
  --log-save-dir logs/