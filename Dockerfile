FROM gcc

RUN apt-get update && apt-get install -y \
  gcovr \
  cppcheck \
  vera++ \
  valgrind \
  python2.7 \
  python-pip \
  gcovr \
  openjdk-8-jre && \
  apt-get autoremove -y

RUN wget http://downloads.sourceforge.net/project/expat/expat/2.0.1/expat-2.0.1.tar.gz  && \
tar -xvf expat-2.0.1.tar.gz && \
cd expat-2.0.1 && \
./configure && make && sudo make install

RUN wget https://rough-auditing-tool-for-security.googlecode.com/files/rats-2.4.tgz  && \
tar -xzvf rats-2.4.tgz  && \
cd rats-2.4  && \
./configure && make && sudo make install  
