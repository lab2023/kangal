require 'spec_helper'

class Server < SpecModel
  validates  :ip, ip: true
end

describe 'Ip format' do

  let(:invalid_ips) do
    %w(
      10.10.10
      10.10
      10
      a.a.a.a
      10.0.0.a
      10.10.10.256
      10.10.10.256
      999.10.10.20
      2222.22.22.22
      22.2222.22.2
    )
  end

  let(:valid_ips) do
    %w(
      1.1.1.1
      255.255.255.255
      192.168.1.1
      10.10.1.1
      132.254.111.10
      26.10.2.10
      127.0.0.1
    )
  end

  it 'should be invalid' do
    invalid_ips.each { |ip|  Server.new(ip: ip).valid?.should be_false }
  end

  it 'should be valid' do
    valid_ips.each { |ip|  Server.new(ip: ip).valid?.should be_true }
  end

end