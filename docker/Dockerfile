FROM ollama/ollama:0.1.24

COPY *.sh /scripts/

WORKDIR /scripts
RUN chmod +x *.sh && ls -al  && \ 
        cat ./build.sh && \
        sh ./build.sh

ENTRYPOINT ["/bin/ollama"]

CMD ["serve"]