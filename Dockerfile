FROM python:3.6

MAINTAINER jhao104 <j_hao104@163.com>

ENV TZ Asia/Shanghai

#RUN apt update && apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 \
#     libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 \
#     libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 \
#    libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

WORKDIR /usr/src/app
COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/
#RUN python -c 'import pyppeteer; pyppeteer.chromium_downloader.download_chromium()'
COPY . .

EXPOSE 5010

WORKDIR /usr/src/app/cli

ENTRYPOINT [ "sh", "start.sh" ]
