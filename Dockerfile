FROM python:3.10-slim-buster

# Inside Container
# Make new folder inside container
# Set the working directory in the container
WORKDIR /app

# Outside container -> Inside container
# Copy the current directory contents into the container at /app
COPY . /app

# Inside container
# Install any needed packages specified in requirements.txt
RUN pip3 install -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Set environment variables
# Inside container and remain when container is running
# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["python", "app.py"]
