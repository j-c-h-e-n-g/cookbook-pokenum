
# in the case of rhel/centos need to install by source! 
# default['pokenum']['pokereval_version'] = '134.0'
#default['pokenum']['pokereval_file'] = "poker-eval-#{node['pokenum']['pokereval_version'}.tar.gz"
# default['pokenum']['pokereval_src_url'] = "http://download.gna.org/pokersource/poker-eval/gnulinux/fedora/fc5/src/redhat/SOURCES/#{node['pokenum']['pokereval_file']}"

default['pokenum']['pokereval_src_url'] = "http://download.gna.org/pokersource/poker-eval/gnulinux/fedora/fc5/src/redhat/SOURCES/poker-eval-134.0.tar.gz"

# for one reason or another, there are poker-eval packages for ubuntu but centos/rhel cannot
# be easily found. someone (me?) will have to make them eventually? for now need to install
# by source for centos/rhel :(

case node['platform_family']
when 'debian'
  default['pokenum']['packages'] = %w(libpoker-eval libpoker-eval-dev php5-dev php5-cli git) 
  default['pokenum']['phpini_path'] = '/etc/php5/cli/php.ini'
when 'rhel'
  default['pokenum']['packages'] = %w(git make gcc-c++ php php-devel) 
  default['pokenum']['phpini_path'] = '/etc/php.ini'
end
 
