require 'bundler/capistrano'
load 'deploy/assets'

# Load RVM's capistrano plugin.
require "rvm/capistrano"
#set :rvm_path, "$HOME/.rvm"
set :rvm_ruby_string, "1.9.3"
set :rvm_type, :user  # Don't use system-wide RVM

set :application, "hiphype"
set :repository,  "http://github.com/jsullivan/hiphype"

set :scm, :git
set :branch, 'master'

set :user, 'hiphype'
set :use_sudo, false

set :home_dir, "/var/www/#{application}"

role :web, "hiphype.me"      # Your HTTP server, Apache/etc
role :app, "hiphype.me"
role :db,  "hiphype.me", :primary => true 

set :deploy_to, "#{home_dir}"

set :bundle_roles, [:app]

# if you want to clean up old releases on each deploy uncomment this:
after "deploy", "deploy:cleanup"
after "deploy:update_code", "custom:data_symlink"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :custom do
  task :data_symlink do
    run "ln -nfs #{shared_path}/data #{release_path}/db/data"
  end
end
