FROM maven:3-amazoncorretto-11

RUN yum update --security -y
RUN yum install -y git jq unzip
RUN curl -LO "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip"
RUN unzip ./aws-sam-cli-linux-x86_64.zip -d sam-installation
RUN ./sam-installation/install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN . ~/.nvm/nvm.sh && nvm install 12 && nvm alias default 12
ENV PATH="${PATH}:/root/.nvm/versions/node/v12.22.12/bin"
RUN curl https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq