default_run_options[:pty] = true 

set :application, "tiagogodinho.com"
set :repository,  "git://github.com/tiagogodinho3/seek---gerenciador-de-projetos.git"
set :scm, :git
set :user, "th30642"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, "working"

role :app, application
role :web, application
role :db,  application, :primary => true