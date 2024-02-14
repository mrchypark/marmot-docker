FROM curlimages/curl AS binary

WORKDIR /temp

RUN curl -L -o marmot.tar.gz https://github.com/maxpert/marmot/releases/download/v0.8.7/marmot-v0.8.7-linux-amd64.tar.gz \
  && tar -xzvf marmot.tar.gz 

FROM gcr.io/distroless/base-debian12
COPY --from=binary /temp/marmot /marmot

CMD [ "/marmot" ]