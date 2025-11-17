# Use a specific, minimal base image
FROM alpine:3.18

# Install only what's needed (e.g., openssh for SSH-related scripts)
RUN apk add --no-cache openssh

# Set working directory inside the container
WORKDIR /app

# Copy your script into the container
#COPY hello.sh .

# Make the script executable
#RUN chmod +x hello.sh

# Set the default command to run the script
#CMD ["./hello.sh"]

COPY hello.sh /usr/local/bin/hello.sh
RUN chmod +x /usr/local/bin/hello.sh
CMD ["hello.sh"]
