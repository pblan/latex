FROM debian:latest

# general label stuff
LABEL maintainer="Patrick Gustav Blaneck <patrick.blaneck@rwth-aachen.de>"
LABEL org.opencontainers.image.source="https://github.com/pblan/matse-spicker"
LABEL org.opencontainers.image.title="pblan/matse-spicker"
LABEL org.opencontainers.image.description="Docker image based on Debian to compile LaTeX"
LABEL org.opencontainers.image.documentation="https://github.com/pblan/matse-spicker"
LABEL org.opencontainers.image.licenses="GPLv3"

# Debian specific stuff
ENV DEBIAN_FRONTEND noninteractive

# install basics
RUN apt-get update && apt-get install -y git

# install texlive distribution
RUN apt-get update && apt-get install -y texlive-full latexmk python3-pygments

# using /mnt/ as default working directory
WORKDIR /mnt/

# cleanup
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
