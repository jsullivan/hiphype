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

# if you want to clean up old releases on each deploy uncomment this:
after "deploy", "deploy:compile_assets"

after "deploy:restart", "deploy:cleanup"

after "deploy", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :compile_assets do
    run "cd #{current_release} && bundle;bundle exec rake assets:precompile"
  end
end
