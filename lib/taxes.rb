require 'CSV'
require 'pry'

class Taxes
  attr_accessor :tax_difference
  attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate
  def initialize(first_name, last_name, annual_income, tax_paid, tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
    @tax_difference = self.tax_calculator
  end

  def format_currency(value)
    "$#{sprintf('%.2f', value.to_f.abs)}"
  end

  def tax_rate
    @tax_rate * 0.01
  end

  def tax_calculator
    (@annual_income * self.tax_rate) - @tax_paid
  end

  def refund?
    if @tax_difference > 0
      false
    else
      true
    end
  end


  def print_out
    if refund?
      @first_name + ' ' + @last_name + ' will receive a refund of ' + format_currency(@tax_difference)
    else
      @first_name + ' ' + @last_name + ' owes ' + format_currency(@tax_difference) + ' in taxes'
    end
  end

end


tax_returns = []
CSV.foreach("../tdd.csv", headers: true) do |row|
  tax_returns << Taxes.new(row[0], row[1], row[2].to_f, row[3].to_f, row[4].to_f)
end


