# docker_ansible

This Dockerfile provides a Ansible Container, mapping your ansible directory (roles, inventory, playbooks) 
and your $SSH_AUTH_SOCK inside the container to push ansible playbooks through the container from your local machine.

# How to use it

You can pull directly the image from docker or build it :

### Pulling from Docker

```
docker pull pixhub/ansible

### Buildinf it from Git

```
git clone https://github.com/pixhub/docker_ansible
docker build -t some-name docker_ansible

## Running it Forwarding your SSH HostKey

In my case, I store my ansible roles/inventories/playbook in `/home/$USER/ansible`. Then I mount this directory inside
the Ansible Container to use them.

```
docker run --rm -ti -v $SSH_AUTH_SOCK:/ssh_agent -v /home/$USER/ansible:/ansible pixhub/ansible /bin/bash
```

Then you can directly test it whithout enterring inside the container. Test it with setup module :

```
docker run --rm -ti -v $SSH_AUTH_SOCK:/ssh_agent -v /home/$USER/ansible:/ansible pixhub/ansible ansible -i inventories/some-inventory some-server-name -m setup
```

Enjoy !

Best Regards,
pixhub.
