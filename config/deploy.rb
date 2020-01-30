# config valid for current version and patch releases of Capistrano
lock '~> 3.11.2'

set :application, 'webpagewatcher'
set :repo_url, 'git@github.com:nateude/webpagewatcher.git' # Edit this to match your repository
set :branch, :master
set :deploy_to, '/home/deploy/webpagewatcher'
set :pty, true
set :linked_files, %w[config/database.yml config/application.yml]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/assets]
set :keep_releases, 5
set :rvm_ruby_version, `cat .ruby-version`.chomp # Edit this if you are using MRI Ruby
set :console_shell, '/bin/bash'
set :bundle_binstubs, nil
# set :rvm_map_bins, %w{gem rake ruby rails bundle puma pumactl}

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock" # accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

namespace :puma do
  Rake::Task[:restart].clear_actions

  desc 'Overwritten puma:restart task'
  task :restart do
    invoke 'puma:stop'
    invoke 'puma:start'
  end
end
