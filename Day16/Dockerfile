# Use minimal base image
From alpine:latest

#Copy script into container
COPY hello.sh /hello.sh

#Make it executable
RUN chmod +x /hello.sh

#Set default command
CMD ["/hello.sh"]
