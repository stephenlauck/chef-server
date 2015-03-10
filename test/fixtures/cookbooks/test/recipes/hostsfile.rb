hostsfile_entry '33.33.33.10' do
  hostname  node['chef-server']['api_fqdn']
  unique    true
end

hostsfile_entry '33.33.33.11' do
  hostname  node['chef-server']['analytics']['fqdn']
  unique    true
end