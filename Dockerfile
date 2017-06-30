FROM kalilinux/kali-linux-docker

RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -i && \
    apt-get install openssh-server kali-linux-web build-essential nodejs -y && \
    update-rc.d -f ssh remove && \
    update-rc.d -f ssh defaults && \
    cd /etc/ssh/ && \
    mkdir insecure_original_default_kali_keys && \
    mv ssh_host_* insecure_original_default_kali_keys/ && \
    dpkg-reconfigure openssh-server && \
    apt-get install kali-linux-web -y && \
    gzip -d /usr/share/wordlists/rockyou.txt.gz && \
    git clone https://github.com/danielmiessler/SecLists.git && \
    mkdir /root/.config && \
    curl -sLf https://spacevim.org/install.sh | bash && \
    git clone https://github.com/HackerFantastic/Public.git && \
    msfdb init
