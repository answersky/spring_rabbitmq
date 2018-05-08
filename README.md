#spring_rabbitmq

rabbitmq 安装
    
   下载地址： http://www.rabbitmq.com/download.html 
   
   下载erlang环境：http://www.rabbitmq.com/releases/erlang/erlang-18.1-1.el6.x86_64.rpm
    
重启服务：
net stop RabbitMQ && net start RabbitMQ

查看已有用户及用户的角色：

rabbitmqctl.bat list_users


新增一个用户：

rabbitmqctl.bat add_user username password


变成 “超级管理员” 角色：

rabbitmqctl.bat set_user_tags username administrator

设置vhost
 rabbitmqctl add_vhosts test_host

用户赋权
rabbitmqctl  set_permissions -p /vhost1  user_admin '.*' '.*' '.*' 