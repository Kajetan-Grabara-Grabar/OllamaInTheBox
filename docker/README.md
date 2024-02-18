Building docker image with dowloaded LLM model

`docker build -t foo --build-arg 'MODEL=bar' PATH/TO/DOCKERFILE`

`docker build -t ollama-mistral --build-arg "MODEL=mistral" .`

Running docker image

`docker run -d -p 11434:11434 --name bar foo`

`docker run -d -p 11434:11434 --name ollama-mistral ollama-mistral`