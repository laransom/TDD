require 'csv'
#
#
class Taxes
  def initialize(first_name,last_name,annual_income,tax_paid,tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
    @people = []
  end
  attr_accessor :first_name :last_name :annual_income :tax_rate :tax_paid
end
#
#  def csv_reader
#    CSV.foreach("tdd.csv", headers: true) do |row|
#      @people << self.new ( {first_name:row[0], last_name:row[1], annual_income:row[2], tax_rate:row[3], tax_paid:row[4]} )
#    end
#  end
#
#  def instantiate
#
#  end
#
#  def taxman
#  end
#
# def plus_or_minus
# end
#
#end
#
people = []
CSV.foreach("tdd.csv", headers: true) do |row|
      people << Taxes.new({first_name:row[0], last_name:row[1], annual_income:row[2], tax_rate:row[3], tax_paid:row[4]})
    end
puts people