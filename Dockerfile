FROM ubuntu:18.04
MAINTAINER 0la
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update --fix-missing

RUN apt-get update  && apt-get install alien apt-utils -y
######################################
RUN apt-get update 
RUN apt install --fix-missing -y vim wget ca-certificates xorgxrdp pulseaudio xrdp\
  xfce4 xfce4-terminal xfce4-screenshooter xfce4-taskmanager \
  xfce4-clipman-plugin xfce4-cpugraph-plugin xfce4-netload-plugin \
  xfce4-xkb-plugin xauth supervisor uuid-runtime locales \
  pepperflashplugin-nonfree openssh-server sudo git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev \
  nano netcat xterm curl git unzip  python-pip firefox xvfb \
  python3-pip gedit locate  libxml2-dev libxslt1-dev libssl-dev libmicrohttpd-dev  \
  libmysqlclient-dev byobu locate cron python-pyaudio python3-pyaudio ffmpeg \
  fonts-liberation libappindicator3-1 libfile-basedir-perl libfile-desktopentry-perl libfile-mimeinfo-perl \
  libindicator3-7  libipc-system-simple-perl libnet-dbus-perl libtie-ixhash-perl libx11-protocol-perl \
  libxml-parser-perl libxml-twig-perl libxml-xpathengine-perl xdg-utils  xserver-xephyr jq tor xarchiver
RUN apt-get clean
RUN apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*


ADD etc /etc
ADD addon /root
ADD bin /usr/bin
#ADD init_script /etc/init.d/
#ADD rlater-zoho /root
COPY startup.sh /root/
COPY clean_db.py /root/

######RUN mkdir -p /root/.mozilla/firefox


######RUN mkdir -p ~/.ssh
######RUN rm /etc/ssh/sshd_config
######RUN locale-gen en_US.UTF-8
######RUN cp /root/sshd_config /etc/ssh/
######RUN echo "xfce4-session" > /etc/skel/.Xclients
######RUN cp /root/authorized_keys  ~/.ssh/authorized_keys
######RUN cp /usr/bin/no-ip2.conf /usr/local/etc/no-ip2.conf

######RUN rm -rf /etc/xrdp/rsakeys.ini /etc/xrdp/*.pem
######RUN echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc
######RUN echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" >> ~/.bashrc
######RUN echo "export LC_ALL='en_US.utf8'" >> ~/.bashrc
######RUN echo "alias python=python3" >> ~/.bashrc
######RUN echo "ControlPort 9051\nHashedControlPassword 16:DDA28E1510D3786E60699CD89D361BF41DA855B5ADBC8F4D5DAFD0E8FE\nCookieAuthentication\nRunAsDaemon 1" >> /etc/tor/torrc
######RUN systemctl enable tor
# Add sample user
######RUN update-rc.d tor enable



######RUN pip3 install pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4 selenium  ConfigParser lxml  speechrecognition requests pyvirtualdisplay pydub




# Add sample user
#RUN update-rc.d tor enable
######RUN ssh-keygen -q -t rsa -N '' -f /id_rsa

######RUN echo "root:1" | /usr/sbin/chpasswd
######RUN addgroup uno
######RUN useradd -m -s /bin/bash -g uno uno
######RUN echo "uno:1" | /usr/sbin/chpasswd
######RUN echo "uno    ALL=(ALL) ALL" >> /etc/sudoers
###################################################################################################
##################################################################################################
##################################################################################################
######RUN ls /
# Copy tigerVNC binaries
######ADD tigervnc-1.8.0.x86_64 /
#COPY  tigervnc-1.8.0.x86_64.tar.gz /
#RUN tar xvf tigervnc-1.8.0.x86_64.tar.gz -C /root/
#ADD /root/tigervnc-1.8.0.x86_64 /
# Clone noVNC.
######RUN git clone https://github.com/novnc/noVNC.git $HOME/noVNC

# Clone websockify for noVNCfor noVNC

######Run git clone https://github.com/kanaka/websockify $HOME/noVNC/utils/websockify
######################################
######################################
#########   *  Cron *   #########
######################################
######################################

#RUN wget https://ftp.mozilla.org/pub/firefox/releases/99.0b8/linux-x86_64/en-GB/firefox-99.0b8.tar.bz2
#https://ftp.mozilla.org/pub/firefox/releases/99.0b8/linux-x86_64/en-GB/firefox-99.0b8.tar.bz2
#RUN tar xvf firefox-99.0b8.tar.bz2 -C /root/
#RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
#RUN dpkg -i google-chrome-stable_current_amd64.deb
######################################
######################################
######RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf
######RUN echo "nameserver 8.8.4.4" >> /etc/resolv.conf
######################################



######RUN chmod +x /usr/bin/*


######RUN cp /usr/bin/no-ip2.conf /usr/local/etc/no-ip2.conf


######ADD AZ /root/Desktop








# Docker config


######RUN printf "123123123\n123123123\n\n" | vncpasswd
######
######RUN sed -i 's/@"/@" --no-sandbox/' /opt/google/chrome/google-chrome

######RUN  rm firefox-52.0.1esr.linux-x86_64.sdk.tar.bz2
######RUN  rm google-chrome-stable_current_amd64.deb


######VOLUME ["/etc/ssh"]
######EXPOSE 3389 22 9001 993 7513 1984 1985 1022
CMD ["/bin/bash", "/root/startup.sh"]
