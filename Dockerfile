FROM hashicorp/terraform:0.14.7

RUN wget https://github.com/mercari/tfnotify/releases/download/v0.7.0/tfnotify_linux_amd64.tar.gz -P /tmp
RUN tar zxvf /tmp/tfnotify_linux_amd64.tar.gz -C /tmp
RUN mv /tmp/tfnotify /bin/tfnotify