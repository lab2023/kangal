require 'spec_helper'

class CompanyDetail < SpecModel
  validates :tax, tax_number: true
end

describe 'tax number format' do

  let(:invalid_tax_numbers) do
    %w(1 3 434542345678 43454234567)
  end

  let(:valid_tax_numbers) do
    %w(2640020928 6120069217)
  end

  it 'should be invalid' do
    invalid_tax_numbers.each { |tax|  CompanyDetail.new(tax: tax).valid?.should be_false }
  end

  it 'should be valid' do
    valid_tax_numbers.each { |tax| CompanyDetail.new(tax: tax).valid?.should be_true }
  end
end