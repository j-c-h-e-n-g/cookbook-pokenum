# Recipe:: default
#

%w{libpoker-eval libpoker-eval-dev php5-dev php5-cli git}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

template '/etc/php5/cli/php.ini' do
  source 'php.ini.erb'
  mode 0440
  owner "root"
  group "root"
end

template '/tmp/test.php' do
  source 'test.php.erb'
  mode 0440
  owner "root"
  group "root"
end

execute "git-clone-pokenum-php" do
  cwd "/tmp"
  command "git clone https://github.com/j-c-h-e-n-g/pokenum-php.git"
  action :run
  not_if { ::File.exists?("/tmp/pokenum-php") }
end
 
execute "phpize" do
  cwd "/tmp/pokenum-php"
  command "/usr/bin/phpize"
  action :run
  not_if { ::File.exists?("/var/run/pokenum.installed") }
end 

execute "configure" do 
  cwd "/tmp/pokenum-php"
  command "./configure --enable-pokenum"
  action :run
  not_if { ::File.exists?("/var/run/pokenum.installed") }
end 

execute "make" do 
  cwd "/tmp/pokenum-php"
  command "make"
  action :run
  not_if { ::File.exists?("/var/run/pokenum.installed") }
end

execute "make-install" do 
  cwd "/tmp/pokenum-php"
  command "make install"
  action :run
  not_if { ::File.exists?("/var/run/pokenum.installed") }
end

execute "make-install" do 
  command "touch /var/run/pokenum.installed"
  action :run
  not_if { ::File.exists?("/var/run/pokenum.installed") }
end



