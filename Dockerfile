FROM python:3.9

RUN apt-get update && apt-get -y upgrade

# set the working directory
WORKDIR /app
# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy the repository files to it
COPY . /app

# install dependencies listed in the repository's requirements file
RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["main"]
CMD ["server", "start", "main:app", "--host=0.0.0.0"]