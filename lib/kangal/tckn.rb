require 'active_model'
require 'active_model/validations'

class TcknValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)

    return if options[:allow_nil] && value.nil?
    return if options[:allow_blank] && value.blank?

    digits = value[0..-3].each_char.map(&:to_i).each_with_index
    first, last =
        digits.reduce([0, 0]) do |memo, (digit, idx)|
          add = digit * (idx.even? ? 7 : -1)
          [
              (memo.first + add) % 10,
              (memo.last + digit + add) % 10
          ]
        end

    valid = (!invalid_value?(value, 11) && value[-2] == first.to_s && value[-1] == last.to_s)
    record.errors.add attribute, (options[:message] || I18n.t(:invalid, :scope => 'kangal.validations.tckn')) unless valid
  end

  private

  def invalid_value?(str, length)
    str.nil? || str.length != length || !numeric?(str)
  end

  def numeric?(str)
    !!(str =~ /\A[[:digit:]]+\Z/)
  end
end