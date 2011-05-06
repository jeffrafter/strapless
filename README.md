Strapless
=========

Inspired by the ar\_fixtures plugin and the fixture loading in Rick Olson's
mephisto. Most of this was developed while working on Mateme with
Baobab Health and Partners in Health.

Overview
--------

Think of this as a better way to seed your data based on things that you
already have in your development database. It allows you to quickly load
and dump the records in your database to YAML.

Usage
-----

Add strapless to your <code>Gemfile</code> then:

    $ bundle install

Now you should have the tasks:

    $ rake -T bootstrap
    (in /path/to/your/rails/project)
    rake db:bootstrap:dump  # Create a set of fixtures from the current database
    rake db:bootstrap:load  # Load initial fixtures (from db/data/*.yml) into the current database

If you already have data then you can dump it to the db/data folder:

    $ rake db:bootstrap:dump

This will load all of your ActiveRecord::Base models (in your app/models) and
generate fixtures for them. Strapless will attempt to use your to\_param so that
the names are pretty. You can override the fixture\_name instance method in your
model if you want something custom.

Adding these fixtures to your repository makes a lot of sense, unless you have
crazy amounts of data.

When you get ready to load the data in, Strapless will take all of the fixture
YAML files in your db/data folder and try to read it in.

<span style='color:red'><strong>Warning:</strong> when loading the data from a
fixture, any existing data will be deleted from the related table.</span>

    $ rake db:bootstrap:load

Now you have some data!

Installation
------------

If you are not using bundler just:

### [RubyGems](http://rubygems.org/)

    $ gem install strapless


The tasks should automatically appear in Rails 3. If you are using Rails 2, then
you will need to load the tasks manually. In your Rakefile add

    require 'strapless/tasks'

Acknowledgements
----------------

Thanks to [Nick Plante](http://twitter.com/zapnap) for prodding me to make this a
gem and for helping through some simplifications and [Eunji Choi](http://twitter.com/angelicism)
for the name "Strapless."

Contributing
------------

Once you've made your great commits:

1. [Fork][fk] Strapless.
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create an [Issue][is] with a link to your branch
5. That's it!

Meta
----

* Code: `git clone git://github.com/jeffrafter/strapless.git`
* Home: <http://jeffrafter.github.com/strapless>
* Bugs: <http://github.com/jeffrafter/strapless/issues>
