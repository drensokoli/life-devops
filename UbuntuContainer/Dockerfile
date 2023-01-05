FROM ubuntu
LABEL version="1.0"

RUN useradd -m user1
USER user1

WORKDIR /home/user1/

COPY data.sh /tmp/data.sh
RUN /tmp/data.sh

USER root
RUN apt update && apt install --yes python3 curl net-tools iproute2
EXPOSE 8000

USER user1
CMD ["python3", "-m", "https.server", "--directory", "/home/user1"]
