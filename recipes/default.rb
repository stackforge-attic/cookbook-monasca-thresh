# encoding: UTF-8
#
# The user/group thresh are created by the package, as well as /etc/monasca/
package 'monasca-thresh' do # The package depends on openjdk-7-jre-headless
  action :upgrade
end

service 'monasca-thresh' do
  action :enable
end

# TODO: an encrypted credentials data bag
credentials = { 'mysql' => { 'user' => 'thresh', 'password' => 'password' } }
settings = data_bag_item(node[:monasca_thresh][:data_bag], 'monasca_thresh')

template '/etc/monasca/thresh-config.yml' do
  action :create
  owner 'root'
  group 'thresh'
  mode '640'
  source 'thresh-config.yml.erb'
  variables(
    credentials: credentials,
    settings: settings
  )
  notifies :restart, 'service[monasca-thresh]'
end
