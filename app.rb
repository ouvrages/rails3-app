gem "factory_girl_rails", ">= 1.0.0", :group => :test
gem "factory_girl_generator", ">= 0.0.1", :group => [:development, :test]
gem "haml-rails", ">= 0.3.4"
gem "rspec-rails", ">= 2.2.1", :group => [:development, :test]
gem "yaml_db"

generators = <<-GENERATORS

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
    end
GENERATORS

application generators

get "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js",  "public/javascripts/jquery.js"
get "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js", "public/javascripts/jquery-ui.js"
get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

gsub_file 'config/application.rb', 'config.action_view.javascript_expansions[:defaults] = %w()', 'config.action_view.javascript_expansions[:defaults] = %w(jquery.js jquery-ui.js rails.js)'

layout = <<-LAYOUT
!!!
%html
  %head
    %title #{app_name.humanize}
    = stylesheet_link_tag :all
    = javascript_include_tag :defaults
    = csrf_meta_tag
  %body
    #header
      %h1 #{app_name.humanize}
    #content
      = yield
    #footer
LAYOUT

remove_file "app/views/layouts/application.html.erb"
create_file "app/views/layouts/application.html.haml", layout

create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

run "bundle install"
run "script/rails generate rspec:install"

index = <<-INDEX
%p Welcome!
INDEX

run "script/rails generate controller main"
create_file "app/views/main/index.html.haml", index
route "root :to => \"main#index\""
remove_file "public/index.html"

sass = <<-SASS
@import meyer-reset

SASS

create_file "public/stylesheets/sass/application.sass", sass

get "https://github.com/adamstac/meyer-reset/raw/master/stylesheets/_meyer-reset.sass", "public/stylesheets/sass/_meyer-reset.sass"

git :init
git :add => "."
git :commit => "-m 'Generated app with RSpec, Factory Girl, Haml, jQuery and yaml_db'"

