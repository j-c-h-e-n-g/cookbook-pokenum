



# for one reason or another, there are poker-eval packages for ubuntu but centos/rhel cannot
# be easily found. someone (me?) will have to make them eventually? for now need to install
# by source for centos/rhel :(

case node['platform_family']
when 'debian'
  default['pokenum']['packages'] = %w(libpoker-eval libpoker-eval-dev php5-dev php5-cli git) 
when 'rhel'
  default['pokenum']['packages'] = %w(git make gcc-c++ php php-devel) 
end 
