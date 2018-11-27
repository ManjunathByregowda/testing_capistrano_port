# config valid only for current version of Capistrano
lock '3.4.1'

set :application, 'test_capistrano_port'
set :repo_url, 'git@github.com:ManjunathByregowda/testing_capistrano_port.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, '/home/ubuntu/www/testing_capistrano_port'
set :rvm_type, :user
set :rvm_ruby_version, '2.5.1'
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/videos image_upload }
set :linked_files, %w{config/application.yml config/database.yml}
set :log_level, :debug
# Puma
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "0.0.0.0:8080"    #accept array for multi-bind
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, true
set :puma_threads, [0, 16]
set :puma_workers, 0

# Nginx
set :nginx_force_ssl, false
after "deploy:check",    "puma:config"
after "deploy:published", "puma:restart"

# namespace :deploy do

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end

# end
