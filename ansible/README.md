Ansible
=======

Docker-image for å kunne gjøre det enklere å versjonere Ansible i Jenkins.

Based on [walokra/docker-ansible-playbook](https://github.com/walokra/docker-ansible-playbook).

## Hvordan

Selve imaget kjører `ansible-playbook`, så man kan subsidere `ansible-playbook` i terminalen med:

```
docker run --rm -it -v PATH_TO_LOCAL_PLAYBOOKS_DIR:/ansible/playbooks navikt/ansible-playbook PLAYBOOK_FILE
```


### Shell-script

For å gjøre det enklere for Jenkins, og andre byggeverktøy, kan det være kjekt å pakke alt inn i et shell-script.

Eksempel script:
```
#!/bin/bash
docker run --rm -it \
  -v /var/log/ansible/ansible.log \
  -v /var/lib/jenkins/.ssh:/home/jenkins/.ssh \
  -v "$(pwd)"/naisible:/ansible/playbooks \
  -v "$(pwd)"/nais-inventory:/ansible/inventory \
  -e F5_USER \
  -e F5_PASSWORD \
  navikt/ansible-playbook "$@"
```

Eksempel kjøring:
```
./ansible-playbook -i inventory/cluster playbooks/playbbook.yaml
```

## Bygging

Bygges manuelt, og Ansible-versjon spesifiseres i Dockerfile. Bruker både `latest` og versjon-tagg av images.

```
docker build -t navikt/ansible-playbook -t navikt/ansible-playbook:<version> .
```

```
docker push navikt/ansible-playbook && docker push navikt/ansible-playbook:<version>
```
