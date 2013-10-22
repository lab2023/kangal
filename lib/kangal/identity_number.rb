require 'active_model'
require 'active_model/validations'

class IdentityNumberValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    valid = true
    val = value.to_s
    if val.size == 11 && val[0].to_i != 0
      valid = check_tenth_character(val)
      valid = check_eleventh_character(val)
      valid = double_check_eleventh_character(val)
    else
      valid = false
    end

    record.errors.add attribute, (options[:message] || I18n.t(:invalid, :scope => 'kangal.validations.identity_number')) unless valid
  end

  private

  def check_eleventh_character(val)
    sum = 0
    (0..9).each do |counter|
      sum += val[counter].to_i
    end

    val[10].to_i == sum % 10
  end

  def check_tenth_character(val)
    odd_sum = 0
    even_sum = 0
    (0..8).each do |counter|
      if counter.even?
        odd_sum += val[counter].to_i
      else
        even_sum += val[counter].to_i
      end
    end
    val[9].to_i == ((odd_sum*7 + even_sum*9)%10)
  end

  def double_check_eleventh_character(val)
    sum = 0
    (0..8).each do |counter|
      if counter.even?
        sum += val[counter].to_i
      end
    end
    val[10].to_i == ((sum*8)%10)
  end

end