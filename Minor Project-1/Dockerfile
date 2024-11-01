# Use a base image that suits your shell script requirements
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy shell scripts from the host to the container
COPY *.sh ./

# Make the shell scripts executable
RUN chmod +x *.sh

# Define the entry point to execute your main shell script
# CMD ["./user_script.sh"]  # Replace with your main script name
