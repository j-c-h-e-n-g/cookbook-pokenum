require 'spec_helper'
require 'chefspec'

# libpoker-eval libpoker-eval-dev php5-dev php5-cli git



describe 'pokenum::default' do

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs php-related packages' do
    expect(chef_run).to install_package('php5-dev')
    expect(chef_run).to install_package('php5-cli')
  end

  it 'installs git' do
    expect(chef_run).to install_package('git')
  end

  it 'installs libpoker packages' do
    expect(chef_run).to install_package('libpoker-eval')
    expect(chef_run).to install_package('libpoker-eval-dev')
  end

end 
