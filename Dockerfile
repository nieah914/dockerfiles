FROM   ubuntu
ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
RUN ["/bin/bash", "-c", "apt-get -y update"]
RUN ["/bin/bash", "-c", "apt-get -y install pip"]
RUN ["/bin/bash", "-c", "apt-get -y install git"]
RUN ["/bin/bash", "-c", "apt-get -y install vim"]
ARG DEBIAN_FRONTEND=noninteractive
RUN ["/bin/bash", "-c", "apt-get install tzdata"]
RUN unlink /etc/localtime
RUN ["/bin/bash", "-c", "ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime"]
WORKDIR /root/src
RUN ["/bin/bash", "-c", "git clone https://nieah914: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@github.com/nieah914/realestate_crawler.git"]
WORKDIR /root/src/realestate_crawler
RUN ["/bin/bash", "-c", "pip install -r requirement.txt"]
RUN ["/bin/bash", "-c", "pip uninstall -y python-telegram-bot telegram"]
RUN ["/bin/bash", "-c", "pip install python-telegram-bot"]
