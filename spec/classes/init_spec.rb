require 'spec_helper'
describe 'privileges' do

  context 'with defaults for all parameters' do
    it { should contain_class('privileges') }
  end
end
