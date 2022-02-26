Alfbot

FROM alfreedo/alfbot:latest

RUN git clone $GITHUB_REPO_URL /root/WhatsAsena
WORKDIR /root/Alfbot/
ENV TZ=Europe/Istanbul
RUN npm install supervisor -g
RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies
RUN npm install

CMD ["node", "bot.js"]