#!/bin/bash
# test_hook.sh
# Simple script to verify that plasmidr_helper hooks are executing correctly.

echo "[$(date)] Test Hook Executed"
echo "Args: $@"
echo "Env: SOME_VAR=${SOME_VAR}"

# Write to a tmp file for verification if needed
echo "Executed with args: $@" >> /tmp/plasmidr_hook_test.log
