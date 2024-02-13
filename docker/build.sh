#!/bin.sh
ollama serve & </dev/null &>/dev/null &
sleep 10
ollama pull llama2
