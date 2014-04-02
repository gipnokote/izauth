iZauth
======

iZauth is an implementation of tech task for [iZettle](https://www.izettle.com) company.
This is a very basic system that allows users to register, sign in and see their
five latest login details.

The working instance can be seen [here](http://izauth.misterodds.com/) (not guaranteed to be there forever)

Requirements
------------

iZauth relies on [Ruby on Rails framework](http://rubyonrails.org/) and the following gems:
* [Devise](https://github.com/plataformatec/devise): configurable authentication system
* [Bootstrap](http://getbootstrap.com/): popular CSS framework
* [HAML](https://github.com/haml/haml): templating engine
* [SQLite3](http://rubygems.org/gems/sqlite3): simple database engine that stores the files locally (any other DB engine could be used)

Installation
------------

Installation is simple. First step is to checkout the repo:

```console
git clone git@github.com:gipnokote/izauth.git
```

Then the dependencies have to be installed:

```console
bundle install
```

SQLite gem might require to install some libs which may vary depending on the server system.

Finally, the database has to be created:

```console
rake db:create
rake db:migrate
```

Usage
-----

iZauth Devise gem was configured to have the very basic authentication process.
It doesn't send the confirmation emails. For registration user needs only to enter any email
(dummy one suits fine) and a password. Devise is very flexible and when a need comes it can
be tweaked to deliver all the advanced features.

Implementation of login logging
-------------------------------

Devise has such features as tracking user's last and current login time and IP, but it cannot store
five last logins, so the `Login` model was generated for this purpose. Devise's `Sessions` and
`Registrations` controllers were overriden in iZauth code, to run callbacks after signing up and
logging in. `User` model has been given an `update_logins` method which creates a new `Login`
record using Devise's `current_sign_in_ip` and `current_sign_in_at` info, and deletes all records
except the first five.