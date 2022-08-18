FROM python:3.9

LABEL name="Docker for QA automatization with RobotFramework"

RUN apt-get update \
    && apt-get install -y xvfb wget ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 \
    libatspi2.0-0 libcups2 libdbus-1-3 libgbm1 libgtk-3-0 libnspr4 libnss3 \
    libxcomposite1 libxkbcommon0 libxrandr2 xdg-utils ntpdate openssl

RUN python3 -m pip install robotframework && pip install robotframework-requests &&  pip install --upgrade robotframework-seleniumlibrary \
    && pip install stringformat && pip install pyyaml && pip install robotframework-pabot && pip install webdrivermanager \
    && pip install robotframework-datadriver

# install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome*.deb \
    && rm google-chrome*.deb \
    && wget -q https://chromedriver.storage.googleapis.com/104.0.5112.79/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && rm chromedriver_linux64.zip \
    && mv chromedriver /usr/local/bin \
    && chmod +x /usr/local/bin/chromedriver 

RUN apt-get update && apt-get -y install google-chrome-stable

RUN chmod 777 /usr/local/bin/chromedriver

CMD ["/scripts/run_suite.sh"]