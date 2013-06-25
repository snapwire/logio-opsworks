execute 'npm install -g log.io --user "ec2-user"'

directory "/home/ec2-user/.log.io" do
  action :create
  mode 0755
  owner 'ec2-user'
  group 'ec2-user'
end

template "/home/ec2-user/.log.io/web_server.conf" do
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