# Use an official Rust image as the base
FROM rust:latest

# Set the working directory
WORKDIR /app

# Install necessary tools including iptables and bash
RUN apt-get update && apt-get install -y \
    iputils-ping \
    telnet \
    net-tools \
    iproute2 \
    dnsutils \
    curl \
    wget \
    vim \
    nano \
    iptables \
    bash \
    traceroute  # Added traceroute here
# Add a script to generate a random color and set a custom PS1 prompt
RUN echo '#!/bin/bash\n\
COLORS=(31 32 33 34 35 36 37)\n\
RANDOM_COLOR=${COLORS[$RANDOM % ${#COLORS[@]}]}\n\
PS1="\[\033[1;${RANDOM_COLOR}m\]root@\h \[\033[0;37m\]\$\[\033[0m\] "' > /root/.bashrc

# Copy the current directory contents into the container
COPY . .

# Expose necessary ports (adjust as needed)
EXPOSE 4001

# Add a script to apply iptables rules
RUN echo '#!/bin/bash\n\
iptables-restore < /etc/iptables.rules\n\
exec "$@"' > /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Default command for the container
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
