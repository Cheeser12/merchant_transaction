FactoryGirl.define do
  factory :table do |t|
    t.name "TestTable"
    t.headers ["header1", "header2", "header3"]
    t.rows [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
  end
end
