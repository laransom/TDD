require 'rspec'
require_relative '../lib/taxes.rb'

describe Taxes do

  describe 'tax return' do
    let(:person) {Taxes.new('Sterling', 'Archer', 500000.0, 100.0, 30.0)}

    it 'First name is a string' do
      expect(person.first_name.class).to eq(String)
    end

    it 'Last name is a string' do
      expect(person.last_name.class).to eq(String)
    end

    it 'Income is greater than zero' do
      expect(person.annual_income.class).to eq(Float)
      expect(person.annual_income).should >= 0
    end

    it 'Tax paid is greater than zero' do
      expect(person.tax_paid.class).to eq(Float)
      expect(person.tax_paid).should >= 0
    end

    it 'Tax rate is greater than zero' do
      expect(person.tax_rate.class).to eq(Float)
      expect(person.tax_rate).should >= 0
    end

    it 'Tax rate is less than one' do
      expect(person.tax_rate).should <= 1
    end

    it 'Print out is a string' do
      expect(person.print_out.class).to eq(String)
    end
  end

  describe 'refund?' do
    it 'Refund is true if the person has paid too much in tax' do
      person = Taxes.new('Lana', 'Kane', 100000, 60000, 50)
      expect(person.refund?).to eq(true)
    end
    it 'Refund is false if person hasn\'t paid enough taxes' do
      person = Taxes.new('Sterling', 'Archer', 500000, 100, 30)
      expect(person.refund?).to eq(false)
    end
  end

end

