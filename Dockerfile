# Use the official Ubuntu image as a base
FROM linuxserver/letsencrypt

# Install Python and pip manually
RUN curl -O https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz && \
    tar -xvf Python-3.9.7.tgz && \
    cd Python-3.9.7 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf Python-3.9.7* && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# Set the working directory in the container
WORKDIR /app

# Copy the entire current directory into the container at /app
COPY . /app

# Install pyxtermjs
RUN pip3 install -r requirements.txt --break-system-packages

# Run the pyxtermjs command when the container starts
CMD ["python3", "main.py"]
