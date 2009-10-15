role :app, "www.mytestbed.net"
role :web, "www.mytestbed.net"
role :db,  "www.mytestbed.net", :primary => true

set :rails_env, "development"
set :user, "redmine-dev"
set :deploy_to, "/var/lib/rails/dev/#{project_name}"
