server '18.177.206.247', user: 'oda', roles: %w{app db web}
set :ssh_options, {
  keys: '~/.ssh/koumuin_next_aws_rsa_602987ddd3328ba9dd61bab2ab93ef12',
  forward_agent: true,
  auth_methods: %w(publickey)
}
