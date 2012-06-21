## Installation

### Postgresql

``` bash
# installing
$ sudo apt-get update
$ sudo apt-get install postgresql
# creating user
$ sudo -u postgres createuser --superuser $USER
# launching the postgres console
$ sudo -u postgres psql
# setting password
postgres=# \password YOUR_USERNAME # replace YOUR_USERNAME with your username in the system
# and hit enter 2 times to set an empty password
# then \q to exit postgres console
```

Read more [here](https://help.ubuntu.com/community/PostgreSQL#Alternative_Server_Setup).

### Git

``` bash
$ sudo apt-get install git-core
```

### Ruby

``` bash
$ sudo apt-get install curl
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
```

Then edit `config/database.yml` file and replace YOUR_USERNAME on line 25 with your username in the system. Now you can create the database:

``` bash
$ RAILS_ENV=production rake db:setup
```

### Passenger

``` bash
$ gem install passenger
$ sudo passenger start -p 80
```
