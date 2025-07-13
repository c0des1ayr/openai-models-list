#!/usr/bin/env bash

# Using this to keep an updated list of all OpenAI models

# Get all current models available
MODELS=$(curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $API_KEY" https://api.openai.com/v1/models | jq "." | grep id | sed 's/"id": //g' | sort)

# Fix for JSON
MODELS_2=$(printf "$MODELS" | head -c-1)

# At last, print the JSON for the runner to pipe
printf "{\n \"models\": [\n$MODELS_2\n ]\n}" | jq "."
