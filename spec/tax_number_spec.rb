require 'spec_helper'

class CompanyDetail < SpecModel
  validates :tax, tax_number: true
end

describe 'tax number format' do

  let(:invalid_tax_numbers) { %w(1 3 434542345678 43454234567) }
  let('valid_tax_numbers')  { %w(2640020928 6120069217) }

  it 'should be invalid' do
    invalid_tax_numbers.each { |tax|  expect(CompanyDetail.new(tax: tax).valid?).to be false }
  end

  it 'should be valid' do
    valid_tax_numbers.each { |tax| expect(CompanyDetail.new(tax: tax).valid?).to be true }
  end
end