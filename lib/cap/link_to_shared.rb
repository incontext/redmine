Capistrano::Configuration.instance(:must_exist).load do
  desc <<-DESC
    Updates the public/images/captchas symlink. Note you must make sure
    you have create public/images/captchas in shared
  DESC
  task :captcha, :roles => :web do
    run <<-CMD
      rm -f #{latest_release}/public/images/captchas &&
      mkdir -p #{shared_path}/public/images/captchas &&
      ln -s #{shared_path}/public/images/captchas #{latest_release}/public/images/captchas
    CMD
  end
  desc <<-DESC
    Updates the config/thin.yml symlink. Note you must make sure
    you have a correct thin.yml in shared.
  DESC
  task :thin_config, :roles => :web do
    run <<-CMD
      rm -f #{latest_release}/config/thin.yml &&
      ln -s #{shared_path}/config/thin.yml #{latest_release}/config/thin.yml
    CMD
  end

  desc <<-DESC
    Updates the config/initializers/session_store.rb sym-link.
    NOTE. You must run rake config/initializers/session_store.rb
    in shared for this to work.
  DESC
  task :session_store, :roles => :web do
    run <<-CMD
      rm -f #{latest_release}/config/initializers/session_store.rb &&
      ln -s #{shared_path}/config/initializers/session_store.rb #{latest_release}/config/initializers/session_store.rb
    CMD
  end
end
