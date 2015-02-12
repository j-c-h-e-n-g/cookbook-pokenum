

case node['platform_family']
when 'debian'
  default['pokenum']['packages'] = %w(libpoker-eval libpoker-eval-dev php5-dev php5-cli git) 
when 'rhel'
  default['pokenum']['packages'] = %w(git make gcc-c++ php php-devel) 
end 
