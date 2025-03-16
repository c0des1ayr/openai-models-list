#!/usr/bin/env bash

# Using this to keep an updated list of all OpenAI models

# Get all current models available
MODELS=$(curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $API_KEY" https://api.openai.com/v1/models | jq "." | grep id | sed 's/"id": //g' | sort)

# Count number of characters (minus one)
CHAR_COUNT=$(printf "$MODELS" | wc -m)
FINAL_COUNT=$(( $CHAR_COUNT - 1))

# Fix for JSON
MODELS_2=$(printf "$MODELS" | head -c$FINAL_COUNT)

# At last, print the JSON for the runner to pipe
printf "{\n \"models\": [\n$MODELS_2\n ]\n}" | jq "."