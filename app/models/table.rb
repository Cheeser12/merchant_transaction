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

  def Table.import(file)
    table = new
    table.name = File.basename(file.original_filename, File.extname(file.original_filename))
    Table.parse_csv(table, file)
    table.save
  end

  private

  def Table.parse_csv(table, file)
    data = []
    CSV.foreach(file.path) {|row| data << row.to_a}
    table.headers = data.first
    table.rows = data[1..-1]
  end
end
