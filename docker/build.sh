#!/bin.sh
MODEL=$1
ollama serve &
sleep 10
ollama pull $MODEL
