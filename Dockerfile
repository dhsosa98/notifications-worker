FROM python:3.12.6-slim

# Install cron
RUN apt-get update && apt-get -y install cron

# Set working directory
WORKDIR /app

# Copy the Python script
COPY main.py .

# Make the script executable
RUN chmod +x main.py

# Create the cron job file
RUN echo "* * * * * /usr/local/bin/python /app/main.py >> /var/log/cron.log 2>&1" > /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Apply cron job
RUN crontab /etc/cron.d/hello-cron

# Run cron in the foreground
CMD cron && tail -f /var/log/cron.log 