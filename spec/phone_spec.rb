require 'spec_helper'

class Phone < SpecModel
  validates :number, phone: true
end

class PhoneTr < SpecModel
  validates :number, phone: {tr: true}
end

class PhoneTrMobile < SpecModel
  validates :number, phone: {tr_and_mobile: true}
end

class PhoneTrNormal < SpecModel
  validates :number, phone: {tr_and_normal: true}
end

describe 'Phone format' do

  let(:valid_phone) do
    %w(
      905532620000
      902122120000
    )
  end

  let(:invalid_phone) do
    %w(
      abde
      1234
      12341234123443434
    )
  end

  it 'should be valid' do
    valid_phone.each { |number| Phone.new(number: number).valid?.should be_true }
  end

  it 'should be invalid' do
    invalid_phone.each { |number| Phone.new(number: number).valid?.should be_false }
  end

  let(:valid_tr) do
    %w(
      905326200000
      908508850000
    )
  end

  let(:invalid_tr) do
    %w(
      +1231231233200
      00100000000000
    )
  end

  it 'should be valid with tr option' do
    valid_tr.each { |tr_phone| PhoneTr.new(number: tr_phone).valid?.should be_true }
  end

  it 'should be invalid with tr option' do
    invalid_tr.each { |tr_phone| PhoneTr.new(number: tr_phone).valid?.should be_false }
  end

  it 'should be valid with tr and mobile option' do

  end

  it 'should be invalid with tr and mobile option' do

  end

  it 'should be valid with tr and normal option' do

  end

  it 'should be invalid with tr and normal option' do

  end

end