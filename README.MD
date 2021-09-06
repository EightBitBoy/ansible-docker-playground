# ansible-docker-playground

This is a fork of https://github.com/shellwhale/ansible-docker-playground.

## Requirements
* A working docker installation.

## Starting the containers
* Clone the repository.
* Open the repository folder in a shell or command line window.
* Execute the command `docker-compose up`.

## Connecting to the ansible control node

## Example Commands
* ansible all -m ping
* ansible all -a "/bin/echo hello"

## Hints
* 

Start the containers by running the following snippet in your terminal :


```bash
docker exec -it ansible-docker-playground_ansible_1 /bin/bash
```

Then you can try to ssh into the others containers (such as web or db) with the following snippets

```bash
ssh web
```

You can add/modify playbooks inside the shared-folder of this repository, it's a volume that's mounted at /shared-folder in the ansible container. This folder should be your workplace, place your inventory, templates etc in it and run your playbooks from it.
```bash
cd /shared-folder
ansible-playbook playbook.yml -i inventory.ini
```

---

If you do any change to the Dockerfiles, don't forget to build the containers again
```bash
docker-compose build
```


## Excample Commands
ansible all -m ping
ansible all -a "/bin/echo hello"

## Execute playbook
ansibe-playbook file.yml
