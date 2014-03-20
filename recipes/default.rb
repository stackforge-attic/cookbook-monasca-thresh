# The user/group thresh are created by the package, as well as /etc/mon/
package 'mon-thresh' do #The package depends on openjdk-7-jre-headless
  action :upgrade
end

service 'mon-thresh' do
  action :enable
  provider Chef::Provider::Service::Upstart
end

# Create the log file directory
directory node[:mon_thresh][:log_dir] do
    action :create
    recursive true
    owner 'thresh'
    group 'thresh'
    mode 0755
end


file '/etc/default/mon-thresh' do
    action :create
    owner 'root'
    group 'root'
    mode 0644
    content "export LOGDIR=#{node[:mon_thresh][:log_dir]}"
end

# todo - I need an encrypted credentials data bag
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
