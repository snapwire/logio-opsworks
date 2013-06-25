# add iptables rule for the file in templates/default/port_logio.erb
# iptables_rule "port_logio"
directory "/home/e2-user/.log.io" do
  action :create
  mode 0755
  owner 'ec2-user'
  group 'ec2-user'
end

template "/home/e2-user/.log.io/web_server.conf" do
    source "server.conf.erb"
    action :create
    mode "644"
    variables({
        :port => 8998,
        :user => '',
        :pass => ''
    })
end
# stop command
execute "log.io-server stop"

# start command
execute "log.io-server start"