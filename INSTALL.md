## Installation

### Postgresql

Distro-dependent.

### Git

Distro-dependent, installation instructions [here](http://git-scm.com/download/linux).

### Ruby

``` bash
$ curl -L https://get.rvm.io | bash -s stable --ruby
# restart the shell session
$ rvm install 1.9.3
$ rvm use 1.9.3 --default
```

### Project

``` bash
# getting the project
$ cd /var/www
$ git clone git://github.com/7even/hackful.git
$ cd hackful
# installing libraries
$ bundle install
# creating the database
$ RAILS_ENV=production rake db:setup
```

### Passenger

``` bash
$ gem install passenger
$ sudo passenger start -p 80
```
