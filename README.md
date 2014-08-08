# sinatra-api-seed — the seed for Sinatra API apps

This project is an application skeleton for a typical Sinatra API app.
You can use it to quickly bootstrap your sinatra webapp projects and dev environment for these projects.

The seed contains a sample sinatra application and is bundle with all needed configuration to instantiate a preconfigured vagrant machine.

The seed app doesn't do much, just shows how to start with all needed tools and some examples.

## Stack

This template uses :

- Sinatra as the main application
- Sequel as the ORM
- PostgreSQL as the database (no sqlite for development, it's better to have all the stack already there when developing, thanks to vagrant)
- MiniTest for the unit testing
- More to come soon

## Getting Started

To get you started you can simply clone the sinatra-api-seed repository and configure your environment to start the vagrant machine :

### Prerequisites

You need git to clone the sinatra-api-seed repository. You can get it from
[http://git-scm.com/](http://git-scm.com/).

### Clone sinatra-api-seed

Clone the sinatra-api-seed repository using git :
```
git clone https://github.com/rksylvr/sinatra-api-seed.git
cd sinatra-api-seed
```

## Configure

- Add your own `.env` file in the root folder, containing needed variables.  
  You can find an example in `./devkit` folder

```
RACK_ENV=development
DATABASE_URL='postgres://vagrant:vagrant@localhost/db'
```

- Choose in the `config.ru` file whether use the classic style or
  the modular style for your application

```

# Classic
require './app'
run Sinatra::Application
```

```

# Modular
require 'app/main'
run MainApp
```

## About Vagrant

You need first to configure your box to initialize the project.  
Copy the `./devkit/Vagrantfile` to your project root path then
replace the line `config.vm.box = "wheezy_min"` with whatever box you need.

To install a box, simply run `vagrant box add [boxname]`  
You can find boxes on [Vagrant Cloud][vagrantcloud]

[Consult the documentation][vagrantboxes]

[vagrantcloud]:https://vagrantcloud.com/
[vagrantboxes]:https://docs.vagrantup.com/v2/getting-started/boxes.html


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
