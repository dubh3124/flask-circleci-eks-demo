FROM python:3.6-alpine

# Create a user
RUN adduser -D demoapp
# Set working directory for the purpose of this Dockerfile
WORKDIR /home/demoapp

# Copy requirements to the app root
COPY Pipfile.lock ./
# install the dependecies
COPY Pipfile Pipfile
RUN pip install pipenv && pipenv install --system --deploy --ignore-pipfile

# Copy the app into our user root
COPY flask_app/ ./flask_app
COPY app.py ./

# Set the user
USER demoapp
CMD ["gunicorn", "-b", "0.0.0.0:5000" , "--access-logfile", "-", "--error-logfile", "-" ,"app:app"]