execute 'npm install -g log.io --user "ec2-user"'

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