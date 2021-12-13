FROM selenium/standalone-chrome:latest
USER root
RUN apt-get update && apt-get install python3-distutils -y
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN python3 -m pip install gunicorn
CMD ["gunicorn" , "-b", "0.0.0.0:$PORT", "app:app"]
