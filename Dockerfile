# Use a lightweight base image
FROM debian:12

# Install essential components
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tigervnc-standalone-server tigervnc-common \
    xvfb \
    firefox-esr \
    xauth \
    && apt-get clean

RUN apt-get update && apt-get install -y \
    dbus \
    x11-xserver-utils \
    libdbus-1-3 \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# Install required dependencies including X11 and dbus-x11
RUN apt-get update && apt-get install -y \
    libx11-6 \
    libx11-dev \
    dbus-x11 \
    && rm -rf /var/lib/apt/lists/*

# Expose the default VNC port
EXPOSE 5905

# Start with a basic shell
#CMD ["/bin/bash"]
# Set up VNC password and start VNC server
CMD mkdir -p /root/.vnc && \
    echo "yourpassword" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd && \
    export DISPLAY=:5 && \
    vncserver :5 -geometry 1280x1024 -depth 24 -localhost no &&\
    tail -f /dev/null  # Keeps the container running

