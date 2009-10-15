role :app, "pdev.mytestbed.net"
role :web, "pdev.mytestbed.net"
role :db,  "pdev.mytestbed.net", :primary => true

set :rails_env, "development"
set :user, "redmine-dev"
set :deploy_to, "/var/lib/rails/dev/#{project_name}"
