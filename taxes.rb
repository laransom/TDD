require 'csv'


class Taxes
  def initialize(first_name,last_name,annual_income,tax_paid,tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
    @people = []
  end
  #attr_reader :first_name :last_name :annual_income :tax_rate :tax_paid

  def csv_reader
    CSV.foreach("tdd.csv", headers: true) do |row|
      @people << {first_name:row[0], last_name:row[1], annual_income:row[2], tax_rate:row[3], tax_paid:row[4]}
    end
  end

  def taxman
  end

 def plus_or_minus
 end

end


puts people