Rails 3, RSpec, Fabrication or Factory Girl, Haml, and jQuery
=============================================================

# Please note

Thomas Maas points out that the recent switch by github to only support https
has exposed a bug in Rails (see
https://rails.lighthouseapp.com/projects/8994/tickets/5926).  In order to use
these templates, you should clone the repo and refer to the templates from your
local file system instead of their github uris as shown below.

    % rails new my_app -J -T -m rails3-app/app.rb

# Usage

Easily generate a Rails 3 application with RSpec, Factory Girl, Haml, and
jQuery in one line:

    % rails new my_app -J -T -m https://github.com/ouvrages/rails3-app/raw/master/app.rb

## Need Cucumber?

Use this generator file instead:

    % rails new my_app -J -T -m \
    https://github.com/ouvrages/rails3-app/raw/master/cuke.rb

## Want Fabrication instead of Factory Girl?

Use either of the following generators instead:

    % rails new my_app -J -T -m https://github.com/ouvrages/rails3-app/raw/master/fabrication.rb

    % rails new my_app -J -T -m https://github.com/ouvrages/rails3-app/raw/master/fabrication_cuke.rb

rvm
---

We love `rvm`, so the application has an `.rvmrc` generated to specify a gemset.

Generators
----------

We use the Factory Girl and Haml Rails 3 generators &mdash; the generators for
RSpec and Fabrication are packaged within their respective gems. The Factory Girl and Haml generators are from the
[ haml-rails ](http://github.com/indirect/haml-rails) and
[factory_girl_generator](http://github.com/leshill/factory_girl_generator)
gems.

JavaScript Includes
-------------------

Since the Rails helper `javascript_include_tag :defaults` is looking for
Prototype, we change the default JavaScript includes to be jQuery.

git
---

We love `git`, so the application has a git repo initialized with all the initial changes staged.

Wrap Up
-------

After the application has been generated, there are a few final command to finish the install, check the output!

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don’t break it in a future version
  unintentionally.
* Commit, do not mess with rakefile, version, or history.  (if you want to have
  your own version, that is fine but bump version in a commit by itself I can
  ignore when I pull)
* Send me a pull request. Bonus points for topic branches.
