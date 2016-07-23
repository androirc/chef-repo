# Steps

* Install Chef client: https://downloads.chef.io/chef-client/
* Install `chef-vault`: `sudo gem install chef-vault`
* Retrieve the server certificate from flanders. Store the files in the folder `/etc/chef-server`
    - Organization 'madalynn': /home/madalynn/private_keys/madalynn.pem -> equivalent of the chef-validator.pem file
    - Admin user 'blinkseb': /home/madalynn/private_keys/blinkseb.pem -> equivalent of the admin.pem file

```bash
    scp flanders:/home/madalynn/private_keys/madalynn.pem /etc/chef-server/chef-validator.pem
    scp flanders:/home/madalynn/private_keys/blinkseb.pem /home/sbrochet/.chef/blinkseb.pem
```

* Configure knife: `knife configure`
 - URL is https://flanders.madalynn.eu/organizations/madalynn
 - Admin user name is 'blinkseb'
 - Organization name is 'madalynn'

* Flanders use a self-signed certificate. You need to copy the certificate locally. Certificate file is by default only accessible to root user, so you need to connect to the server and manually copy the file `/var/opt/opscode/nginx/ca/*.crt` to `/home/sbrochet/.chef/trusted_certs/`

## Adding new hosts

 * First, bootstrap the new host with the `knife bootstrap` command:

```
knife bootstrap -G <SSH gateway> <IP> -x <SSH username> --sudo -A -N <Node name> -u blinkseb
```

The new node should appears when doing `knife node list`

 * Update the passwords vault to add the new node:

```
./update_passwords_access_list.sh
```

 * Upload the updated password vault

```
knife upload data_bags
```

 * Update the run list of the new node. The run list define which actions are run automatically on each node (see the `roles` folder for a list of possible values)

```
knife node run_list add <Node name> 'role[<role name>]'
```

 * Run `sudo chef-client` on the new host

## Managing cookbooks

Cookbooks are managed with Berkshelf. Install ChefDK to have it

* To list all cookbooks:

```bash
berks list
```

* To list outdated cookbooks:

```bash
berks outdated
```

* To update all cookbooks to latest version:

```bash
berks update
```

* To upload all cookbooks to the chef-server

```bash
berks upload --no-ssl-verify
```
