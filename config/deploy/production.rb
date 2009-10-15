role :app, "production"
role :web, "production"
role :db,  "production", :primary => true

set :rails_env, "production"
set :mongrel_environment, rails_env
set :gateway, "arakwal.incontext.com.au"
