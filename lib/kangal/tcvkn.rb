require 'active_model'
require 'active_model/validations'

class TcvknValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)

    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?


    digits = value[0..-2].each_char.map(&:to_i).each_with_index

    checksum =
      digits.reduce(0) do |memo, (digit, idx)|
        rev_idx = 9 - idx
        coeff = [1, 2, 4, 8, 7, 5][rev_idx % 6]
        result = (digit + rev_idx) % 10

        if result.nonzero?
          result = (coeff * result) % 9
          result = 9 if result.zero?
        end
        memo += result
      end

    valid = !invalid_value?(value, 10) && ((checksum + value[-1].to_i) % 10 == 0)

    object.errors.add attribute, (options[:message] || I18n.t(:invalid, :scope => 'kangal.validations.tax_number')) unless valid
  end

  private

  def invalid_value?(str, length)
    str.nil? || str.length != length || !numeric?(str)
  end

  def numeric?(str)
    !!(str =~ /\A[[:digit:]]+\Z/)
  end
end