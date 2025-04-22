FROM python:3.11-slim

# Install build tools and Lektor
RUN apt-get update && apt-get install -y build-essential git && \
    pip install lektor && \
    apt-get clean

# Set workdir
WORKDIR /scummvm-web

# Copy source code into the container
COPY . .

# Expose Lektor's default port
EXPOSE 5000

# Run Lektor's local server
CMD ["lektor", "server", "-h", "0.0.0.0", "-p", "5000"]
