FROM       docker.io/ansible/ansible-container-builder:0.3
MAINTAINER Samuel Terburg <sterburg@redhat.com>
LABEL      io.k8s.description="Build Docker Images using Ansible Playbook" \
           io.k8s.display-name="Ansible-Container S2I Image" \
           io.openshift.s2i.scripts-url="image:///usr/local/s2i" \
           io.openshift.tags="builder,ansible"

WORKDIR     /tmp/
ENTRYPOINT  /usr/local/s2i/run

COPY        s2i/bin/  /usr/local/s2i/

RUN         pip install ansible-container
USER        1001
