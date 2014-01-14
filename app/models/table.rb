class Table < ActiveRecord::Base
  serialize :headers
  serialize :rows
  validates_presence_of :name
end
