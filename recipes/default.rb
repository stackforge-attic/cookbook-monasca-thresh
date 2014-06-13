# The user/group thresh are created by the package, as well as /etc/mon/
package 'mon-thresh' do #The package depends on openjdk-7-jre-headless
  action :upgrade
end

service 'mon-thresh' do
  action :enable
end

# todo - an encrypted credentials data bag
credentials = { 'mysql' => { 'user' => 'thresh', 'password' => 'password'}}
settings = data_bag_item(node[:mon_thresh][:data_bag], 'mon_thresh')

template '/etc/mon/mon-thresh-config.yml' do
  action :create
  owner 'root'
  group 'thresh'
  mode '640'
  source 'mon-thresh-config.yml.erb'
  variables(
    :credentials => credentials,
    :settings => settings
  )
  notifies :restart, "service[mon-thresh]"
end
