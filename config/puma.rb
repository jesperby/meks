app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

workers 1
threads 0, 16
port 3000

bind "unix://#{shared_dir}/sockets/puma.sock"

pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app

stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# preload_app!
#
# on_worker_boot do
#   ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end
