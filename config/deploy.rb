require 'bundler/capistrano'

set :application, "flickbar.com"
set :domain,      "flickbar.com"
set :repository,  "git://github.com/jurgens/flickbar.git"
set :rails_env,   "production"

default_run_options[:pty] = true
ssh_options[:paranoid]    = false

set :scm, "git"

set :user,      "flickbar"
set :runner,    "flickbar"
set :use_sudo,  false

set :deploy_to, "/home/flickbar/domains/#{application}"
set :branch,               "master"
set :deploy_via,            :remote_cache

default_run_options[:pty] = true

role :app, domain
role :web, domain
role :db,  domain, :primary => true



# Create uploads directory and link
task :configure, :roles => :app do
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end

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

namespace :delayed_job do
    desc "Restart the delayed_job process"
    task :restart, :roles => :app do
        run "cd #{current_path}; RAILS_ENV=#{rails_env} script/delayed_job restart"
    end
end

after "deploy:restart", "delayed_job:restart"
after "deploy:update", "configure", "deploy:migrate", "deploy:cleanup"


