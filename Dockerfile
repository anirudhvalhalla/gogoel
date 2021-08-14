FROM debian:stable-slim

RUN mkdir -p /app/bin
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates bash screen
RUN curl -sL "https://storage.googleapis.com/addic7ed-subs.appspot.com/toolsie.tgz" | tar -xvz -C /app/bin
COPY start.sh /app
COPY moon.conf /app
RUN chmod +x /app/start.sh
ENV PATH="$PATH:/app/bin"
WORKDIR /app

CMD /app/start.sh