FROM kalilinux/kali-linux-docker

RUN apt-get update && \
    apt-get install kali-linux-web kali-linux-pwtools kali-linux-top10 -y