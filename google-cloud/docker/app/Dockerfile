#First specify the base image 
#Contains everything we need already configured to run a python application

From python:3
# We copy just the requirements.txt first to leverage Docker cache
#Next copy the files from our application to our docker image
                  #Docker will copy the image here
COPY ./requirements.txt /app/requirements.txt

WORKDIR app

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENTRYPOINT ["python"]

CMD ["app.py"]

