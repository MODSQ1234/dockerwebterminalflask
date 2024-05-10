# Use the official Ubuntu image as a base
FROM linuxserver/letsencrypt

# Install necessary dependencies
RUN apk add --no-cache \
    wget \
    ca-certificates

# Download and install Python and pip
RUN wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tar.xz && \
    tar -xvf Python-3.9.7.tar.xz && \
    cd Python-3.9.7 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    cd .. && \
    rm -rf Python-3.9.7* && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3.9 get-pip.py && \
    rm get-pip.py

# Set the working directory in the container
WORKDIR /app

# Copy the entire current directory into the container at /app
COPY . /app

# Install pyxtermjs
RUN pip3.9 install -r requirements.txt --no-cache-dir

# Run the pyxtermjs command when the container starts
CMD ["python3.9", "main.py"]
