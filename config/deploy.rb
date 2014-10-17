lock '3.2.1'

set :application, 'participant_tracker'
set :scm, :git
set :repo_url, 'git@github.com:kodvinci/participant_tracker.git'
set :branch, 'master'
set :deploy_to, '/var/www/participant_tracker'
set :pty, false
set :user, 'dmtg'
set :use_sudo, false
set :rails_env, 'production'
set :deploy_via, :copy
set :ssh_options, { :forward_agent => true, :port => 2222 }
set :format, :pretty
set :keep_releases, 5
set :linked_files, %w{config/database.yml config/secret_token.txt config/local_env.yml}
set :linked_dirs, fetch(:linked_dirs).push("bin" "log" "tmp/pids" "tmp/cache" "tmp/sockets" "vendor/bundle" "public/system")
set :linked_dirs, fetch(:linked_dirs) + %w{ updates }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
