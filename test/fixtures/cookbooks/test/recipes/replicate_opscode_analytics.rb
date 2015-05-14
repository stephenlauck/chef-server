# replicate /etc/opscode from bootstrap backend to frontend server

include_recipe 'test::setup_ssh_keys'

case node['chef-server']['topology']
when 'standalone'
  execute "scp -i /root/.ssh/insecure_private_key -o StrictHostKeyChecking=no -r root@chef.example.com:/etc/opscode-analytics /etc/"
when 'tier'
  execute "scp -i /root/.ssh/insecure_private_key -o StrictHostKeyChecking=no -r root@backend.example.com:/etc/opscode-analytics /etc/"
end
