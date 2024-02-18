#!/bin.sh
MODEL=$1
ollama serve &
curl --connect-timeout 5 \
    --max-time 10 \
    --retry 5 \
    --retry-delay 0 \
    --retry-max-time 40 \
    'http://your_urlhttp://localhost:11434'
ollama pull $MODEL
