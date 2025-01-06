# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "MySpreeCommerce"
set :repo_url, "git@github.com:truongtuan97/MySpreeCommerce.git"

set :rails_env, 'staging'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/MySpreeCommerce"

# Các thư mục và tệp cần giữ lại trong mỗi lần deploy
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Xác định branch git sử dụng để deploy (chỉ cần nếu bạn muốn deploy từ một branch cụ thể)
set :branch, 'main'

# Chạy bundle install trên server
set :bundle_flags, '--deployment --quiet'

# Thiết lập số lượng tối đa các phiên bản deploy giữ lại
set :keep_releases, 3

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
