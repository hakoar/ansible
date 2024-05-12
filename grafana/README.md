## Grafana Installation / Uninstallation Ansible Playbook

This playbook allows to install or remove Grafana Enterprise installation from the target hosts.

Current version works only on Debian Linux (which it has been tested on).

There are two places where installation parameters can be customized:
1. **group_vars/grafana** file
> You can define default Grafana admin accounts etc. in this file.

2. **templates/grafana.ini.j2** file
> This file is the Grafana service configuration template which will be applied. 

### Inventory
---
Add your target hosts into **playbook-hosts** file under **[grafana]** section.

```
[grafana]
grafana.lab ansible_host=192.168.101.136
```

### Grafana Installation
---
> You start the installation by running **install-grafana.sh** script.

> It needs SSH account as a command line parameter which can login to the target servers. This account also needs to have SUDO privileges.

```
grafana:~$ ./install-grafana.sh userx
-------------------------------------------------------------------

 Installing Grafana...

-------------------------------------------------------------------
Using /home/userx/ansible/grafana/ansible.cfg as config file
SSH password: 
```
### Reconfigure Grafana
---
> You start the reconfiguration by running **reconfigure-grafana.sh** script.

> It needs SSH account as a command line parameter which can login to the target servers. This account also needs to have SUDO privileges.

> **This cannot change Grafana Admin password! It can only be set on first start.**

### Uninstall Grafana
---
> You start the uninstall by running **uninstall-grafana.sh** script.

> It needs SSH account as a command line parameter which can login to the target servers. This account also needs to have SUDO privileges.

> **This will remove all Grafana configurations and the application itself !!**

```
grafana:~$ ./uninstall-grafana.sh userx
-------------------------------------------------------------------

 !!!! Uninstalling Grafana... !!!!

-------------------------------------------------------------------
Using /home/userx/ansible/grafana/ansible.cfg as config file
SSH password: 
```

### Technical Notes
---
This has been tested with Ansible core 2.16.6 and Python 3.11.2 on Debian 12

Install these Debian packages to your Ansible host which is running this playbook:
```
sudo apt-get install -y python-is-python3 sshpass
```
