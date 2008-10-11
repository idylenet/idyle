
default_run_options[:pty] = true
set :repository,  "git@github.com:vanpelt/rails-app.git"
set :scm, "git"
set :scm_passphrase, "p@ssw0rd" #This is your custom users password
set :user, "deployer"

set :application, "idyle"
set :repository,  ""

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "www.idyle.org"
role :web, "www.idyle.org"
role :db,  "www.idyle.org", :primary => true