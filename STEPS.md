# Steps

* Install Chef client: https://downloads.chef.io/chef-client/
* Retrieve the server certificate from flanders. Store the files in the folder `/etc/chef-server`
    - Organization 'madalynn': /home/madalynn/private_keys/madalynn.pem -> equivalent of the chef-validator.pem file
    - Admin user 'blinkseb': /home/madalynn/private_keys/blinkseb.pem -> equivalent of the admin.pem file

``bash
    scp flanders:/home/madalynn/private_keys/madalynn.pem /etc/chef-server/chef-validator.pem
    scp flanders:/home/madalynn/private_keys/blinkseb.pem /home/sbrochet/.chef/blinkseb.pem
``

* Configure knife: ``knife configure``
 - URL is https://flanders.madalynn.eu/organizations/madalynn
 - Admin user name is 'blinkseb'
 - Organization name is 'madalynn'

* Flanders use a self-signed certificate. You need to copy the certificate locally. Certificate file is by default only accessible to root user, so you need to connect to the server and manually copy the file `/var/opt/opscode/nginx/ca/*.crt` to `/home/sbrochet/.chef/trusted_certs/`

## Managing cookbooks

Cookbooks are managed with librarian.

``bash
gem install librarian-chef
``

* To list all cookbooks:

``bash
librarian-chef show
``

* To list outdated cookbooks:

``bash
librarian-chef outdated
``

* To update all cookbooks to latest version:

``bash
librarian-chef update
``

* To upload all cookbooks to the chef-server

``bash
knife cookbook upload --all
``
