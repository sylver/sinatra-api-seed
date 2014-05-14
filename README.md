Sinatra Template
================
Basic template of a Sinatra application from which fork new project

Stack
-----
This template uses :
- Sinatra as the main application
- Sequel as ORM
- PostgreSQL as the database
- MiniTest for the unit testing
- More to come soon

Configure
---------
- Fork a new project from this repository
- Add your own `.env` file in the root folder, containing needed variables.

Example :
```
RACK_ENV=development
DATABASE_URL='postgres://vagrant:vagrant@localhost/db'
```

About Vagrant
-------------
You need first to configure your box to initialize the project.

Replace the line `config.vm.box = "wheezy_min"` with whatever box you need.  
To install a box, simply run `vagrant box add [boxname]`  
You can find boxes on [Vagrant Cloud][vagrantcloud]

[Consult the documentation][vagrantboxes]

[vagrantcloud]:https://vagrantcloud.com/
[vagrantboxes]:https://docs.vagrantup.com/v2/getting-started/boxes.html
