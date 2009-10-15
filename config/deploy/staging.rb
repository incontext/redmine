role :app, "staging"
role :web, "staging"
role :db,  "staging", :primary => true

set :rails_env, "staging"
set :mongrel_environment, rails_env
set :gateway, "arakwal.incontext.com.au"
