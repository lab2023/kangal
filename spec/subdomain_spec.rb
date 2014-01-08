require 'spec_helper'

class Company < SpecModel
  validates  :subdomain, subdomain: true
end

class Account < SpecModel
  validates :subdomain, subdomain: {reserved: %w{help reserved_word}}
end

describe 'Subdomain format' do

  let(:invalid_subdomains)  { %w(-lab2023 https ab) }
  let(:valid_subdomains)    { %w(lab2023 lab2023-internet) }

  it 'should be invalid' do
    invalid_subdomains.each { |subdomain|  Company.new(subdomain: subdomain).valid?.should be_false }
  end

  it 'should be valid' do
    valid_subdomains.each { |subdomain|  Company.new(subdomain: subdomain).valid?.should be_true }
  end

  it 'should be invalid because of reserved' do
    account = Account.new(subdomain: 'reserved_word')
    account.valid?
    account.errors.messages[:subdomain].should include(I18n.t(:reserved, scope: 'kangal.validations.subdomain'))
  end

  it 'should be valid because of reserved' do
    Account.new(subdomain: 'unreservedword').valid?.should be_true
  end

end