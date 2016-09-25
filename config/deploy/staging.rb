set :deploy_to, '/var/www/agency'

server 'resivalex.com', user: 'deploy', roles: %w(app db web)
