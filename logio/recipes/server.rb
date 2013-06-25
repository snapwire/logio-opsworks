# add iptables rule for the file in templates/default/port_logio.erb
# iptables_rule "port_logio"

# stop command
execute "log.io-server stop"

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

# start command
execute "log.io-server start"