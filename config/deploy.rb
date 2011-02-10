
set :application, "flickbar.com"
set :domain,      "flickbar.com"
set :repository,  "ssh://git@local3.webta.net/home/git/flickbar.git"
set :rails_env,   "staging"

default_run_options[:pty] = true
ssh_options[:paranoid]    = false

set :scm, "git"

set :user,      "flickbar"
set :runner,    "flickbar"
set :use_sudo,  false

set :deploy_to, "/home/flickbar/domains/staging.#{application}"
set :branch,               "master"
set :deploy_via,            :checkout

default_run_options[:pty] = true

role :app, domain
role :web, domain
role :db,  domain, :primary => true




# Create uploads directory and link
task :update_code, :roles => :app do
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#  run "ln -s #{shared_path}/files #{release_path}/public/files"

#  run "cd #{latest_release}; bundle install --deployment"
end

after "deploy:update", "update_code"


#namespace :cron do
#  task :update, :roles => :app do
#    #reinstall cron tasks
#    run "echo "
#    run "cd #{release_path}; rake gw:cron:install RAILS_ENV=production"
#  end
#end

#namespace :gems do
#  task :install, :roles => :app  do
#    run "cd #{release_path}; #{sudo} /opt/ruby/bin/rake gems:install RAILS_ENV=production"
#  end
#end
#
#after :deploy, "gems:install", "cron:update"
#after :deploy, "cron:update"


# Passenger tasks
namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

after "deploy:update", "deploy:migrate"
