require 'spec_helper'

class User < SpecModel
  validates :identity, identity_number: true
end

describe 'Identity number format' do

  let(:invalid_identity_numbers) do
    %w(1 3 434542345678)
  end

  let(:valid_identity_numbers) do
    %w(45641002990)
  end

  it 'should be invalid' do
    invalid_identity_numbers.each { |identity|  User.new(identity: identity).valid?.should be_false }
  end

  it 'should be valid' do
    valid_identity_numbers.each { |identity| User.new(identity: identity).valid?.should be_true }
  end
end