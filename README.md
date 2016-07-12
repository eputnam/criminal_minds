# helloworld_puppet
##Overview
Creates a website for your BAU team.
##Module Description
This module creates a simple dossier website on your BAU team based on a YAML file.
##Prerequisites
The criminal_minds module requires Apache2 to be installed.
##Setup
Clone this repo into your modules directory. This module is not yet available from the Forge.
##Usage
After you've installed this module, declare it in your node/site manifest with the location of your team.yml:
```ruby
node default {
  class { 'apache':
          docroot => "/var/www/" }
  class { 'criminal_minds':
          team_data => "/etc/puppetlabs/code/environments/production/team.yml",
          docroot => "/var/www/" }
}
```

##Reference
###Available Parameters
- team_data
  - path to your team.yml file
- docroot
  - your apache docroot path
- confdir
  - path to your configuration directory (feature to be implemented)
- configfile
  - contents of your config file (feature to be implemented)

##Limitations
Currently, this module has only been verified on Ubuntu 14.04
