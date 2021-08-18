FROM maven:3-amazoncorretto-11

RUN yum update --security -y
RUN yum install -y git
