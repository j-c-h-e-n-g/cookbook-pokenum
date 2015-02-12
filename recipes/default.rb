# Recipe:: default
#


node['pokenum']['packages'].each do |ntppkg|
  package ntppkg
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

if node['platform_family'] == 'rhel' 

  execute "download poker-eval source" do
    cwd "/tmp"
    command "wget #{node['pokenum']['pokereval_src_url']} && tar xvfz poker-eval-134.0.tar.gz"
    action :run
    not_if { ::File.exists?("/tmp/pokenum-php") }
  end
 

  bash "install pokenum php module" do 
    cwd "/tmp/poker-eval-134.0"

    code <<-EOH
      ./configure
      make
      make install
      EOH

    action :run
    not_if { ::File.exists?("/tmp/pokenum-php") }
  end 


end 

execute "git-clone-pokenum-php" do
  cwd "/tmp"
  command "git clone https://github.com/j-c-h-e-n-g/pokenum-php.git"
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



