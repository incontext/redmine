role :app, "www.mytestbed.net"
role :web, "www.mytestbed.net"
role :db,  "www.mytestbed.net", :primary => true

set :rails_env, "testing"
set :user, "redmine-test"
set :deploy_to, "/var/lib/rails/test/#{project_name}"
