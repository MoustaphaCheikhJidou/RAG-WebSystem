# Use the official Python image as the base
FROM python:3.12

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt



# Install basic packages first
RUN pip install --no-cache-dir django==4.2.7 requests==2.31.0 beautifulsoup4==4.12.2 

# Install ML packages separately with longer timeout
RUN pip install --no-cache-dir --timeout=1000 torch

# Install remaining packages
RUN pip install --no-cache-dir faiss-cpu==1.7.4 llama-cpp-python==0.2.90 --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cpu 

# Set the default command to run the Django server
CMD ["python", "/app/myapp/manage.py", "runserver", "0.0.0.0:8000"]
