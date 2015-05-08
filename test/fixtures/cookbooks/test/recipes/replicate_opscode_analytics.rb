# replicate /etc/opscode from bootstrap backend to frontend server

include_recipe 'test::setup_ssh_keys'

case node['chef-server']['topology']
when 'standalone'
  execute "scp -i /root/.ssh/insecure_private_key -o StrictHostKeyChecking=no -r root@33.33.33.10:/etc/opscode-analytics /etc/"
when 'tiered'
  execute "scp -i /root/.ssh/insecure_private_key -o StrictHostKeyChecking=no -r root@33.33.33.12:/etc/opscode-analytics /etc/"
end
