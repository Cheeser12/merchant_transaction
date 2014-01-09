class Table < ActiveRecord::Base
  serialize :headers
  serialize :rows
end
