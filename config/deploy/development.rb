role :app, "asparagine"
role :web, "asparagine"
role :db,  "asparagine", :primary => true

set :rails_env, "development"
set :mongrel_environment, rails_env
set :mongrel_address, "0.0.0.0"
set :mongrel_clean, true
