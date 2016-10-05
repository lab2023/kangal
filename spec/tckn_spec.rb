require 'spec_helper'

class Profile < SpecModel
  validates :identity, tckn: true
end

describe 'Tckn number format' do

  let(:invalid_tckn)  { %w(1 3 434542345678) }
  let(:valid_tckn)    { %w(21432692144 55679901158 83317527040) }

  it 'should be invalid' do
    invalid_tckn.each { |identity|  expect(Profile.new(identity: identity).valid?).to be false }
  end

  it 'should be valid' do
    valid_tckn.each { |identity| expect(Profile.new(identity: identity).valid?).to be true }
  end
end