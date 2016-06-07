### The Puppet Learning Lab

Requirements:
* virtualbox or vmware
* vagrant
* oscar (vagrant plugin install oscar)

```
cd ext && sh bootstrap.sh
cd ..
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

Make a small change, then use git to add and commit the change. Now the master is ready to go! Why is this? The /vagrant directory is mounted to the puppet-lab directory. There's a post-commit hook in the directory that runs r10k on the master every time a change is committed. This syncs local changes to production on the master.

After you have added and committed your changes, run puppet agent -t and see the master use the code in the /vagrant directory!

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

To login to the Linux nodes:

```
vagrant ssh pe_agent
```

To login to the Windows node:

```
vagrant rdp wagent
```

## Please note!

Puppet Enterprise master is resource-intensive (pe-puppetserver is a JVM). Please only pull up the master and only one other node, either the linux node or the windows node.
