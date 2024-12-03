# Dockerized VNC Server for Headless VPS Environments
Sometimes, you may want to set up a VNC server on a VPS that lacks a physical display (e.g., no VGA or screen). The goal of this project is to connect your local display to the remote server through VNC, creating a user experience as if you were sitting at the VPS's location. This setup differs from a SOCKS proxy, as it provides full remote desktop access.

To simplify the setup and isolate the environment, this project uses Docker to containerize the VNC server.

# Files and Configuration
This repository contains all the necessary files for setting up the VNC server. Note that the default password for VNC is set to "yourpassword". You can modify it as needed during your setup.

# Docker Commands
Build and run the Docker container using the following commands:

# Build the Docker image
docker build -t vncserver-basic .

# Run the container and map ports
docker run -it --rm -p 5959:5905 vncserver-basic
Important Notes
Port Mapping:

The VNC server runs on port 5905 inside the Docker container.
The VPS's exposed port is mapped to 5959. Ensure your firewall settings allow traffic on this port.
Connecting to the VNC Server:

On macOS: Use the Finder menu Go > Connect to Server..., then enter:
vnc://localhost:5959
Other platforms: Use a VNC client and connect to localhost:5959.

When prompted, use the password yourpassword (or whatever you configured).

# Docker-Specific Configuration:

The VNC server is started with the -localhost no option to allow external connections.
The command tail -f /dev/null ensures the container keeps running even after the VNC session is initialized.
