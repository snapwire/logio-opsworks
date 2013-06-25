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
    owner 'ec2-user'
    group 'ec2-user'
    variables({
        :host => '0.0.0.0',
        :port => 8998,
        :user => '',
        :pass => ''
    })
end

template "/home/ec2-user/.log.io/log_server.conf" do
    source "log.conf.erb"
    action :create
    mode "644"
    owner 'ec2-user'
    group 'ec2-user'
    variables({
        :host => '0.0.0.0',
        :port => 8998
    })
end

# start command
execute "log.io-server start"