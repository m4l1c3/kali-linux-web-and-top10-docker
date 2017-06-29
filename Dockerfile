FROM kalilinux/kali-linux-docker

RUN apt-get update && \
    apt-get install openssh-server -y && \
    update-rc.d -f ssh remove && \
    update-rc.d -f ssh defaults && \
    cd /etc/ssh/ && \
    mkdir insecure_original_default_kali_keys && \
    mv ssh_host_* insecure_original_default_kali_keys/ && \
    dpkg-reconfigure openssh-server && \
    apt-get install kali-linux-web -y \
    gzip -d /usr/share/wordlists/rockyou.txt.gz
