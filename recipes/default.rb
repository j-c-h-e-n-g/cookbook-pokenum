# Recipe:: default

node['pokenum']['packages'].each do |pkg|
  package pkg
end

template node['pokenum']['phpini_path'] do
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
  command "git clone https://github.com/steevel/pokenum-php"
  action :run
  not_if { ::File.exists?("/tmp/pokenum-php") }
end
 
bash "install pokenum php module" do 
  cwd "/tmp/pokenum-php"

  code <<-EOH
    /usr/bin/phpize
    ./configure --enable-pokenum
    make
    make install 
    touch /var/run/pokenum.installed
    EOH

  action :run
  not_if { ::File.exists?("/var/run/pokenum.installed") }
end 



