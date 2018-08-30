FROM gcc:7

RUN apt-get update && apt-get install -y \
  gcovr \
  cppcheck \
  vera++ \
  valgrind \
  python2.7 \
  python-pip \
  gcovr \
  git  \
  openjdk-8-jre && \
  apt-get autoremove -y

COPY veraconf /veraconf
RUN chmod -R 777 /veraconf

COPY rats /rats
RUN cd /rats && \
tar -xzvf rats-2.4.tgz  && \
cd rats-2.4  && \
./configure && make && make install && \
cd ~ &&\
rm -r /rats 

ADD https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip sonar-scanner.zip
RUN apt-get install unzip -y && \
unzip sonar-scanner.zip -d /opt/sonar && \
rm  /sonar-scanner.zip

ENV PATH "$PATH:/opt/sonar/sonar-scanner-3.2.0.1227-linux/bin"

COPY sample /sample

RUN echo 'alias ll="ls -l"' >> ~/.bashrc