gem "haml-rails", ">= 0.3.4"
gem "yaml_db"
gem 'paperclip'
gem 'ouvrages-flvtool2', :require => nil
gem 'rmagick', :require => nil
gem 'mysql2'
gem 'jquery-rails', '>= 0.2.6'
gem "ouvrages_engine", :path => "../ouvrages_engine"

application "config.i18n.default_locale = :fr"

remove_file "app/views/layouts/application.html.erb"

create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

run "bundle install"

remove_file "public/index.html"

run "script/rails generate ouvrages_engine:install"

git :init
git :add => "."
git :commit => "-m 'Generated app with Ouvrages Engine'"

