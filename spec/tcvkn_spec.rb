require 'spec_helper'

class CompanyDetail < SpecModel
  validates :tax, tcvkn: true
end

describe 'tax number format' do

  let(:invalid_tcvkn) { %w(1 3 434542345678 43454234567) }
  let(:valid_tcvkn)  { %w(2640020928 6120069217) }

  it 'should be invalid' do
    invalid_tcvkn.each { |tax| expect( CompanyDetail.new(tax: tax).valid?).to be false }
  end

  it 'should be valid' do
    valid_tcvkn.each { |tax| expect(CompanyDetail.new(tax: tax).valid?).to be true }
  end
end