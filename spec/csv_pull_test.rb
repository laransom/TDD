require 'rspec'
require_relative '../lib/csv_pull'

describe CreateData do
  it 'The csv is populating properly' do
    expect(CreateData.new.pull_from_csv).to_not eq(nil)
  end
  it 'First name is a string' do
    expect(CreateData.new.pull_from_csv[0][:first_name].class).to eq(String)
  end
  it 'Last name is a string' do
    expect(CreateData.new.pull_from_csv[0][:last_name].class).to eq(String)
  end
  it 'Income is greater than zero' do
     expect(CreateData.new.pull_from_csv[0][:annual_income]).should > 0
  end
  it 'Tax Rate is greater than zero' do
    expect(CreateData.new.pull_from_csv[0][:tax_rate]).should > 0
  end
  it 'Tax paid is greater than zero' do
    expect(CreateData.new.pull_from_csv[0][:tax_rate]).should > 0
  end
end
