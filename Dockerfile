# Use the official Debian base image
FROM debian:bullseye-slim

# Set environment variables
ENV GO_TTY_VERSION=1.1.0

# Install necessary packages
RUN apt-get update && apt-get install -y 
    curl 
    git 
    && rm -rf /var/lib/apt/lists/*

# Download and install GoTTY
RUN curl -L "https://github.com/yudai/gotty/releases/download/v${GO_TTY_VERSION}/gotty_linux_amd64" -o /usr/local/bin/gotty 
    && chmod +x /usr/local/bin/gotty

# Expose the port that GoTTY will run on
EXPOSE 8080

# Command to run when the container starts
CMD ["gotty", "--port", "8080", "--title", "GoTTY Terminal", "bash"]
