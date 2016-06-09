# The Puppet Learning Lab

### Requirements:

* virtualbox or vmware
* vagrant
* oscar (vagrant plugin install oscar)
* this repository

Clone this repo, then run the commands:

```
cd puppet-lab && sh ext/bootstrap.sh
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

Make a small change, then use git to add and commit the change. Now the master is ready to go! Why is this? The /vagrant directory is mounted to the puppet-lab directory. There's a post-commit hook in the directory that runs r10k on the master every time a change is committed. This syncs local changes to production on the master. Check it out:

```
ls -al /etc/puppetlabs/code/environments/production
```

After you have added and committed your changes, run puppet agent -t and see the master use the code from the /vagrant directory!

Now let's pull up an agent node. Which node you pull up is going to depend on you're running Linux or Windows exercises:

```
% vagrant status
Current machine states:

master                    running (virtualbox)
pe_agent                  not created (virtualbox)
wagent                    not created (virtualbox)
```

Open another terminal session and then:

#### Linux node

```
vagrant up pe_agent
```

#### Windows node

```
vagrant up wagent 
```

## Exercise 1

When you pull up the nodes for the first time, they'll be broken in some way. Use puppet to fix the node and carry on with the rest of the exercises.

To login to the Linux nodes:

```
vagrant ssh pe_agent
```

To login to the Windows node:

```
vagrant rdp wagent
```

### Please note!

Puppet Enterprise master is resource-intensive (pe-puppetserver is a JVM). Please only pull up the master and only one other node, either the linux node or the windows node.

## Exercise 2

First, we're going to get into the puppet.conf file and change the runinterval of your node. On Linux, it's at /etc/puppetlabs/puppet/puppet.conf. On Windows, it's at C:\ProgramData\PuppetLabs\Puppet\Puppet.conf. Change the value of runinterval to 1800. Save and exit the file.

## Exercise 3

Let's say you wanted to change the runinterval for ALL of your nodes. Add a resource to your base profile that will make your change permanent.

## Linux Exercises

### sudoers

1. Using Puppet, add a sudo user to your node. Keep in mind that you'll still need the vagrant user on your instance to be able to login!

2. Let's think of our node as a dev node. Write a sudo config that would only apply to a dev node.

### refactor code

There are two classes, profile::linux::groups and profile::linux::files. Choose one class and improve the code. Extra credit: refactor the other class.

## Windows Exercises

### snare agent

1. Snare agent is installed and configured using the classes profile::snare::reg and profile::snare::agent. Read through the code, then properly classify your Windows agent to install and configure snare agent.

2. Let's pretend security decided to change the configuration of snare agent. They've changed the destination to 192.168.137.98. Alter the class to make it so the value can be changed via declaration or Hiera.


### refactor code

Refactor the code for class profile::snare::reg. How could this code be better?

## Great job!

What three things did you learn from this lab? Share with your teammates tomorrow at stand-up!


