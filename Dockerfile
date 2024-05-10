# Use the official Python 3.9 image as a base
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the entire current directory into the container at /app
COPY . /app

# Install pyxtermjs and other dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the pyxtermjs command when the container starts
CMD ["python", "main.py"]
