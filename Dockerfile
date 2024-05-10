# Use the official Ubuntu image as a base
FROM linuxserver/letsencrypt

# Install necessary dependencies
RUN apk add --no-cache \
    wget \
    ca-certificates \
    openssl

# Download and install Python
RUN wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tar.xz && \
    tar -xvf Python-3.9.7.tar.xz && \
    cd Python-3.9.7 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf Python-3.9.7* && \
    python3 -m ensurepip

# Set the working directory in the container
WORKDIR /app

# Copy the entire current directory into the container at /app
COPY . /app

# Install pyxtermjs
RUN pip3 install -r requirements.txt --no-cache-dir

# Run the pyxtermjs command when the container starts
CMD ["python3", "main.py"]
