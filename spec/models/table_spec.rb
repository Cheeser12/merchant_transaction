require 'spec_helper'

describe Table do
  it 'has a valid factory' do
    (create :table).should be_valid
  end
  it 'requires a name' do
    (build :table, name: nil).should_not be_valid
  end
end
