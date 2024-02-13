FROM ollama/ollama:0.1.24

COPY *.sh /root/

WORKDIR /root
RUN chmod +x ./build.sh && ls -al  && cat ./build.sh && sh ./build.sh

ENTRYPOINT ["/bin/ollama"]

CMD ["serve"]