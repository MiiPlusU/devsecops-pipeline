# Use a Python base image matching the version on your EC2
FROM python:3.9

# Set environment variables if necessary
ENV HOME=/home/python

# Create and set working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY src/python-app/requirements.txt ./
RUN pip install -r requirements.txt

# Copy the rest of the application
COPY src/python-app .

# Expose the port your application uses (adjust if necessary)
EXPOSE 8000

# Command to run your Python application
CMD ["python", "app.py"]
