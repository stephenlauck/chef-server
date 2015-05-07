hostsfile_entry '33.33.33.10' do
  hostname  node['chef-server']['api_fqdn']
  unique    true
end

hostsfile_entry '33.33.33.12' do
  hostname  'backend.example.com'
  unique    true
end

hostsfile_entry '33.33.33.13' do
  hostname  'frontend.example.com'
  unique    true
end