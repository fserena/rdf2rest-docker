FROM alejandrofcarrera/phusion.python
MAINTAINER Alejandro F. Carrera

ENV HOME /usr/lib/rdf2rest

# Create directories & virtual env
RUN virtualenv $HOME/.env
WORKDIR /usr/lib/rdf2rest

RUN pip install git+https://github.com/fserena/rdf2rest.git

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ./my_init.d/ /etc/my_init.d/

CMD ["/sbin/my_init"]

VOLUME ["/usr/lib/rdf2rest"]
