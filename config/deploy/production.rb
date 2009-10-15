role :app, "www.mytestbed.net"
role :web, "www.mytestbed.net"
role :db,  "www.mytestbed.net", :primary => true

set :rails_env, "production"
set :user, "redmine-prod"
set :deploy_to, "/var/lib/rails/prod/#{project_name}"
