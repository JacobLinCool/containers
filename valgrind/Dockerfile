FROM ubuntu:latest

WORKDIR /home
RUN apt update && apt install -y make g++ valgrind
COPY entry.sh /bin/entry.sh
RUN chmod +x /bin/entry.sh

ENTRYPOINT ["/bin/entry.sh"]
