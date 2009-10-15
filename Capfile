load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
Dir['lib/cap/*.rb'].each { |plugin| require plugin }

require 'capistrano/ext/multistage'
require 'mongrel_cluster/recipes'

set :client_name, "nicta"
set :project_name, "redmine"
set :stages, %w(development production testing)
set :default_stage, "development"

# You shouldn't need to change anything below here.
set :use_sudo, false

ssh_options[:forward_agent] = true

set :scm, :git
set :repository, "git://github.com/edavis10/redmine.git"
set :deploy_to, "/var/lib/rails/#{client_name}/#{project_name}"
set :deploy_via, :remote_cache

set :user, client_name
set :application, project_name

set :mongrel_user, client_name
set :mongrel_group, "rails"
set :mongrel_port, 8100
set :mongrel_servers, 3
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

# Make sure the branch name is spcified
before "deploy:update", 'check_branch_name'

# Configure mongrel
after "deploy:update", 'mongrel:cluster:configure'
