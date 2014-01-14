require 'spec_helper'

describe Table do
  it 'has a valid factory' do
    (create :table).should be_valid
  end

  it 'requires a name' do
    (build :table, name: nil).should_not be_valid
  end

  it 'exports to CSV' do
    require 'csv'
    table = create :table
    csv = Table.to_csv(table)
    csv.to_s.should eq "header1,header2,header3\n1,2,3\n4,5,6\n7,8,9\n"
  end
end
