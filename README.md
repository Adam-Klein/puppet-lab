### The Puppet Learning Lab

Requirements:
* virtualbox or vmware
* vagrant
* oscar (vagrant plugin install oscar)

```
cd ext && sh bootstrap.sh
vagrant up master
```

Wait a bit for the master to come up. Then -

```
vagrant ssh master
```

On the master:

```
sudo su -
cd /vagrant
```

Make a small change, then use git to add and commit the change. Now the master is ready to go! Why is this? There's a post-commit hook in the directory that runs r10k on the master every time a change is committed. This syncs local changes to production on the master.

Exit the master node. Now let's pull up an agent node. Which node you pull up is going to depend on you're running Linux or Windows exercises:

```
% vagrant status
Current machine states:

master                    running (virtualbox)
pe_agent                  not created (virtualbox)
wagent                    running (virtualbox)
```

vagrant up the pe_agent if you're running Linux exercises. vagrant up wagent for Windows exercises.

When you pull up the nodes for the first time, they'll be broken in some way. Use puppet to fix the node.
