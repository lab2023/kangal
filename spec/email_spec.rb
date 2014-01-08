require 'spec_helper'

class User < SpecModel
  validates :email, email: true
end

describe 'Email format' do

  let(:invalid_emails) { %w(invalid email) }
  let(:valid_emails)   { %w(info@lab2023.com abc@ab.com) }

  it 'should be invalid' do
    invalid_emails.each { |email|  User.new(email: email).valid?.should be_false }
  end

  it 'should be valid' do
    valid_emails.each { |email| User.new(email: email).valid?.should be_true }
  end

end