require 'spec_helper'

class User < SpecModel
  validates :email, email_format: true
end

describe 'Email format' do

  let(:invalid_emails) do
    %w(invalid email)
  end

  let(:valid_emails) do
    %w(info@lab2023.com abc@ab.com)
  end

  it 'should be invalid' do
    invalid_emails.each { |email|  User.new(email: email).valid?.should be_false }
  end

  it 'should be valid' do
    valid_emails.each { |email| User.new(email: email).valid?.should be_true }
  end

end