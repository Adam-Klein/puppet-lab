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

## Exercise 1

Create a new language to

* Ensure Apache package installed
* Ensures document root directory exists to serve web pages
* Ensure index.html includes data from your class

### Exercise 2

Make a minor change in the apache httpd.conf file

### Exercise 3

* Use puppet to deploy the updated httpd.conf file

### Extra credit

* TBD
