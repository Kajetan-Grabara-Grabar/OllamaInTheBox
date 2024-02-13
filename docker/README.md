Building docker image with dowloaded LLM model

`docker build -t foo --build-arg 'MODEL=bar' PATH/TO/DOCKERFILE`

`docker build -t ollama-mistral --build-arg 'MODEL=mistral" .`
