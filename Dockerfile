# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . /app


# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your app runs on
EXPOSE 5000

# Command to run the application using Gunicorn (production-ready server)
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app.main:app"]
