default_run_options[:pty] = true

set :application, 'idyle'
set :repository,  "git@github.com:idylenet/#{application}.git"
set :scm, "git"
set :user, "idylenet"
set :domain, 'idyle.net'  # slamdot servername where your account is located 
set :applicationdir, "/home/#{user}/apps/#{application}"  # The standard slamdot setup

set :ssh_options, {:forward_agent => true}
set :branch, "master"
set :git_shallow_clone, 1
set :git_enable_submodules, 1

# Don't change this stuff, but you may want to set shared files at the end of the file ##################
# deploy config
set :deploy_to, applicationdir
set :deploy_via, :remote_cache

# roles (servers)
role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
 [:start, :stop, :restart, :finalize_update, :migrate, :migrations, :cold].each do |t|
   desc "#{t} task is a no-op with mod_rails"
   task t, :roles => :app do ; end
 end
end

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/Path/To/id_rsa)            # If you are using ssh_keys
#set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

on :start do
    `ssh-add`
end