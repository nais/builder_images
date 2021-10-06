Ansible
=======

Docker-image for å kunne gjøre det enklere å versjonere Ansible i Jenkins.

Based on [walokra/docker-ansible-playbook](https://github.com/walokra/docker-ansible-playbook).

## Hvordan

Selve imaget kjører `ansible-playbook`, så man kan bytte `ansible-playbook` i terminalen med:

```
docker run --rm -it -v PATH_TO_LOCAL_PLAYBOOKS_DIR:/ansible/playbooks navikt/naisible-playbook PLAYBOOK_FILE
```


### Shell-script

For å gjøre det enklere for byggeverktøy, kan det være kjekt å pakke alt inn i et shell-script.

Eksempel script:
```
#!/bin/bash
docker run --rm -it \
  -v /var/log/ansible/ansible.log \
  -v /var/lib/github-runner/.ssh:/home/github-runner/.ssh \
  -v "$(pwd)"/naisible:/ansible/playbooks \
  -v "$(pwd)"/nais-inventory:/ansible/inventory \
  -e F5_USER \
  -e F5_PASSWORD \
  navikt/naisible-playbook "$@"
```

Eksempel kjøring:
```
./naisible-playbook -i inventory/cluster playbooks/playbook.yaml
```

## Bygging

Kjør 
```
docker login ghcr.io -p <PAT>
make
```

Image lastes opp til ghcr.io/nais/naisible-playbook
