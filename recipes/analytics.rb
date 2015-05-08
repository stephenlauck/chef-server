# isntall analytics but do not run reconfigure
chef_server_ingredient 'opscode-analytics' do
  action [:install]
end

directory '/etc/opscode-analytics' do
  recursive true
end
# copy actions-source.json and webui_priv.pem from chef server

# write out /etc/opscode/opscode-analytics.rb 
# opscode-analytics-ctl reconfigure
template '/etc/opscode-analytics/opscode-analytics.rb' do
  source 'opscode-analytics.rb.erb'
  owner 'root'
  group 'root'
  variables(
    :chef_servers => node['chef-server']['servers']
  )
  action :create
  notifies :reconfigure, 'chef_server_ingredient[opscode-analytics]'
end
