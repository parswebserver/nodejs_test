FROM node:14

RUN apt-get update
RUN apt install -y apt-utils
RUN apt-get update
RUN apt -y install tzdata

RUN apt install -y apt-utils \
                   gcc \
                   pkg-config \
                   git \
                   wget \
                   ftp \
                   curl \
                   nano \
                   vim



# Create app directory
WORKDIR /app


COPY . /app

#RUN rm -rf /app/Dockerfile

RUN npm install
RUN npm run --if-present build

EXPOSE 3000

CMD ["npm", "start"]