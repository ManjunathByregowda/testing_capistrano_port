server '3.16.55.152', user: 'ubuntu', roles: %w{web app db}

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :puma_env, 'production'
