FROM       docker.io/ansible/ansible-container-builder:0.3
MAINTAINER Samuel Terburg <sterburg@redhat.com>
LABEL      io.k8s.description="Build Docker Images using Ansible Playbook" \
           io.k8s.display-name="Ansible-Container S2I Image" \
           io.openshift.s2i.scripts-url="image:///usr/local/s2i" \
           io.openshift.tags="builder,ansible"

WORKDIR     /tmp/
ENTRYPOINT  /usr/local/bin/run

COPY        bin/  /usr/local/bin/

RUN         pip install ansible-container==0.9.0.0
USER        1001
