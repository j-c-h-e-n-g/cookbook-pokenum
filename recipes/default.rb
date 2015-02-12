# Recipe:: default
#


# centos 6.5 specific 
%w{git make gcc-c++ php php-devel}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

template '/etc/php.ini' do
  source 'php.ini.erb'
  mode 0440
  owner "root"
  group "root"
end

#template '/etc/php5/cli/php.ini' do
#  source 'php.ini.erb'
#  mode 0440
#  owner "root"
#  group "root"
#end

template '/tmp/test.php' do
  source 'test.php.erb'
  mode 0440
  owner "root"
  group "root"
end

execute "download poker-eval source" do
  cwd "/tmp"
  command "wget http://download.gna.org/pokersource/poker-eval/gnulinux/fedora/fc5/src/redhat/SOURCES/poker-eval-134.0.tar.gz && tar xvfz poker-eval-134.0.tar.gz"
  action :run
  not_if { ::File.exists?("/tmp/pokenum-php") }
end
 
execute "source installation of poker-eval" do
  cwd "/tmp/poker-eval-134.0"
  command "./configure && make && make install"
  action :run
  not_if { ::File.exists?("/tmp/pokenum-php") }
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



