require 'active_model'
require 'active_model/validations'

class TaxNumberValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    valid = true
    val = value.to_s
    if val.size == 10
      val1 = Array.new
      val2 = Array.new
      last_digit = val[9].to_i

      (0..8).each do |index|
        val1 << ((val[index].to_i + (9 - index)) % 10).to_i
      end

      (0..8).each do |index|
        val2 << ((val1[index].to_i * (2 ** (9 - index))) % 9).to_i
      end

      (0..8).each do |index|
        val2[index] = 9 if (val1[index] != 0 && val2[index] == 0)
      end

      sum = 0

      (0..8).each do |index|
        sum += val2[index]
      end

      if (sum % 10) == 0
        sum = 0
      else
        sum = 10 - (sum % 10)
      end

      valid = (sum == last_digit)

    else
      valid = false
    end
    record.errors.add attribute, (options[:message] || I18n.t(:invalid, :scope => 'kangal.validations.tax_number')) unless valid
  end
end