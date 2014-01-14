class Table < ActiveRecord::Base
  serialize :headers
  serialize :rows
  validates_presence_of :name

  def Table.to_csv(table)
    CSV.generate({headers: true}) do |csv|
      csv << table.headers
      table.rows.each do |row|
        csv << row
      end
    end
  end
end
