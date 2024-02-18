#!/bin.sh
MODEL=$1

echo '--------------'
echo 'Installing dependencies'
echo '--------------'

apt update
apt install -y curl

echo '--------------'
echo 'Dowloading LLM model'
echo '--------------'

ollama serve &
curl --connect-timeout 5 \
    --max-time 10 \
    --retry 5 \
    --retry-delay 0 \
    --retry-max-time 40 \
    'http://localhost:11434'
ollama pull $MODEL
