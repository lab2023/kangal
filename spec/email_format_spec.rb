require 'spec_helper'

class User < SpecModel
  validates :email, email_format: true
end

describe 'Email format' do
  it 'should be invalid' do
    pending
  end
  it 'should be valid' do
    pending
  end
end