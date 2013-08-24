# Puppetmaster

Creates a Puppet Master running with Apache/Passenger, PuppetDB, Dashboard, and Redis (for Hiera).

Build

* `docker build -t puppetmaster .`
* `docker run puppetmaster`

Note: It is easiest to run the container with the hostname of `puppet`.  For
example, `docker run -h puppet -d puppetmaster`

Note: The `sshkey` and `sshkey.pub` are just for example.  Replace with your own
before using.  These are used to access the SSH daemon on the container.

Note: For the PuppetDB SSL cert setup, you will need to SSH and run the following
to create the keystore and certs:

* `puppet agent -t`
* `puppetdb-ssl-setup`
* `supervisorctl restart puppetdb`

Ports

* 22 (ssh)
* 8140 (puppet)
* 8080 (puppetdb)
