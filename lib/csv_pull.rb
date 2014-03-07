require 'csv'
require 'pry'

class CreateData
  attr_reader :data
  def initialize(data = [])
    @data = data
  end

  def pull_from_csv
    CSV.foreach("../tdd.csv", headers: true) do |row|
     @data << {first_name: row[0], last_name: row[1], annual_income: row[2].to_f, tax_paid: row[3].to_f, tax_rate: row[4].to_f}
    end
    @data
  end
end


