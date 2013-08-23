require 'spec_helper'

class Company < SpecModel
  validates  :subdomain, subdomain: true
end

describe 'Subdomain format' do

  let(:invalid_subdomains) do
    %w(-lab2023 https, ab)
  end

  let(:valid_subdomains) do
    %w(lab2023 lab2023-internet)
  end

  it 'should be invalid' do
    invalid_subdomains.each { |subdomain|  Company.new(subdomain: subdomain).valid?.should be_false }
  end

  it 'should be valid' do
    valid_subdomains.each { |subdomain|  Company.new(subdomain: subdomain).valid?.should be_true }
  end

end